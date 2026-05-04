// Tilemap setup
if (tilemap == -1)
{
    var lay = layer_get_id("Tiles_Col");
    if (lay != -1)
        tilemap = layer_tilemap_get_id(lay);
}

// Pause
if (instance_exists(oPause) && oPause.paused) exit;
if (variable_global_exists("qte_active") && global.qte_active) exit;
// Cooldowns
if (combat_cooldown > 0) combat_cooldown--;

// Knockback
if (knockback_timer > 0)
{
    move_and_collide(knockback_x, knockback_y, tilemap);
    knockback_timer--;
    exit;
}

// Damage flash
if (damage_flash > 0)
{
    damage_flash--;
    image_blend = c_red;
    if (damage_flash <= 0) image_blend = c_white;
}

// Find player
var player = instance_find(oPlayer1, 0);
if (player == noone) player = instance_find(oPlayer2, 0);

// Detection
if (player != noone)
{
    var dist = point_distance(x, y, player.x, player.y);
    if (dist < distance_to_player)
        chase_timer = chase_duration;
}

// Chase or wander
if (chase_timer > 0 && player != noone)
{
    chase_timer--;
    target_x = player.x;
    target_y = player.y;
    move_speed = chase_speed;
}
else
{
    move_speed = base_speed;

    if (point_distance(x, y, target_x, target_y) < 4)
    {
        target_x = random_range(xstart - 100, xstart + 100);
        target_y = random_range(ystart - 100, ystart + 100);
    }
}

// Movement
var dir = point_direction(x, y, target_x, target_y);
var move_x = lengthdir_x(move_speed, dir);
var move_y = lengthdir_y(move_speed, dir);

// Slide around other enemies
if (!place_meeting(x + move_x, y + move_y, oEnemy_Parent))
{
    x += move_x;
    y += move_y;
}
else
{
    if (!place_meeting(x + move_x, y, oEnemy_Parent))
        x += move_x;

    if (!place_meeting(x, y + move_y, oEnemy_Parent))
        y += move_y;
}

// Wall collision
move_and_collide(0, 0, tilemap);