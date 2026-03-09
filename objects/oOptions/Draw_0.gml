/// DRAW EVENT
/// This draws the options menu on screen.

draw_set_color(c_white);

var start_y = 200;  // Starting Y position for first option
var spacing = 40;   // Space between each menu item


// Draw each menu item
draw_text(300, start_y + spacing * 0, "Music Volume: " + string(round(music_volume * 100)) + "%");
draw_text(300, start_y + spacing * 1, "SFX Volume: " + string(round(sfx_volume * 100)) + "%");
draw_text(300, start_y + spacing * 2, "Fullscreen: " + string(fullscreen));
draw_text(300, start_y + spacing * 3, "Back");


// Draw selector arrow next to current selection
draw_text(260, start_y + spacing * menu_index, ">");