// Pause check
if (instance_exists(oPause) && oPause.paused) exit;

// Start parry
if (keyboard_check_pressed(ord("K")) && parry_timer <= 0)
{
    parry_timer = parry_duration;
    is_parrying = true;
    
    image_xscale *= -1; // flip sprite
}

// Combat cooldown timer
if (combat_cooldown > 0) combat_cooldown--;

// Apply knockback movement
if (knockback_timer > 0)
{
    move_and_collide(knockback_x, knockback_y, tilemap);
    knockback_timer--;
    exit;
}

// Movement input
xsp = 0;
ysp = 0;

var _h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

xsp = _h * 3;
ysp = _v * 3;

// Gravity when outside water
var in_water = place_meeting(x, y, oWater);

if (!in_water)
{
    fall_speed += gravity_strength;
    fall_speed = clamp(fall_speed, 0, max_fall);
    ysp += fall_speed;
}
else
{
    fall_speed = 0;
}
// Current push
// Current push
var current = instance_place(x, y, oCurrent);

if (current != noone)
{
    xsp -= current.push_strength;
}
// Apply movement with collisions
move_and_collide(xsp, ysp, tilemap);

// Sprite facing direction (based on input only)
if (_h != 0)
{
    image_xscale = sign(_h);
}

// Room progression
if (place_meeting(x, y, oCoin))
{
    room_goto_next();
}

// Player damage flash handling
if (damage_flash > 0)
{
    damage_flash--;
    if (damage_flash <= 0) image_blend = c_white;
}

// Parry timer countdown
if (parry_timer > 0)
{
    parry_timer--;
    
    if (parry_timer <= 0)
    {
        is_parrying = false;
        image_xscale *= -1; // flip back
    }
}

// Combat detection (body collision system)
var list = ds_list_create();

// Size of attack box
var hit_w = 16;
var hit_h = 16;

// Position box in front of fish
var hit_x1, hit_x2;

if (image_xscale > 0) // facing right
{
    hit_x1 = bbox_right;
    hit_x2 = bbox_right + hit_w;
}
else // facing left
{
    hit_x1 = bbox_left - hit_w;
    hit_x2 = bbox_left;
}

var hit_y1 = y - hit_h/2;
var hit_y2 = y + hit_h/2;

// Collect enemies inside rectangle
var count = collision_rectangle_list(
    hit_x1, hit_y1,
    hit_x2, hit_y2,
    oEnemy_Parent,
    false,
    false,
    list,
    false
);

for (var i = 0; i < count; i++)
{
    var enemy = list[| i];
    if (!instance_exists(enemy)) continue;

    if (combat_cooldown <= 0 && enemy.combat_cooldown <= 0)
    {
        // Player stronger → enemy knocked back
        if (damage > enemy.damage)
        {
            enemy.hp -= damage;
            enemy.damage_flash = 10;

            var kdir = point_direction(x, y, enemy.x, enemy.y);
            enemy.knockback_x = lengthdir_x(4, kdir);
            enemy.knockback_y = lengthdir_y(4, kdir);
            enemy.knockback_timer = 10;

            combat_cooldown = 20;
            enemy.combat_cooldown = 20;

            if (enemy.hp <= 0)
            {
                damage += enemy.reward_damage;
                instance_destroy(enemy);
            }
        }

 
 else if (damage < enemy.damage)
{
    // If parrying, reflect damage
    if (is_parrying)
    {
        enemy.hp -= enemy.damage;
        enemy.damage_flash = 10;

        var kdir = point_direction(x, y, enemy.x, enemy.y);
        enemy.knockback_x = lengthdir_x(6, kdir);
        enemy.knockback_y = lengthdir_y(6, kdir);
        enemy.knockback_timer = 12;

        if (enemy.hp <= 0)
        {
            damage += enemy.reward_damage;
            instance_destroy(enemy);
        }

        combat_cooldown = 20;
        enemy.combat_cooldown = 20;
    }
    else
    {
        // Normal damage
        hp -= enemy.damage;
        damage_flash = 10;
        image_blend = c_red;

        var kdir = point_direction(enemy.x, enemy.y, x, y);
        knockback_x = lengthdir_x(4, kdir);
        knockback_y = lengthdir_y(4, kdir);
        knockback_timer = 10;

        combat_cooldown = 20;
        enemy.combat_cooldown = 20;

        if (hp <= 0) room_restart();
    }
}

        // Equal damage → both knock back
        else
        {
            hp -= enemy.damage;
            enemy.hp -= damage;

            var dir1 = point_direction(enemy.x, enemy.y, x, y);
            var dir2 = point_direction(x, y, enemy.x, enemy.y);

            knockback_x = lengthdir_x(3, dir1);
            knockback_y = lengthdir_y(3, dir1);
            knockback_timer = 8;

            enemy.knockback_x = lengthdir_x(3, dir2);
            enemy.knockback_y = lengthdir_y(3, dir2);
            enemy.knockback_timer = 8;

            combat_cooldown = 20;
            enemy.combat_cooldown = 20;
        }
    }
}

ds_list_destroy(list);