if(instance_exists(oPlayer)){
	draw_rectangle(guiX+3,guiY,guiX+barLength+3,guiY+sprite_get_height(sRollCooldownBar)-1,false)
	draw_sprite(sRollCooldownBar,0,guiX,guiY)
	draw_set_color(c_white)
	
}