/// @description draws obstructing elements
if(on_stair){
	draw_sprite(spr_library_obstructing_wall,0,x,y);
} else if(stair_obstruct){
	draw_sprite(spr_library_obstructing_stairs,0,x,y);
}