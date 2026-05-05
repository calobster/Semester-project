draw_self();

if (shock_timer > 0)
{
    var f = floor(current_time / 80) mod sprite_get_number(sShock);
    draw_sprite(sShock, f, x, y);
}