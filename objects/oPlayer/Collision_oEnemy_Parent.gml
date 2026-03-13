if (alarm[0] <= 0)
{
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red;

    damage_flash = 10; // triggers injured frame in health bar

    if (hp <= 0)
    {
        room_restart();
    }
}