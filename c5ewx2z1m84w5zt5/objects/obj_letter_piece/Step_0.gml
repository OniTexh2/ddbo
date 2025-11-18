vsp += grav;
x += hsp;
y += vsp;

// Optional: fade out
image_alpha -= 0.01;
if (image_alpha <= 0) instance_destroy();
