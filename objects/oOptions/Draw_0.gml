/// DRAW GUI EVENT

draw_set_color(c_white);

var start_y = 200;
var spacing = 40;

// Display globals (the real settings)
draw_text(300, start_y + spacing * 0, "Music Volume: " + string(round(global.music_volume * 100)) + "%");
draw_text(300, start_y + spacing * 1, "SFX Volume: " + string(round(global.sfx_volume * 100)) + "%");
draw_text(300, start_y + spacing * 2, "Fullscreen: " + string(global.fullscreen));
draw_text(300, start_y + spacing * 3, "Back");

// Selector arrow
draw_text(260, start_y + spacing * menu_index, ">");