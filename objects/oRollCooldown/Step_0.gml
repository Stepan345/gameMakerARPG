if(instance_exists(oPlayer)){
	var rollCooldown = oPlayer.rollCooldown
	var rollDown = oPlayer.rollDown
	var barPercentage = rollDown/rollCooldown
	//print("barPercentage = "+string(barPercentage))
	barLength = lerp(sprite_get_width(sRollCooldownBar)-6,0,barPercentage)
	//print("barLength = "+ string(barLength))
}