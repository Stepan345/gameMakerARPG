if(!global.gamePaused){
	if (bounceCount != 0){
		bounce += pi * bounceSpeed
		if(bounce > pi){
			bounce -= pi
			bounceHeight *= 0.6
			bounceCount--
		}
		z = abs(sin(bounce))*bounceHeight
	}
	else z = 0
	
	detetiorate ++
	if(detetiorate > deteriorateAfter){
		image_alpha -= 1/deteriorateTime
		if(image_alpha <= 0)instance_destroy()
		
	}
	fric = 0.05
	if(z == 0)fric = 0.1
	x += lengthdir_x(spd,direction)
	y += lengthdir_y(spd,direction)
	if(tilemap_get_at_pixel(collisionMap,x,y)>0) spd = 0
	spd = max(spd-fric,0)
}












