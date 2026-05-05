window_set_size(1280,720);

tilemap = layer_tilemap_get_id("Tiles_COl");

xsp = 0;
ysp = 0;

max_hp = 10;
hp = max_hp;

damage_flash = 0;

fall_speed = 0;
max_fall = 6;
gravity_strength = 0.15;

size_rank = 2;

damage_cooldown = 0;
combat_cooldown = 0;

knockback_x = 0;
knockback_y = 0;
knockback_timer = 0;

parry_timer = 0;
parry_duration = 15;
is_parrying = false;

attack_hitpause = 0;

is_attacking = false;
attack_timer = 0;
shock_timer = 0; 
if (!variable_global_exists("player_damage"))
{
    global.player_damage = 1;
}

damage = global.player_damage;