/// @description
global.t++;

if(room != rm_init){
	global.user_data.time_played++;
}

state.step();