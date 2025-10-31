
global.t = 0;
global.save_slot = 0;

#macro game_speed game_get_speed(gamespeed_fps)

#macro can_move !instance_exists(obj_text) && obj_init.state.state_is("idle")

#macro text_height 14

//colors
#macro black c_black
#macro white c_white
#macro purple #5e0629
#macro purple_light #b3768e
#macro yellow #f3b500
#macro yellow_light #ffdd36
#macro red c_red
#macro green c_green
