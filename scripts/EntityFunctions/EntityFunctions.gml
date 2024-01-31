function activateLiftable(objectLift){
	if(global.iLifted == noone){
		playerAct(sPlayer_Lift)
		global.iLifted = objectLift
		with(global.iLifted){
			lifted = true
			persistent = true
		}
		
	}
}
function newTextBox(msg,bg = 0,resps = ["0:err"]){
	respScripts = [-1];
	var responces = [];
	array_copy(responces,0,resps,0,array_length(resps));
	var object = 0;
	if(instance_exists(oText)) object = oTextQue ;
	else object = oText;
	with(instance_create_layer(0,0,"Instances",object)){
		if(instance_exists(other)) originInstance = other;
		else originInstance = noone;
		background = bg;
		message = msg;
		if(resps[0] != "0:err"){
			resp = responces;
			for(i=0;i<array_length(resp); i++){
				var markerPosition = string_pos(":",resp[i]);
				respScripts[i] = real(string_copy(resp[i],1,markerPosition-1));
				resp[i] = string_delete(resp[i],1,markerPosition);
			}
		}
	}
	with(oPlayer){
		if(state !=playerStateLocked){
			lastState = state;
			state = playerStateLocked;
		}
		
	}
}