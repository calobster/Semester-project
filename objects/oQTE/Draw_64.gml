var gw = display_get_gui_width();
var gh = display_get_gui_height();

// dim overlay (pause-style)
draw_set_alpha(0.65);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(1);

// center UI
var cx = gw/2;
var cy = gh/2;

// bar background
draw_set_color(make_color_rgb(30, 30, 30));
draw_rectangle(cx - bar_w/2, cy - bar_h/2, cx + bar_w/2, cy + bar_h/2, false);

// success zone (different color)
draw_set_color(c_green);
draw_rectangle(cx - bar_w/2, cy - bar_h/2 + zone_start, cx + bar_w/2, cy - bar_h/2 + zone_end, false);

// slider marker
draw_set_color(c_white);
var sy = (cy - bar_h/2) + slider;
draw_rectangle(cx - 40, sy - 2, cx + 40, sy + 2, false);

// text
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(cx, cy + bar_h/2 + 20, "Press K when the line is in the green zone!");