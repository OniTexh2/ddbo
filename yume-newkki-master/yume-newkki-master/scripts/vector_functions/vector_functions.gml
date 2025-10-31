/// Vector Script Functions


//Main Vector Struct
///@function vector(_x, _y)
function vector(_x, _y) constructor {
	x = _x;
	y = _y;
	
	///@function set(_x, _y)
	static set = function(_x, _y) {
		x = _x;
		y = _y;
	}	
	
	///@function add(_vector)
	static add = function(_vector) {
		gml_pragma("forceinline");
		x += _vector.x;
		y += _vector.y;
	}
	
	///@function subtract(_vector)
	static subtract = function(_vector) {
		gml_pragma("forceinline");
		x -= _vector.x;
		y -= _vector.y;
	}
	
	///@function negate()
	static negate = function() {
		x = -x;
		y = -y;
	}
	
	///@function multiply(_scalar)
	static multiply = function(_scalar) {
		gml_pragma("forceinline");
		x *= _scalar;
		y *= _scalar;
	}
	
	///@function divide(_scalar)
	static divide = function(_scalar) {
		x /= _scalar;
		y /= _scalar;
	}
    
	///@function get_magnitude()
	static get_magnitude = function() {
		gml_pragma("forceinline");
		return point_distance(0, 0, x, y);
    }
	
	///@function get_direction()
	static get_direction = function() {
		gml_pragma("forceinline");
		return point_direction(0, 0, x, y);
	}
	
	///@function normalize()
	static normalize = function() {
		gml_pragma("forceinline");
		if ((x != 0) || (y != 0)) {
			var _factor = 1/sqrt((x * x) + (y * y));
			x = _factor * x;
			y = _factor * y;	
		}
	}
	
	///@function set_magnitude(_scalar)
	static set_magnitude = function(_scalar) {
		gml_pragma("forceinline");
		normalize();
		multiply(_scalar);	
	}	
	
	///@function limit_magnitude(_limit)
	static limit_magnitude = function(_limit) {
		gml_pragma("forceinline");
		if (get_magnitude() > _limit) {
			set_magnitude(_limit);
		}
	}

	///@function copy(_vector)
	static copy = function(_vector) {
		x = _vector.x;
		y = _vector.y;
	}

}

//Children/Extensions of the Main Vector Struct

///@function vector_zero()
function vector_zero() : vector() constructor {
    x = 0;
    y = 0;
}

///@function vector_ramdom(_length = 1)
function vector_random(_length = 1) : vector() constructor {
	var _dir = random(360);
    x = lengthdir_x(_length, _dir);
    y = lengthdir_y(_length, _dir);
}

///@function vector_lengthdir(_length, _dir)
function vector_lengthdir(_length, _dir) : vector() constructor {
    x = lengthdir_x(_length, _dir);
    y = lengthdir_y(_length, _dir);
}

//Vector Functions Don't Modify the Original Vector

///@function vector_copy(_vector)
function vector_copy(_vector) {
	return new vector(_vector.x, _vector.y);
}

///@function vector_subtract(_vector_a, _vector_b)
function vector_subtract(_vector_a, _vector_b) {
	return new vector((_vector_a.x - _vector_b.x), (_vector_a.y - _vector_b.y));
}