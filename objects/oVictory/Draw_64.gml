var gw = display_get_gui_width();
var gh = display_get_gui_height();

// Dark overlay
draw_set_alpha(0.75);
draw_set_color(c_black);
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(1);

// Floating bubble dots (simple, pretty)
draw_set_color(c_white);
for (var i = 0; i < 18; i++)
{
    var bx = (i * 97 + (t * 2)) mod gw;
    var by = (gh - (i * 83 + t * 3) mod gh);
    var a = 0.08 + 0.08 * ((i mod 3) / 2);
    draw_set_alpha(a);
    draw_circle(bx, by, 2 + (i mod 2), false);
}
draw_set_alpha(1);

// Center card
var card_w = 520;
var card_h = 320;
var cx = gw / 2;
var cy = gh / 2;

draw_set_color(make_color_rgb(20, 24, 30));
draw_roundrect(cx - card_w/2, cy - card_h/2, cx + card_w/2, cy + card_h/2, false);

// Card border glow
draw_set_alpha(0.25);
draw_set_color(c_white);
draw_roundrect(cx - card_w/2 - 3, cy - card_h/2 - 3, cx + card_w/2 + 3, cy + card_h/2 + 3, false);
draw_set_alpha(1);

// Title
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_text_transformed(cx, cy - 130, "VICTORY", 3, 3, 0);

draw_set_alpha(0.7);
draw_text(cx, cy - 70, "The river is safe... for now.");
draw_set_alpha(1);

// Menu styling
var y0 = cy + 10;
var spacing = 56;

// Selection pulse
var pulse = 0.5 + 0.5 * sin(t * 0.15);

// Option 0
if (menu_index == 0)
{
    draw_set_alpha(0.25 + 0.35 * pulse);
    draw_set_color(c_white);
    draw_roundrect(cx - 170, y0 - 10, cx + 170, y0 + 34, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(cx, y0, option_0);
}
else
{
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_text(cx, y0, option_0);
    draw_set_alpha(1);
}

// Option 1
if (menu_index == 1)
{
    draw_set_alpha(0.25 + 0.35 * pulse);
    draw_set_color(c_white);
    draw_roundrect(cx - 170, y0 + spacing - 10, cx + 170, y0 + spacing + 34, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text(cx, y0 + spacing, option_1);
}
else
{
    draw_set_alpha(0.8);
    draw_set_color(c_white);
    draw_text(cx, y0 + spacing, option_1);
    draw_set_alpha(1);
}

// Controls hint
draw_set_alpha(0.55);
draw_text(cx, cy + 170, "W/S to select  •  Enter to confirm");
draw_set_alpha(1);