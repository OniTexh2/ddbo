var page = txt.pages[current_page];
draw_set_font(page.font)
// Background
draw_sprite(txtb_spr, 0, x, y);
var _port_offset = 0;
// Portrait
if (page.portrait != noone) {
    draw_sprite(page.portrait, 0, x + 15, y);
	_port_offset = 57; 
} 

// --- Text ---
var text_x = x + portrait_width + text_padding + _port_offset;
var text_y = y + text_padding;
var text_to_draw = string_copy(page.text, 1, floor(draw_char));
draw_set_color(c_black);
draw_text(text_x, text_y, text_to_draw);

// Options
if options_exists {
	if (current_page == array_length(txt.pages) - 1 && struct_exists(txt, "options") > 0 && draw_char >= string_length(page.text)) {
	    for (var i = 0; i < array_length(txt.options); i++) {
	        var opt = txt.options[i];
	        var col = i == option_hover ? #FD00FD : c_black;
	        draw_set_color(col);
	        draw_text(text_x, text_y + 60 + i * 20, opt.text);
	    }
	}
}

//array_length(txt.options) > 0