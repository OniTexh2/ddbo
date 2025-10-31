/// @description
var game_res = global.resLib[RES_LIB.DESKTOP_4_3_320_X_240];
var display_res = global.resLib[global.settings.resolution];
stanncam_init(game_res.width,game_res.height,display_res.width,display_res.height);

stanncam_set_window_mode(global.settings.window_mode);
stanncam_set_keep_aspect_ratio(global.settings.keep_aspect_ratio)

global.camera = new stanncam(0,0,global.game_w,global.game_h,,false);
cam_cor = global.camera.clone();
cam_hor = global.camera.clone();
cam_ver = global.camera.clone();

global.room_wrap = false;

bg_surf = -1;
//game_surf = -1;

//backgrounds are scaled up so they can parralax smoother
global.bg_scale = 4;


//shaders
screen_effect = -1; //Used for temporary effects like transitions

//post_processing game
uniTexel = shader_get_uniform(sh_post_process_game,"Texel");
var tex = surface_get_texture(global.camera.surface);
shader_set_uniform_f(uniTexel,texture_get_texel_width(tex),texture_get_height(tex));

split = 0.0;
uniSplit = shader_get_uniform(sh_post_process_game,"Split");
shader_set_uniform_f(uniSplit,split);

//post_processing window
window_surf = -1;
//crt_surf = -1;

u_time = shader_get_uniform(sh_crt, "u_time");
u_resolution = shader_get_uniform(sh_crt, "u_resolution");
u_texel = shader_get_uniform(sh_bloom, "u_texel");