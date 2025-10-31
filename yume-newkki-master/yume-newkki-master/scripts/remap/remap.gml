///@function remap(value,min,max,new_min,new_max)
///@description remaps value from low1 and high1 values to be within low2 and high2 values
function remap(value,low1,high1,low2,high2){
	
	// -1 to 1
	// 0 to 1
	// 0 -> 0.5
	
	return low2 + (value - low1) * (high2 - low2) / (high1 - low1)

}