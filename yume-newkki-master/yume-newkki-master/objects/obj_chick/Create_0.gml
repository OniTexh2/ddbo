/// @description

color = make_colour_hsv(irandom_range(30,40), 255, 255);
radius = 2.5;

position = new vector(x,y);
velocity = new vector_zero();
steering_force= new vector_zero();

max_speed = 2;
max_force = 0.1;

leader_position = new vector(x,y);
leader_velocity = new vector_zero();