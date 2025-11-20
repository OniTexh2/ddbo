if (interaction_disabled) {
    // If icon 3 has disabled interactions, just wait for sound to finish
    if (!audio_is_playing(sound_playing)) {
        game_end();
    }
    exit;
}

// Determine hover
hover_index = -1;

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

// Icon area is assumed at y = 0 and each is 48x48
for (var i = 0; i < icon_count; i++) {
    var x1 = i * (icon_size * 1.65);
    var y1 = 0;
    var x2 = x1 + (icon_size * 1.65);
    var y2 = y1 + (icon_size * 1.65);

    if (mx >= x1 && mx < x2 && my >= y1 && my < y2) {
        hover_index = i;
    }
}

// Bottom-left corner exit (48×48 area)
if (mx < 48 && my > display_get_gui_height() - 48) {
    hover_index = 9999; // special ID for bottom-left
}

// Click handling
if (mouse_check_button_pressed(mb_left)) {

    // Bottom-left corner
    if (hover_index == 9999) {
        instance_destroy();
        exit;
    }

    switch (hover_index) {

        case 0: // Icon 1 - SAVE
            user_save("save" + string(global.save_slot));

            var text = [];
            text[0] = ";Game has been saved";
            text_box(text);

            instance_destroy(); // destroy obj_desktop
        break;

        case 1: // Icon 2 - GALLERY
            // Create your gallery window object, passing photos
            //var inst = instance_create_layer(0, 0, "GUI", obj_gallery_window);
            //inst.photos = gallery_photos;
            //inst.index = 0; // first picture
        break;

        case 2: // Icon 3 - CAT JUMPSCARE
            interaction_disabled = true;
            sound_playing = audio_play_sound(snd_lowquality_cat, 1, false);
        break;
    }
}
