/// @description

//hor_offset_x = 105;
hor_offset_y = 38;
ver_offset_y = 70;
offset_x = 86;

left = function(){
	with(obj_library){
		if(abs(hex_x) mod 2 == 0){
			x -= other.offset_x*2;
			y += other.hor_offset_y*2;
		}
		hex_x--;
		show_debug_message(hex_x);
	}
	
	with(obj_library_trigger){
		x -= offset_x;
		y += hor_offset_y;
	}
}

right = function(){
	with(obj_library){
		if(abs(hex_x) mod 2 == 1){
			x += other.offset_x*2;
			y -= other.hor_offset_y*2;
		}
		hex_x++
		show_debug_message(hex_x);
	}
	with(obj_library_trigger){
		x += offset_x;
		y -= hor_offset_y;
	}
	
}

up = function(){
	with(obj_library){
		if(abs(hex_y) mod 2 == 0){
			x -= other.offset_x*2
			y -= other.ver_offset_y*2
		}
		
		hex_y--
	}
	with(obj_library_trigger){
		x -= offset_x
		y -= ver_offset_y
	}
}

down = function(){
	with(obj_library){
		if(abs(hex_y) mod 2 == 1){
			x += other.offset_x*2
			y += other.ver_offset_y*2
		}
		
		hex_y++
	}
	with(obj_library_trigger){
		x += offset_x
		y += ver_offset_y
	}
}

