function slimeWander(){
	sprite_index = sprMove
	
	if((x==xTo && y==yTo) || timePassed > enemyWanderDistance / enemySpeed){
		hSpeed = 0
		vSpeed = 0
		if(image_index<1){
			image_speed = 0.0
			image_index = 0
		}
		if(++wait >= waitDuration){
			wait = 0
			timePassed = 0
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45)
			xTo = x + lengthdir_x(enemyWanderDistance , dir)
			yTo = y + lengthdir_y(enemyWanderDistance , dir)
		}
	}else{
		timePassed++
		image_speed = 1
		var distanceLeft = point_distance(x,y,xTo,yTo)
		var speedThisFrame = enemySpeed
		if(distanceLeft < enemySpeed) speedThisFrame = distanceLeft
		dir = point_direction(x,y,xTo,yTo)
		hSpeed = lengthdir_x(speedThisFrame,dir)
		vSpeed = lengthdir_y(speedThisFrame,dir)
		if(hSpeed != 0) image_xscale = sign(hSpeed)
		enemyCollision()
	}
	
	
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0 
		if(instance_exists(oPlayer) && point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius){
			state = ENEMY_STATE.CHASE
			target = oPlayer
		}
	}
}
function slimeChase(){
	sprite_index = sprMove
	if(instance_exists(oPlayer)){
		xTo = oPlayer.x
		yTo = oPlayer.y
		var distanceLeft = point_distance(x,y,xTo,yTo)
		image_speed = 1.0
		dir = point_direction(x,y,xTo,yTo)
		if(distanceLeft > enemySpeed){
			hSpeed = lengthdir_x(enemySpeed,dir)
			vSpeed = lengthdir_y(enemySpeed,dir)
		}else{
			hSpeed = lengthdir_x(distanceLeft,dir)
			vSpeed = lengthdir_y(distanceLeft,dir)
		}
		if(hSpeed != 0) image_xscale = sign(hSpeed)
		
		enemyCollision()
		if(point_distance(x,y,xTo,yTo) > enemyAggroRadius*2){
			state = ENEMY_STATE.WANDER
			xstart = x
			ystart = y
		}
		if(point_distance(x,y,target.x,target.y) <= enemyAttackRadius){
			state = ENEMY_STATE.ATTACK
			sprite_index = sprAttack
			image_index = 0
			image_speed = 1
			xTo += lengthdir_x(8,dir)
			yTo += lengthdir_y(8,dir)
		}
	}
}
function enemyWait(){
	if(++stateWait >= stateWaitDuration){
		stateWait = 0
		state = stateTarget
	}
}

function slimeAttack(){
	var spd = enemySpeed
	var distanceLeft = point_distance(x,y,xTo,yTo)
	if(image_index < 2){
		spd = 0
		totalDistance = distanceLeft
	}
	if(floor(image_index) == 3 || floor(image_index = 5))image_speed = 0
	if(distanceLeft < 4 && image_index<5)image_speed = 1
	if(distanceLeft > spd){
		var jumpPercent = distanceLeft / totalDistance
		z = max(sin(lerp(0,pi,jumpPercent)),0)
		print(z)
		dir = point_direction(x,y,xTo,yTo)
		hSpeed = lengthdir_x(spd,dir)
		vSpeed = lengthdir_y(spd,dir)
		if(hSpeed != 0)image_xscale = sign(hSpeed)
		if(enemyCollision()){
			xTo = x
			yTo = y
		}
		
	}else{
		z = max(z,0)
		print(z)
		x = xTo
		y = yTo
		if(floor(image_index) == 5){
			z = 0
			stateTarget = ENEMY_STATE.CHASE
			stateWaitDuration = 15
			state = ENEMY_STATE.WAIT
		}
	}
}