function playerStateFree(){
	rollDown = max(0,rollDown-1);
	activateDown = max(0,activateDown-1);
	throwDown = max(0,throwDown-1)
	hSpd = lengthdir_x(inputMagnitude * spdWalk, inputDirection);
	vSpd = lengthdir_y(inputMagnitude * spdWalk, inputDirection);

	playerCollision()

	var oldSprite = sprite_index;
	if(inputMagnitude != 0){
		direction = inputDirection;
		sprite_index = spriteRun;
	}else sprite_index = spriteIdle;

	if(oldSprite != sprite_index) localFrame = 0

	playerAnimateSprite()
	
	if(keyActivate){
		var activateX = x+lengthdir_x(10,direction)
		var activateY = y+lengthdir_y(10,direction)
		var activateSize = 4
		var activateList = ds_list_create()
		activate = noone
		var entitiesFound = collision_rectangle_list(
			activateX-activateSize,
			activateY-activateSize,
			activateX+activateSize,
			activateY+activateSize,
			pEntity,
			false,
			true,
			activateList,
			true
		)
		while(entitiesFound > 0){
			var check = activateList[| --entitiesFound]
			if(check != global.iLifted && check.entityActivateScript != -1){
				activate = check
				break
			}
		}
		ds_list_destroy(activateList)
		if(activate == noone||activateDown != 0){
			if(global.iLifted != noone){
				if(throwDown == 0){
					playerThrow()
					throwDown = throwCooldown
				}
			}
			else if(rollDown == 0){
				state = playerStateRoll
				moveDistanceRemaining = distanceRoll
			}
		}else{
			activateDown = activateCooldown;
			script_execute_array(activate.entityActivateScript,activate.entityActivateArgs)
			if(activate.entityNPC){
				with(activate){
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
		
	}
	if(keyAttack){
		state = playerStateAttack
		stateAttack = attackSlash
	}
		
}
function playerStateRoll(){
	rollDown = rollCooldown
	hSpd = lengthdir_x(spdRoll,direction);
	vSpd = lengthdir_y(spdRoll,direction);
	
	moveDistanceRemaining = max(0,moveDistanceRemaining-spdRoll);
	var collided = playerCollision();
	
	sprite_index = spriteRoll;
	var totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * totalFrames) + ((1 - (moveDistanceRemaining / distanceRoll)) * totalFrames);
	if(moveDistanceRemaining == 0) state = playerStateFree
	
	if(collided){
		//print("collided")
		state = playerStateBonk;
		moveDistanceRemaining = distanceBonk;
		screenShake(4,20)
	}
	
}
function playerStateBonk(){

	hSpd = lengthdir_x(speedBonk,direction-180);
	vSpd = lengthdir_y(speedBonk,direction-180);
	
	moveDistanceRemaining = max(0,moveDistanceRemaining-speedBonk);
	var collided = playerCollision();
	
	sprite_index = sPlayer_Hurt;
	image_index = CARDINAL_DIR - 2;
	
	z = sin(((moveDistanceRemaining / distanceBonk) * pi))*distanceBonkHeight
	
	if(moveDistanceRemaining == 0) state = playerStateFree
	
}
function playerStateLocked(){
	rollDown = rollCooldown
	throwDown = throwCooldown
	if(playerLock > 0){
		playerAnimateSprite()
		playerLock = max(0,--playerLock)
		if(playerLock == 0){
			state = playerStateFree
		}
	}
}
function playerStateAttack(){
	script_execute(stateAttack)
}
function playerStateTransition(){
	playerAnimateSprite()
	playerCollision()
	depth = layer_get_depth("TilesUpper")+1
}
function playerStateAct(){
	playerAnimateSprite()
	if(animationEnd){
		state = playerStateFree
		animationEnd = false
		if(animationEndScript != -1)script_execute(animationEndScript);animationEndScript = -1
	}
}