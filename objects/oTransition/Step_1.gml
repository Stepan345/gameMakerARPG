with(oPlayer)state = playerStateTransition
if(leading == OUT){
	percent = min(1,percent+ TRANSITION_SPEED)
	if(percent >= 1){
		room_goto(targetRoom)
		leading = IN
	}
}else{ //leading == IN
	percent = max(0,percent - TRANSITION_SPEED)
	if(percent <= 0){
		with(oPlayer)state = playerStateFree
		instance_destroy()
	}
}