// If dying, wait then go to victory
if (dying)
{
    if (damage_flash > 0)
    {
        damage_flash--;
        image_blend = c_red;
    }
    else
    {
        image_blend = c_white;
    }

    death_timer--;

    if (death_timer <= 0)
    {
        room_goto(rVictory);
    }

    exit; // stop all other logic while dying
}

// Boss hit flash
if (damage_flash > 0)
{
    damage_flash--;
    image_blend = c_red;
}
else
{
    image_blend = c_white;
}

// Fire timer
fire_cooldown--;

if (fire_cooldown <= 0)
{
    if (instance_number(oTorpedo) == 0)
    {
        var n = instance_number(oTorpedoSpawn);

        if (n > 0)
        {
            var sp = instance_find(oTorpedoSpawn, irandom(n - 1));

            // spawn on Projectiles layer (must exist in room)
            var t = instance_create_layer(sp.x, sp.y, "Projectiles", oTorpedo);
            t.owner = id;
        }
    }

    fire_cooldown = fire_cooldown_max;
}

// Trigger death state
if (hp <= 0 && !dying)
{
    run_finish(); // record run time + kills

    dying = true;
    death_timer = room_speed * 4;
}
// Contact damage (hurt + push left)
var p = instance_place(x, y, oPlayer1);
if (p == noone) p = instance_place(x, y, oPlayer2);

if (p != noone)
{
    if (!variable_instance_exists(p, "boss_touch_cd")) p.boss_touch_cd = 0;
    if (p.boss_touch_cd > 0) p.boss_touch_cd--;

    if (p.boss_touch_cd <= 0)
    {
        p.hp -= 2;
        p.damage_flash = 10;
        p.image_blend = c_red;

        // force knockback left
        p.knockback_x = -14;
        p.knockback_y = 0;
        p.knockback_timer = 12;

        p.boss_touch_cd = room_speed; // 1 second
    }
}