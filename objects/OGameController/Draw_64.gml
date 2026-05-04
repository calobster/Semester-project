if (message_timer > 0)
{
    draw_set_alpha(message_alpha);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(c_yellow);

    draw_text(display_get_gui_width()/2, 40, message_text);

    draw_set_alpha(1);
}