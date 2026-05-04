// Pause
if (instance_exists(oPause) && oPause.paused) exit;
if (variable_global_exists("qte_active") && global.qte_active) exit;
// Hit pause
if (attack_hitpause > 0)
{
    attack_hitpause--;
    exit;
}

// Movement input
var _h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Parry start
if (keyboard_check_pressed(ord("K")) && parry_timer <= 0)
{
    parry_timer = parry_duration;
    is_parrying = true;
    image_xscale *= -1;

    var tail_offset = -60 * image_xscale;
    var t = instance_create_layer(x + tail_offset, y, "Instances", oParryTrail);
    t.direction_flip = image_xscale;
}

// Cooldowns
if (combat_cooldown > 0) combat_cooldown--;
if (attack_timer > 0) attack_timer--;
else is_attacking = false;

// Parry timer
if (parry_timer > 0)
{
    parry_timer--;
    if (parry_timer <= 0)
    {
        is_parrying = false;
        image_xscale *= -1;
    }
}

// Knockback movement
if (knockback_timer > 0)
{
    move_and_collide(knockback_x, knockback_y, tilemap);
    knockback_timer--;
    exit;
}

// Movement
xsp = _h * 3;
ysp = _v * 3;

// Gravity
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
var current = instance_place(x, y, oCurrent);
if (current != noone)
{
    xsp -= current.push_strength;
}

// Apply movement
move_and_collide(xsp, ysp, tilemap);

// Face direction (not during parry)
if (_h != 0 && !is_parrying)
{
    image_xscale = sign(_h);
}

// Room progression
if (place_meeting(x, y, oCoin))
{
    room_goto_next();
}

// Damage flash
if (damage_flash > 0)
{
    damage_flash--;
    if (damage_flash <= 0) image_blend = c_white;
}

// Combat detection
var list = ds_list_create();

var hit_w = 16;
var hit_h = 16;

var hit_x1, hit_x2;

if (image_xscale > 0)
{
    hit_x1 = bbox_right;
    hit_x2 = bbox_right + hit_w;
}
else
{
    hit_x1 = bbox_left - hit_w;
    hit_x2 = bbox_left;
}

var hit_y1 = y - hit_h/2;
var hit_y2 = y + hit_h/2;

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
        // PLAYER STRONGER
        if (damage > enemy.damage)
        {
            enemy.hp -= damage;
            enemy.damage_flash = 10;

            var atk_dir = point_direction(x, y, enemy.x, enemy.y);

            x += lengthdir_x(4, atk_dir);
            y += lengthdir_y(4, atk_dir);

            enemy.knockback_x = lengthdir_x(10, atk_dir);
            enemy.knockback_y = lengthdir_y(10, atk_dir);
            enemy.knockback_timer = 12;

            attack_hitpause = 5;

            combat_cooldown = 20;
            enemy.combat_cooldown = 20;

            if (enemy.hp <= 0)
            {
                part_particles_create(global.ps, enemy.x, enemy.y, global.pt_bubble, 3);

                global.player_damage += enemy.reward_damage;
                damage = global.player_damage;

                instance_destroy(enemy);
            }
        }

        // ENEMY STRONGER
        else
        {
            if (is_parrying)
            {
                enemy.hp -= enemy.damage;
                enemy.damage_flash = 10;

                var atk_dir = point_direction(x, y, enemy.x, enemy.y);

                enemy.knockback_x = lengthdir_x(12, atk_dir);
                enemy.knockback_y = lengthdir_y(12, atk_dir);
                enemy.knockback_timer = 14;

                combat_cooldown = 20;
                enemy.combat_cooldown = 20;

                if (enemy.hp <= 0)
                {
                    part_particles_create(global.ps, enemy.x, enemy.y, global.pt_bubble, 3);

                    global.player_damage += enemy.reward_damage;
                    damage = global.player_damage;

                    instance_destroy(enemy);
                }
            }
            else
            {
                hp -= enemy.damage;
                damage_flash = 10;
                image_blend = c_red;

                var hit_dir = point_direction(enemy.x, enemy.y, x, y);

                knockback_x = lengthdir_x(10, hit_dir);
                knockback_y = lengthdir_y(10, hit_dir);
                knockback_timer = 12;

                combat_cooldown = 20;
                enemy.combat_cooldown = 20;
            }
        }
    }
}

ds_list_destroy(list);

// Player death
if (hp <= 0)
{
    room_restart();
}