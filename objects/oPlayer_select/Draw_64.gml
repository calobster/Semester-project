draw_set_font(fnt_monogram);
draw_set_halign(fa_center);

var scale = 3; // 3x bigger

var center_x = display_get_gui_width()/2;
var start_y = 200;
var spacing = 120 * scale;

draw_text_transformed(center_x, 100, "Select Your Fish", scale, scale, 0);

for (var i = 0; i <= max_selection; i++)
{
    var y_pos = start_y + (i * spacing);

    if (i == selection)
        draw_set_color(c_yellow);
    else
        draw_set_color(c_white);

   var sprite_y = y_pos;

if (i == 0) // Player1 only
{
    sprite_y += 50; // move down 40 pixels (adjust if needed)
}

draw_sprite_ext(
    characters[i].sprite,
    0,
    center_x,
    sprite_y,
    scale, scale,
    0,
    c_white,
    1
);

    draw_text_transformed(
        center_x,
        y_pos + (60 * scale),
        characters[i].name,
        scale, scale,
        0
    );
}

draw_set_color(c_white);

draw_text_transformed(
    center_x,
    display_get_gui_height() - 100,
    "Press Enter To Confirm",
    scale, scale,
    0
);