switch (state)
{
    // ---------------------------------------------------
    case "scrolling":
        var all_passed = true;

        // Move all credits upward
        for (var i = 0; i < array_length(credit_ids); i++) {
            var inst = credit_ids[i];

            if (instance_exists(inst)) {
                inst.y -= scroll_speed;

                if (inst.y + inst.sprite_height > -32) {
                    all_passed = false;
                }
            }
        }

        // When all credits go off the top, move to THANKS state
        if (all_passed) {
            state = "thanks";
        }
    break;

    // ---------------------------------------------------
    case "thanks":
        thanks_timer++;

        if (thanks_timer >= thanks_duration) {
            // Save and exit game
            user_save("save" + string(global.save_slot));
            game_end();
        }
    break;
}

var ver = keyboard_check(vk_down) - keyboard_check(vk_up)
var separation = 32
var spd = 2

player_y += ver * spd
player_y = clamp(player_y, separation, room_height - separation)

if keyboard_check_pressed(ord("Z")){
	instance_create_layer(32, player_y, layer,obj_fireball)
}

