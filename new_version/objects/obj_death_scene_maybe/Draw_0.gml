if (phase == 1) {
    // white flash
    draw_set_color(c_white);
    draw_set_alpha(min(1, (20 - t) / 20.0));
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_reset_color();
}

if (phase == 2) {
    // full black
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_reset_color();

    // draw the message centred
    draw_set_font(f_pixel);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_set_alpha(text_alpha);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, current_msg);
    draw_reset_color();
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}

if (phase == 3) {
    draw_set_color(c_black);
    draw_set_alpha(fade_back);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_reset_color();
}