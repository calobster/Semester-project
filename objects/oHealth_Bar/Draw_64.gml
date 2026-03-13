var player = instance_find(oPlayer,0);

if (player != noone)
{
    var hp = player.hp;
    var maxhp = player.max_hp;

    // total frames in the health sprite
    var frames = sprite_get_number(sHealth_Bar);

    // convert health to frame
    var hp_percent = hp / maxhp;
    var frame = floor((1 - hp_percent) * (frames - 1));

    // flash injured frame when damaged
    if (player.damage_flash > 0)
    {
        frame = min(frame + 1, frames - 1);
    }

    frame = clamp(frame, 0, frames - 1);

    // scale of the health bar
    var scale = 2;

    // bottom-left screen position
    var x_pos = 20;
    var y_pos = display_get_gui_height() - (sprite_get_height(sHealth_Bar) * scale) - 20;

    // pulsing flash color when damaged
    var flash_color = c_white;

    if (player.damage_flash > 0 && (current_time div 50) mod 2 == 0)
    {
        flash_color = make_color_rgb(255,255,255);
    }

    // draw the health bar
    draw_sprite_ext(
        sHealth_Bar,
        frame,
        x_pos,
        y_pos,
        scale,
        scale,
        0,
        flash_color,
        1
    );
}