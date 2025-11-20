draw_set_alpha(1)
if on_dialogue == true{
	var box_x = 128
	var box_y = 576
	
	var text_x = box_x + 64
	var text_y = box_y + 32
	var height = 32
	var border = 5
	var padding = 16
	
	height = string_height(current_dialog.message)
	
	height += padding * 2
	//text_x = sprite_get_width(current_dialog.sprite) + padding * 2
	
	//draw_set_alpha(alpha) // We dont need this shit, looks awful
	
	draw_set_color(c_white)
	
	if current_dialog.velvet {
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width, room_height, false)
	}else{
		draw_sprite(spr_dialoguebox,image_index,box_x,box_y)
	}
	
	draw_set_halign(fa_left)
	
	var _len = string_length(current_dialog.message);
	if (char_current < _len)
    {
		char_current += char_speed;
    }
	var _str = string_copy(current_dialog.message, 1, char_current);
	
	if current_dialog.velvet{
		draw_set_color(c_white)
		draw_set_font(fnt_velvet_font)
	}else{
		draw_set_color(c_black)
		draw_set_font(fnt_char_font)
		_str = string_upper(_str)
	}
	
	draw_text_ext_transformed(text_x, text_y, _str, 37, display_get_gui_width() - 192, 2, 2, 0)
	
	draw_set_color(c_white)
}