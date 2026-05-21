// Create Event
if (!instance_exists(obj_player)) exit;
shadow_x   = obj_player.x + 4;
shadow_y   = obj_player.y + 4;
idle_timer = 0;
wander_dir = irandom(359);
last_px    = obj_player.x;
last_py    = obj_player.y;_range(8, 14);