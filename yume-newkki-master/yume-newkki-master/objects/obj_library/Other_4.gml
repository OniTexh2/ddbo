/// @description sets the players screen draw function to draw coordinates on screen
with(obj_player){
	tv_screen_draw = function(){
		if(tv_value != 0){
			var w_ = 12;
			var h_ = 8;  
			var screen_surf = surface_create(w_,h_);
			
			//draws players x, y coorindates on the screen
			surface_set_target(screen_surf);
			draw_clear_alpha(black,0);
			draw_set_font(f_pixel_small);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(black);
			
			draw_text_scrolling(0,1,$"X:{obj_library.hex_x} Y:{obj_library.hex_y}",0.2);
			draw_set_font(f_pixel);
			
			surface_reset_target();
			
			var _subimg = PingPongImage(sprite_index,subimg);
			switch (sprite_index) {
			    case back:
			        break;
			    case front:
					var screen_pos_x = -6;
					var screen_pos_y = [-22,-21,-22];
					draw_sprite(spr_player_tv_screen_blank,screen_subimg,x+screen_pos_x,y+screen_pos_y[_subimg]);
					draw_surface(screen_surf,x+screen_pos_x,y+screen_pos_y[_subimg]);
			        break;
				case left:
					var screen_pos_x = -6;
					var screen_pos_y = [-24,-25,-24];
					draw_sprite_stretched(spr_player_tv_screen_blank,screen_subimg,x+screen_pos_x,y+screen_pos_y[_subimg],4,14);
					draw_surface_stretched(screen_surf,x+screen_pos_x,y+screen_pos_y[_subimg]+4,4,8);
			        break;
				case right:
					var screen_pos_x = 2;
					var screen_pos_y = [-24,-25,-24];
					draw_sprite_stretched(spr_player_tv_screen_blank,screen_subimg,x+screen_pos_x,y+screen_pos_y[_subimg],4,14);
			        draw_surface_stretched(screen_surf,x+screen_pos_x,y+screen_pos_y[_subimg]+4,4,8);
			        break;
			}
			screen_subimg+= sprite_get_speed(spr_player_tv_screen_static);
			surface_free(screen_surf);
		}
	}
}


