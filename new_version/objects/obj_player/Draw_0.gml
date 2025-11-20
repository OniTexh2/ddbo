/// @description
if(ping_pong) draw_sprite_ext(sprite_index,PingPongImage(sprite_index,subimg),x,y,xscale,yscale,0,-1,1);
else draw_sprite_ext(sprite_index,subimg,x,y,image_xscale,image_yscale,0,c_white,1);

state.draw();