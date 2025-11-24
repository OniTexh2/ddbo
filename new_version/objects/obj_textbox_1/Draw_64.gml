var page = txt.pages[current_page];

// Background
draw_sprite(txtb_spr, 0, x, y);

// Portrait
if (page.portrait != noone) {
    draw_sprite(page.portrait, 0, x + 10, y + 6);
}

// --- Text ---
var text_x = x + portrait_width + text_padding;
var text_y = y + text_padding;
var text_to_draw = string_copy(page.text, 1, floor(draw_char));
draw_set_color(c_white);
draw_text(text_x, text_y, text_to_draw);

// Options
if options_exists {
	if (current_page == array_length(txt.pages) - 1 && struct_exists(txt, "options") > 0 && draw_char >= string_length(page.text)) {
	    for (var i = 0; i < array_length(txt.options); i++) {
	        var opt = txt.options[i];
	        var col = i == option_hover ? c_yellow : c_white;
	        draw_set_color(col);
	        draw_text(text_x, text_y + 60 + i * 20, opt.text);
	    }
	}
}

//array_length(txt.options) > 0