// --- Depth sorting (for isometric overlap) ---
depth = -(y-z)

// --- Movement and bouncing ---
if (life > 15) {
	// --- Horizontal movement (isometric-friendly) ---
	if !place_meeting(x,y,obj_wall){
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}
	
    // Simulate vertical motion
    zspd += grav;
    z += zspd;

    if (z >= 0) {
            z = 0;
            zspd *= -bounciness;
            spd *= bounce_damp;
            z_rot_speed = random_range(-12, 12);
            if (abs(zspd) < 0.3) { life = 14; z_rot_speed = 0; }
	 }

} else {
    // Lifetime and flicker near death
    life -= 0.2;
    if life mod 0.4 == 0 { alpha_flick = !alpha_flick; }
    image_alpha = alpha_flick ? 1 : alpha_min;
}

z_rot += z_rot_speed;

// --- Destroy when done ---
if (life <= 0) instance_destroy();
