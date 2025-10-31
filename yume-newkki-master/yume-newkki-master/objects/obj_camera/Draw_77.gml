/// @description

#region draws cameras to temp_surf
var temp_surf = surface_create(global.game_w,global.game_h);
surface_set_target(temp_surf);
draw_clear_alpha(black,0);
if(screen_effect != -1) screen_effect();

if(global.room_wrap){
	if(hor!= 0){
		draw_surface(cam_hor.surface,0,0);
	}
	
	if(ver!= 0){
		draw_surface(cam_ver.surface,0,0);
	}
	
	if(hor!= 0 && ver !=0){
		draw_surface(cam_cor.surface,0,0);
	}
}

draw_surface(global.camera.surface,0,0);
shader_reset();
surface_reset_target();
#endregion

#region draws transition effects to game_surf
var game_surf = surface_create(global.game_w,global.game_h);
surface_set_target(game_surf);

draw_clear_alpha(black,0);
shader_set(sh_post_process_game);
shader_set_uniform_f(uniSplit,split);
draw_surface(temp_surf,0,0);
shader_reset();
surface_reset_target();

#endregion


#region draws crt effect to crt_surf

//var crt_scale = 6;
//var crt_surf = surface_create(global.game_w * crt_scale,global.game_h * crt_scale);
//surface_set_target(crt_surf);
//
//draw_clear_alpha(black,0);
//shader_set(sh_crt);
//shader_set_uniform_f(u_time, get_timer()/1000000);
//shader_set_uniform_f(u_resolution, global.game_w * crt_scale, global.game_h * crt_scale);
//draw_surface_ext(game_surf,0,0,crt_scale,crt_scale,0,white,1);
//shader_reset();
//surface_reset_target();

#endregion

#region draws background, game surface, and borders to window_surf
window_surf = surface_check_create(window_surf,window_get_width(),window_get_height());
surface_set_target(window_surf);

//draws background
if(surface_exists(bg_surf)){
	//draw_surface_stretched(bg_surf,stanncam_fullscreen_ratio_compensate(),0,__obj_stanncam_manager.display_res_w,__obj_stanncam_manager.display_res_h);
	global.camera.draw_surf(bg_surf,0,0,1/global.bg_scale,1/global.bg_scale);
}

global.camera.draw_surf(game_surf,0,0,1,1);

//draws fullscreen side images
if(global.window_mode != STANNCAM_WINDOW_MODE.windowed){
	var ratio = sprite_get_width(spr_fullscreen_banner_left) / sprite_get_height(spr_fullscreen_banner_left);
	var height = display_get_height();
	var width = height*ratio;
	
	sprite_get_height(spr_fullscreen_banner_left)
	
	draw_sprite_stretched(spr_fullscreen_banner_left,0,stanncam_fullscreen_ratio_compensate_x()-width,0,width,height);
	draw_sprite_stretched(spr_fullscreen_banner_right,0,display_get_width()-stanncam_fullscreen_ratio_compensate_x(),0,width,height);
}

surface_reset_target();
#endregion

#region draws window with bloom
shader_set(sh_bloom);
var tex = surface_get_texture(window_surf);
shader_set_uniform_f(u_texel, texture_get_texel_width(tex), texture_get_texel_height(tex));

draw_surface(window_surf,0,0);
shader_reset();
#endregion

surface_free(temp_surf);
surface_free(game_surf);
//surface_free(crt_surf);