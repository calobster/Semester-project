// Boss stats
max_hp = 80;
hp = max_hp;

// Fire control
fire_cooldown_max = 90; // frames between shots (90 @60fps = 1.5 sec)
fire_cooldown = fire_cooldown_max;

// Spawn offset (torpedo tube position)
tube_offset_x = -80; // left side of sub (adjust to your sprite)
tube_offset_y = 0;

// Optional: lock to right side if you want it auto-placed
// x = room_width - 200;
fire_cooldown_max = room_speed * 1; // 10 seconds
fire_cooldown = fire_cooldown_max;
damage_flash = 0;
dying = false;
death_timer = 0;
boss_touch_cd = 0;