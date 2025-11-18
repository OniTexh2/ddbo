var is_christmas = (current_day == 25 and current_month == 12);

draw_sprite(spr_desktop_bgs, (is_christmas ? 3 : global.desktop_background), 0, 0);
draw_sprite(spr_desktop_layout, 0, 0, 0);

// Draw icons
for (var i = 0; i < icon_count; ++i) {
    var x_position = i * icon_size;

    // Hover highlight
    if (i == hover_index) {
        draw_sprite(spr_desktop_icons, 0, x_position, 0); // frame 0 = selection highlight
    }

    draw_sprite(spr_desktop_icons, i + 1, x_position, 0);
}

// Bottom-left hover highlight rectangle
if (hover_index == 9999) {
    draw_rectangle(0, display_get_gui_height() - 48, 48, display_get_gui_height(), false);
}

// GUI-space mouse position
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Draw custom cursor
draw_sprite(spr_desktop_cursor, 0, mx, my);

// If the cat interaction is active:
if (interaction_disabled) {
    draw_sprite(spr_cat, 0, 0, 0);
}
