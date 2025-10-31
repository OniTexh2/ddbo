/// @description
//first it fades in, then it fades out
if(in_out == 0){ //fade in
	t++;
	if(t == duration){
		in_out = 1;	
		room_goto(room_index);
	}
} else { // fade out
	t--;
	if (t == 0){
		obj_camera.screen_effect = -1;
		instance_destroy();
	}
}