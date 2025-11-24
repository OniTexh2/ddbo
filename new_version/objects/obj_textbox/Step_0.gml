var page = txt.pages[current_page];

// ----------------- TYPEWRITER EFFECT -----------------
if (draw_char < string_length(page.text)) {
    if (text_pause_timer > 0) {
        text_pause_timer--; // still pausing
    } else {
        draw_char += text_speed;

        // Play blip every 2 characters
        if (draw_char mod 2 == 0) {
            audio_play_sound(sndBlep, 1, false);
        }

        // If we just typed punctuation, set a pause
        var last_char = string_char_at(page.text, draw_char);
        if (string_pos(last_char, ".!?;,") > 0) {
            text_pause_timer = room_speed / 4; // 0.25s pause
        }
    }
}

// Finished typing current page
if (draw_char >= string_length(page.text)) {
    // ---------------- OPTIONS HANDLING ----------------
	  if (options_exists) && (current_page == array_length(txt.pages) - 1){
	    var opt_count = array_length(txt.options);

	    // Keyboard navigation
	    if (keyboard_check_pressed(vk_up))   option_hover = (option_hover - 1 + opt_count) mod opt_count;
	    if (keyboard_check_pressed(vk_down)) option_hover = (option_hover + 1) mod opt_count;

	    // Mouse hover
	    var text_x = x + 210 + 20;
	    var text_y = y + 20;
	    for (var i = 0; i < opt_count; i++) {
	        var opt_y = text_y + 60 + i * 20;
	        if (point_in_rectangle(mouse_x, mouse_y, text_x, opt_y, text_x + 200, opt_y + 20)) {
	            option_hover = i;
	            if (mouse_check_button_pressed(mb_left)) {
	                var chosen = txt.options[option_hover];
					txt = struct_get(global.text, chosen.link);
					options_exists = struct_exists(txt, "options"); 
					option_hover = 0; 
					current_page = 0;
					draw_char = 0;
	                // show_debug_message("Chosen: " + string(chosen.link));
	                //instance_destroy();
	            }
	        }
	    }

	    // Keyboard confirm
	    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter)) && option_hover != - 1{
	            var chosen = txt.options[option_hover];
				txt = struct_get(global.text, chosen.link);
				option_hover = 0; 
				current_page = 0;
				draw_char = 0;
	    }
    }

    // ---------------- PAGE ADVANCE ----------------
    else {
        if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
            if (current_page < array_length(txt.pages) - 1) {
				//speaker update
                current_page++;
                draw_char = 0;
            } else {
                instance_destroy();
            }
        }
    }
}