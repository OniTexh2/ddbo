function dialogue() constructor{
	_dialogs = []
	
	add = function(_message, _velvet){
		array_push(_dialogs, {
			message: _message,
			velvet: _velvet
		})
	}
	
	pop = function(){
		var t = array_first(_dialogs);
		array_delete(_dialogs, 0, 1)
		
		return t;
	}
	
	count = function(){
		return array_length(_dialogs)
	}
}