// Lifetime safety
life--;
if (life <= 0)
{
    instance_destroy();
    exit;
}

// Move
if (!reflected)
{
    x -= torp_speed; // outbound (left)
}
else
{
    x += torp_speed; // return (right)
}

// If outbound: hit player or parry reflect
if (!reflected)
{
    var p = instance_place(x, y, oPlayer1);
    if (p == noone) p = instance_place(x, y, oPlayer2);

    if (p != noone)
    {
        if (p.is_parrying)
{
    reflected = true;

    // flip the torpedo sprite
    image_xscale *= -1;

    // push it away so it doesn't instantly re-hit
    x += 6;
}
        else
        {
            p.hp -= damage_to_player;
            p.damage_flash = 10;
            p.image_blend = c_red;

            var hit_dir = point_direction(x, y, p.x, p.y);
            p.knockback_x = lengthdir_x(10, hit_dir);
            p.knockback_y = lengthdir_y(10, hit_dir);
            p.knockback_timer = 10;

            instance_destroy();
            exit;
        }
    }
}

// If reflected: hit boss
if (reflected && instance_exists(owner))
{
    if (place_meeting(x, y, owner))
    {
        owner.hp -= damage_to_boss;
		owner.damage_flash = 10;   // flash duration (frames)
		instance_destroy();
        exit;
    }
}

// Cleanup if offscreen
if (x < -200 || x > room_width + 200)
{
    instance_destroy();
}