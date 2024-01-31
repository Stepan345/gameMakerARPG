function entityHitDestroy(){
	instance_destroy();
}
function entityHitSolid(){
	flash = 0.5
}
function dropItems(xpos,ypos,items=[-1]){
	var lenItems = array_length(items)
	
	if(lenItems > 1){
		var anglePerItem = 360/lenItems
		var angle = random(360)
		for(i=0; i< lenItems;i++){
			with(instance_create_layer(xpos,ypos,"Instances",items[0])){
				direction = angle+(anglePerItem*other.i)
				spd = 0.75 + (lenItems *0.1)*random(0.1)
			}
		}
	}else instance_create_layer(xpos,ypos,"Instances",items[0]) 
}