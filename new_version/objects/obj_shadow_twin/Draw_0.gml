// Draw Event — place obj_shadow_twin at lower depth than obj_player
draw_sprite_ext(obj_player.sprite_index, obj_player.image_index,
  shadow_x, shadow_y, 1, 1, 0, c_black, 0.45);