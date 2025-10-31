function init_reflections(){
	uniTime = shader_get_uniform(sh_water,"Time");
	uniOffset = shader_get_uniform(sh_water,"Offset");
	uniTexel = shader_get_uniform(sh_water,"Texel");
	uniMask = shader_get_sampler_index(sh_water,"Mask");
	
	refl_surf = -1;
	refl_mask_surf = -1;
}

function draw_reflections(){
	var x_ = global.camera.get_x();
	var y_ = global.camera.get_y();
	var w_ = global.camera.width;
	var h_ = global.camera.height;
	
	var refl_array = [];
	var refl_list = ds_list_create();
	var num = collision_rectangle_list(x_,y_-60,x_+w_,y_+h_,all,false,true,refl_list,false);
	for(var i = 0; i < num; ++i){
	  refl_array[i] = refl_list[| i];
	}
	ds_list_destroy(refl_list);
	
	array_sort(refl_array,function(elm1,elm2){
		return elm1.y - elm2.y;
	})
	
	refl_surf = surface_check_create(refl_surf,w_,h_);
	refl_mask_surf = surface_check_create(refl_mask_surf,w_,h_);
	
	surface_set_target(refl_surf);
	draw_clear_alpha(white,0);
	surface_reset_target();
	for (var i = 0; i < num; ++i) {
		with(refl_array[i]){
			//flips and offsets objects, draws and turns them back
			image_yscale = -image_yscale;
			x-= x_;
			y-= y_;
			
			//draws the reflected sprites
			surface_set_target(other.refl_surf);
			event_perform(ev_draw,ev_draw_begin);
			event_perform(ev_draw,ev_draw_normal);
			event_perform(ev_draw,ev_draw_end);
			surface_reset_target();
			
			//draws the gradient for the reflected sprites on another surface
			var temp_surf = surface_create(w_,h_);
			surface_set_target(temp_surf);
			draw_clear_alpha(black,0);
			
			event_perform(ev_draw,ev_draw_begin);
			event_perform(ev_draw,ev_draw_normal);
			event_perform(ev_draw,ev_draw_end);
			
			gpu_set_blendmode_ext(bm_dest_alpha,bm_zero);
			
			draw_rectangle_color(0,0,w_,h_,white,white,white,white,0);
			draw_rectangle_color(0,y,w_,y+40,black,black,white,white,0);
			gpu_set_blendmode(bm_normal);
			surface_reset_target();
			
			//draws it to the main surface
			surface_set_target(other.refl_mask_surf);
			draw_surface(temp_surf,0,0);
			surface_reset_target();
			surface_free(temp_surf);
			
			image_yscale = -image_yscale;
			x+= x_;
			y+= y_;
		}
	}
	
	shader_set(sh_water);
	shader_set_uniform_f(uniTime,current_time);
	
	var tex = surface_get_texture(refl_surf);
	shader_set_uniform_f(uniTexel,texture_get_texel_width(tex),texture_get_height(tex));
	
	shader_set_uniform_f(uniOffset,y_);
	
	var mask = surface_get_texture(refl_mask_surf);
	texture_set_stage(uniMask,mask);
	
	draw_surface(refl_surf,global.camera.get_x(),global.camera.get_y());
	shader_reset()
}