if (paused) {

    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
    draw_set_alpha(1);

    draw_set_color(c_white);
    draw_set_halign(fa_center);

    draw_text(display_get_gui_width()/2, start_y - 80, "PAUSED");

    for (var i = 0; i < array_length(menu_items); i++) {

        var col = c_white;
        if (i == menu_index) col = c_yellow;

        draw_set_color(col);

        draw_text(
            display_get_gui_width()/2,
            start_y + (i * spacing),
            menu_items[i]
        );
    }
}