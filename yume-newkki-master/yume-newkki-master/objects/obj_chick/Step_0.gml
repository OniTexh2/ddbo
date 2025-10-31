/// @description



leader_position.set(obj_player.x,obj_player.y);
leader_velocity.set(obj_player.hspd,obj_player.vspd);

//steering forces
if((leader_velocity.x != 0 || leader_velocity.y != 0)){
	steering_force.add(evade_force(leader_position,leader_velocity));
}

steering_force.add(seek_force(leader_position.x,leader_position.y));

//update vectors
velocity.add(steering_force);
velocity.limit_magnitude(max_speed);
position.add(velocity);

steering_force.set(0,0);

//update variables
x = position.x;
y = position.y;






depth = -y -4;