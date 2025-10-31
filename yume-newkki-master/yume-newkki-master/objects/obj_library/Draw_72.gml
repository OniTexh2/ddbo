/// @description
var count = 3

for (var col = -2; col < count; ++col) {
    for (var row = -2; row < count; ++row) {
		var x_ = x + (col_offset_x * col);
		var y_ = y + (row_offset_y*row) + (col_offset_y*col);
		draw_sprite(spr_library,0,x_,y_);
	}
}

//draw_sprite(spr_library,0,x,y);

//draw_sprite(mask_index,0,x,y);