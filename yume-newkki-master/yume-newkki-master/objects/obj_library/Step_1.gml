/// @description
#region changes collision if you're on the stairs
if(collide(spr_library_zone_on)) {
	on_stair = true;
	stair_obstruct = false;
} else {
	if(collide(spr_library_zone_off_front)) {
		on_stair = false;
		stair_obstruct = false;
	} else
	if(collide(spr_library_zone_off_back)) {
		on_stair = false;
		stair_obstruct = true;
	}
}

if(on_stair) mask_index = spr_library_collision_stairs;
else mask_index = spr_library_collision_wall;
#endregion