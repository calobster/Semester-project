// Reset draw settings
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Set font
draw_set_font(fnt_monogram);

// GUI size
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Menu position (left side)
var menu_x = gui_w * 0.10;
var menu_y = gui_h * 0.45;

// Text scale
var menu_scale = 6;

// Loop through menu items
for (var i = 0; i < array_length(menu); i++)
{
    if (selected == i)
        draw_set_color(selectedCol);
    else
        draw_set_color(notSelectedCol);

    draw_text_transformed(
        menu_x,
        menu_y + i * spacing * menu_scale,
        menu[i],
        menu_scale,
        menu_scale,
        0
    );
// Cursor scale (match menu size)
var cursor_scale = menu_scale * 0.5;

// Cursor offsets (fine tuning position)
var cursor_offset_x = 14; // move right
var cursor_offset_y = 30; // move down

// Cursor width after scaling
var cursWidth = sprite_get_width(s_cursor) * cursor_scale;

// Draw cursor
draw_sprite_ext(
    s_cursor,
    -1,
    menu_x - cursWidth - 20 + cursor_offset_x,
    menu_y + selectLerp * spacing * menu_scale + cursor_offset_y,
    cursor_scale,
    cursor_scale,
    0,
    c_white,
    1
);
}
// Draw title
draw_set_color(titleCol);

draw_text_transformed(
    gui_w * 0.08,
    gui_h * 0.1,
    gameTitle,
    6,   // title scale
    6,
    0
);