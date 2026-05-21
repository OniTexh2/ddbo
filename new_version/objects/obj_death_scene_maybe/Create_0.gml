t = 0;
phase = 0;
// 0 = ramping glitch
// 1 = full white flash
// 2 = black with text
// 3 = fading back
global.user_data.deaths = 1;
msg_index = clamp(global.user_data.deaths, 0, 4);
messages = [
    "Message ...",
	"Message one...",
    "Message two...",
    "Message three...",
    "..."
];
current_msg = messages[msg_index];

text_alpha  = 0;
fade_back   = 0;

u_time      = shader_get_uniform(sh_corrupt, "u_time");
u_intensity = shader_get_uniform(sh_corrupt, "u_intensity");
u_res       = shader_get_uniform(sh_corrupt, "u_resolution");

audio_play_sound(music_ominous, 10, false);

// lock player
obj_player.controlled = false;