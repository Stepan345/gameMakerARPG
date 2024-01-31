lerpProgress += (1 - lerpProgress) /50;
textProgress += global.textSpeed;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("w"));
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("s"));
respSelected += (keyDown - keyUp);
var maximum = array_length(resp)-1;
var minimum = 0;
if(respSelected > maximum) respSelected = minimum
if(respSelected < minimum) respSelected = maximum
if (keyboard_check_pressed(vk_space)){
	var messageLength = string_length(message);
	if(textProgress >= messageLength){
		if(resp[0] != -1)with(originInstance)dialogueResponces(other.respScripts[other.respSelected],other.background);
		//oPlayer.activateDown = oPlayer.activateCooldown
		instance_destroy();
		if(instance_exists(oTextQue)) with(oTextQue) ticket--
		else with(oPlayer) state = lastState
	}else if(textProgress>2) textProgress = messageLength
		
}