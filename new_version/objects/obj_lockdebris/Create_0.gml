randomize()

// --- Particle physics setup ---
dir = irandom_range(0, 359);    // random direction
spd = random_range(1, 2);     // horizontal speed
z = 0
zspd = random_range(-5, -7);      // vertical speed
z_rot = 0
z_rot_speed = random_range(-12, 12); 
grav = 0.2;                  // downward pull
bounciness = 0.5;               // vertical bounce strength
bounce_damp = 0.6;              // horizontal slowdown on bounce
life = 16      // lifetime in frames
alpha_min = 0;                // lowest alpha when flickering
alpha_flick = false;            // flicker toggle

image_speed = 0
image_index = irandom_range(0, image_number)