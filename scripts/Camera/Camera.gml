// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenShake(strength,length){
	with(global.iCamera){
		if(strength > shakeRemain){
			shakeMagnitude = strength
			shakeRemain = shakeMagnitude
			shakeLength = length
		}
	}
}