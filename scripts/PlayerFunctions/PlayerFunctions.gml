
function playerCollision(){
	yCol = y-VERTICAL_COL_OFFSET
	var collision = false
	var entityList = ds_list_create()
	var yOverwrite = false
	if(tilemap_get_at_pixel(collisionMap, x+hSpd,yCol)){
		x-= x mod TILE_SIZE
		if(sign(hSpd)==1) x += TILE_SIZE-1
		hSpd = 0
		collision = true
	}
	//entityCol collision
	var entityCount = instance_position_list(x+hSpd,yCol,pEntity,entityList,false)
	var snapX
	while(entityCount > 0){
		var entityCheck = entityList[| 0]
		if(entityCheck.entityCollision){
			if(sign(hSpd) == -1)snapX = entityCheck.bbox_right+1
			else snapX = entityCheck.bbox_left-1

			x = snapX
			hSpd = 0
			collision = true
			entityCount = 0
		}
		ds_list_delete(entityList,0)
		entityCount--
	}
	x += hSpd
	ds_list_clear(entityList)
	
	if(tilemap_get_at_pixel(collisionMap, x,yCol+vSpd)){
		yCol-= yCol mod TILE_SIZE
		if(sign(vSpd)==1) yCol+= TILE_SIZE-1
		vSpd = 0
		collision = true
	}
	//entity collision
	entityCount = instance_position_list(x,yCol+vSpd,pEntity,entityList,false)
	var snapY
	while(entityCount > 0){
		var entityCheck = entityList[| 0]
		if(entityCheck.entityCollision){
			if(sign(vSpd) == -1)snapY = entityCheck.bbox_bottom+1
			else snapY = entityCheck.bbox_top-1

			yCol= snapY
			vSpd = 0
			collision = true
			entityCount = 0
		}
		ds_list_delete(entityList,0)
		entityCount--
	}
	y += vSpd
	ds_list_destroy(entityList)
	return collision
	
}
function playerAnimateSprite(){
	var cardinalDirection = CARDINAL_DIR
	var totalFrames = sprite_get_number(sprite_index)/4
	image_index = localFrame + (cardinalDirection * totalFrames)
	
	localFrame  += sprite_get_speed(sprite_index) / FRAME_RATE
	
	if(localFrame >= totalFrames){
		animationEnd = true
		localFrame -= totalFrames
	}else animationEnd = false
}
function roomTransition(_type,_targetRoom){
	if(!instance_exists(oTransition)){
		with(instance_create_depth(0,0,-9999,oTransition)){
			type = _type
			targetRoom = _targetRoom
		}
	}else print("Transition is already happening")
}
function playerAct(sprite,endScript = -1){
	state = playerStateAct
	sprite_index = sprite
	if(endScript != -1)animationEndScript = endScript
	localFrame = 0
	image_index = 0
	playerAnimateSprite()
}
function playerThrow(){
	with(global.iLifted){
		lifted = false
		persistent = false
		thrown = true
		z = CARRY_HEIGHT
		throwPeakHeight = z+10
		throwDistanceTravelled = 0
		throwStartPercent = (13/throwPeakHeight) *0.5
		throwPercent = throwStartPercent
		throwDistance = entityThrowDistance
		bounce = entityBounce
		throwSpeed = 2
		direction = other.direction
		xstart = x
		ystart = y
	}
	playerAct(sPlayer_Lift)
	state = playerStateLocked
	playerLock = FRAME_RATE/4
	global.iLifted = noone
}
