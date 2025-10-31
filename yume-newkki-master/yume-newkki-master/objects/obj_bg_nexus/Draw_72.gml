/// @description
obj_camera.bg_surf = surface_check_create(obj_camera.bg_surf,global.game_w*global.bg_scale,global.game_h*global.bg_scale);
surface_set_target(obj_camera.bg_surf);

var x_ = -global.camera.get_x() - (room_width/2  - (global.camera.get_x()+global.camera.width/2))  * 0.2;
var y_ = -global.camera.get_y() - (room_height/2 - (global.camera.get_y()+global.camera.height/2)) * 0.2;

draw_sprite_ext(spr_bg_nexus,0,x_*global.bg_scale,y_*global.bg_scale,global.bg_scale,global.bg_scale,0,-1,1);

surface_reset_target();

draw_reflections();