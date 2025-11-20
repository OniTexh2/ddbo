/// @description
if (can_move) {
    if (animate) {
        subimg += sprite_get_speed(sprite_index);
    }

    // lets user move and interact the player
    if (controlled) {
		running = keyboard_check(vk_shift);
		
        var h_input = (input_check("right") - input_check("left"));
        var v_input = (input_check("down") - input_check("up"));

        // track last directional input
        if (input_check_pressed("left"))  last_input_dir = "left";
        if (input_check_pressed("right")) last_input_dir = "right";
        if (input_check_pressed("up"))    last_input_dir = "up";
        if (input_check_pressed("down"))  last_input_dir = "down";

        // block diagonal movement but prioritize last input made
        if (h_input != 0 && v_input != 0) {
            switch (last_input_dir) {
                case "left":
                case "right":
                    v_input = 0;
                break;

                case "up":
                case "down":
                    h_input = 0;
                break;
            }
        }

        hspd = h_input;
        vspd = v_input;

        if (input_check_pressed("action")) and !state.state_is("dead") {
            var check_x = x + lengthdir_x(6, dir);
            var check_y = y + lengthdir_y(6, dir);
            var object = instance_place(check_x, check_y, obj_interactable);
            if (object == noone) object = instance_place(check_x, check_y, obj_interactable_nonSolid);
            if (object != noone) {
                object.trigger = true;
            }
        }
		
		if keyboard_check_pressed(ord("C")) and !state.state_is("unlock"){
			state.change("unlock")
		}
    } else if (xDest != undefined || yDest != undefined) {
        // can be turned on and be made to move externally
        if (abs(x - xDest) < 1) x = xDest;
        if (abs(y - yDest) < 1) y = yDest;
        hspd = xDest - x;
        vspd = yDest - y;
    }

    if (hspd != 0 || vspd != 0) and !state.state_is("dead"){
        dir = point_direction(0, 0, hspd, vspd);
		
		spd = (running ? spd_run : spd_base)

        // no diagonal correction needed anymore
        hspd = sign(hspd) * spd;
        vspd = sign(vspd) * spd;
    }
	
	if state.state_is("idle"){
		afk_timer--;
		if afk_timer <= 0{
			state.change("dead")
		}
	}else{
		afk_timer = afk_maxtime
	}

    depth = -y;

    state.step();
}
