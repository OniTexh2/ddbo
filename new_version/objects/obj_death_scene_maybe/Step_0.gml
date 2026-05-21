t++;

switch (phase) {
    case 0: // build glitch over 4 seconds
        if (t > 240) { phase = 1; t = 0; }
    break;
    case 1: // white flash + silence
        audio_stop_all();
        if (t > 20) { phase = 2; t = 0; }
    break;
    case 2: // black screen + text appears
        text_alpha = min(1, text_alpha + 0.02);
        if (t > 200) { phase = 3; t = 0; }
    break;
    case 3: // fade back to game
        fade_back = min(1, fade_back + 0.015);
        if (fade_back >= 1) {
            // return to bedroom
            obj_player.controlled = true;
            obj_camera.post_processing = -1;
            global.user_data.corruption_seen = true;
            global.user_data.deaths++;
            transition(rm_bedroom, function(){
                //obj_bedroom_bed.state.change("wake1"); //???
            },, transition_type.pixelate);
			show_message("3");
			
            instance_destroy();
        }
    break;
}

// Drive shader via post_processing during phases 0-1
if (phase <= 1) {
    var _intensity = (phase == 0) ? min(1, t / 180.0) : 1.0;
    var _t = t;
    var _ut = u_time; var _ui = u_intensity; var _ur = u_res;
        shader_set(sh_corrupt);
        shader_set_uniform_f(_ut, _t * 0.04);
        shader_set_uniform_f(_ui, _intensity);
        shader_set_uniform_f(_ur, global.game_w, global.game_h);
} else {
   //
}