draw_ellipse_color(
    x - 6, y, x + 6, y + 6, 
    c_black, c_black, false
);
draw_set_alpha(1);

// --- Draw particle (offset by height) ---
draw_sprite_ext(sprite_index, image_index, x, y+z, 1, 1, z_rot, image_blend, image_alpha);