if(!global.gamePaused){
	depth = -bbox_bottom
	if(lifted && instance_exists(oPlayer)){
		if(oPlayer.sprite_index != sPlayer_Lift){
			x = oPlayer.x
			y = oPlayer.y
			z = 13
			depth = oPlayer.depth-1
			
			entityCollision = false
		}
	}if (!lifted){
			entityCollision = entityCollisionStart
			if(thrown){
				throwDistanceTravelled = min(throwDistanceTravelled+throwSpeed,throwDistance)
				x = xstart+lengthdir_x(throwDistanceTravelled,direction)
				y = ystart+lengthdir_y(throwDistanceTravelled,direction)
				if(tilemap_get_at_pixel(collisionMap,x,y)>0){
					if(bounce == 0)bounce++
					direction += 180
					xstart =x
					ystart = y
					throwStartPercent = throwPercent
					throwDistance-=throwDistanceTravelled-(TILE_SIZE/3)
					throwDistanceTravelled = 0
					bounce--
				}
				
				throwPercent = throwStartPercent +lerp(0,1-throwStartPercent,throwDistanceTravelled / throwDistance)
				z = throwPeakHeight * sin(throwPercent *pi)
				if(throwDistance == throwDistanceTravelled){
					if(bounce == 0){
						thrown = false
						if(entityThrowBreak) instance_destroy()
					}else{
						xstart = x
						ystart = y
						throwPercent = 0
						throwDistanceTravelled = 0 
						throwDistance /= 2
						throwPeakHeight /=3
						bounce--
						throwStartPercent = 0
						throwSpeed /=2
					}
					
				}
			}else{
				if(z>0){
					z -= grav
					grav +=  0.1
					if(z = 0 && entityThrowBreak) instance_destroy()
				}else grav = 0.1
			}
		}
}
flash = max(flash-0.03,0)