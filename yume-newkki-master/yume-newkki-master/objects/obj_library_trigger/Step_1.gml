/// @description
if collision_point(obj_player.x,obj_player.y,self,true,false){
	switch (dir) {
	    case "up":
	        up();
	        break;
	    case "down":
	        down();
	        break;
		case "left":
	        left();
	        break;
		case "right":
	        right();
	        break;
	}
}