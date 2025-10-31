/// @description
//when on the stairs the collission mask gets changed
on_stair = false;

//when behind the stairs they should obstruct the player
stair_obstruct = false;

row_offset_y = 216;

col_offset_x = 172;
col_offset_y = -76;

//the hex the player is standing in
hex_x = 1;
hex_y = 0;

collide = function(mask){
	mask_index = mask;
	return collision_point(obj_player.x,obj_player.y,self,true,false);
}