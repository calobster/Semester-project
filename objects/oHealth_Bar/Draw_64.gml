// Find whichever player exists
var player = instance_find(oPlayer1, 0);
if (player == noone) player = instance_find(oPlayer2, 0);

if (player != noone)
{
    var hp = player.hp;
    var maxhp = player.max_hp;

    var frames = sprite_get_number(sHealth_Bar);

    var hp_percent = hp / maxhp;
    var frame = floor((1 - hp_percent) * (frames - 1));

    // flash injured frame
    if (player.damage_flash > 0)
    {
        frame = min(frame + 1, frames - 1);
    }

    frame = clamp(frame, 0, frames - 1);

    var scale = 2;

    var x_pos = 20;
    var y_pos = display_get_gui_height() - (sprite_get_height(sHealth_Bar) * scale) - 20;

    var flash_color = c_white;

    if (player.damage_flash > 0 && (current_time div 50) mod 2 == 0)
    {
        flash_color = c_white;
    }

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