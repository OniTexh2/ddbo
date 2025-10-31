/// @func draw_text_scrolling(x, y, text, speed)
/// @description draws text scrolling
/// @param	x
/// @param	y
/// @param	text
/// @param	speed
function draw_text_scrolling(x_, y_, text, speed_) {
	text = text + " ";
	var width = string_width(text);
	var height = string_height(text);
	
	var t = (speed_ * (game_speed*(current_time/1000))) mod width;
	
	var text_surf = surface_create(width,height);
	surface_set_target(text_surf);
	draw_clear_alpha(black,0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(-t,0,text);
	draw_text(-t+width,0,text);
	
	surface_reset_target();
	draw_surface(text_surf,x_,y_);
	surface_free(text_surf);
}