if (!instance_exists(obj_player)) exit;

var _moved = (obj_player.x != last_px || obj_player.y != last_py);
last_px = obj_player.x;
last_py = obj_player.y;

if (_moved) {
  idle_timer = 0;
  shadow_x   = lerp(shadow_x, obj_player.x + 4, 0.12);
  shadow_y   = lerp(shadow_y, obj_player.y + 4, 0.12);
} else {
  idle_timer++;
  if (idle_timer > room_speed * 3) {
    if (irandom(60) == 0) wander_dir = irandom(359);
    shadow_x += lengthdir_x(0.6, wander_dir);
    shadow_y += lengthdir_y(0.5, wander_dir);
    with (obj_player) { fear = min(fear + 0.05, fear_max); }
  }
}
// Shadow snaps back if it strays too far — sudden and alarming
if (point_distance(shadow_x, shadow_y, obj_player.x, obj_player.y) > 80) {
  shadow_x = obj_player.x;  shadow_y = obj_player.y;
  with (obj_player) { fear = min(fear + 30, fear_max); }
}