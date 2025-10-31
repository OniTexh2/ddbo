function tag_seperator(){
	
	var frame_tags = [
		{ name: "Normal",			from: 0, to: 21},
			{ name: "Front",		from: 0, to: 2 },
			{ name: "Right",		from: 3, to: 5 },
			{ name: "Left",			from: 6, to: 8 },
			{ name: "Back",			from: 9, to: 11 },
			{ name: "Wake",			from: 12, to: 18 },
				{ name: "sleepy",	from: 12, to: 14 },
				{ name: "scared",	from: 15, to: 18 },
			{ name: "Shake",		from: 19, to: 21 },
		{ name: "Stick",			from: 22, to: 33 },
			{ name: "Front",		from: 22, to: 24 },
			{ name: "Right",		from: 25, to: 27 },
			{ name: "Left",			from: 28, to: 30 },
			{ name: "Back",			from: 31, to: 33 },
		{ name: "Penguin",			from: 34, to: 57 },
			{ name: "Front",		from: 34, to: 36 },
			{ name: "Right",		from: 37, to: 39 },
			{ name: "Left",			from: 40, to: 42 },
			{ name: "Back",			from: 43, to: 45 },
			{ name: "Slide",		from: 46, to: 57 },
	];
	var new_frame_tags = [];
	
	var from = 0;
	var to = 0;
	var total_length = array_length(frame_tags);
	
	for (var i = 0; i < total_length; ++i) {
	    var tag = frame_tags[@i];
		
		//if any subsequent tags are within this tags range.
		//then the current tags name gets prepended to their names
		//the current tag gets discared from the new array
		
		var is_parent = false;
		var lookahead = 1;
		
		if(i+lookahead < total_length){
			var tag_ahead = frame_tags[@i+lookahead];
		
			while(tag.from <= tag_ahead.from && tag.to >= tag_ahead.to ){
				is_parent = true;
				
				if(struct_exists(tag_ahead,"parent")){
					tag_ahead.parent = $"{tag_ahead.parent}_{tag.name}";
				} else {
					tag_ahead.parent = tag.name;
				}
				
				lookahead++;
				if(i+lookahead < total_length){
					var tag_ahead = frame_tags[@i+lookahead];
				} else break;
			}
		}
		
		if(is_parent == false) {	
			array_push(new_frame_tags,tag);
		}
	}
	
	//combines the name and parent name together
	for (var i = 0; i < array_length(new_frame_tags); ++i) {
	    tag = new_frame_tags[@i];
		if(struct_exists(tag,"parent")){
			tag.name = $"{tag.parent}_{tag.name}";
			struct_remove(tag,"parent");
		}
		
	}
	
	show_debug_message("New sprite names right here!!!");
	show_debug_message("_____________________________");
	
	for (var i = 0; i < array_length(new_frame_tags); ++i) {
	    var tag = new_frame_tags[i];
		show_debug_message($"name: {tag.name}, from: {tag.from}, to: {tag.to}");
	}
	
	show_debug_message("_____________________________");
}

tag_seperator();