if on_dialogue{
	if showing_dialog == false{
		if dialog.count() <= 0{
			// Unlock player movement here
			instance_destroy()
			return;
		}
	
		current_dialog = dialog.pop()
	
		showing_dialog = true
	} else {
		if keyboard_check_pressed(key_next){
			var _len = string_length(current_dialog.message);
			if (char_current < _len)
			{
				char_current = _len;
				return;
			}
			
			showing_dialog = false
			char_current = 0
		}
	}
}
