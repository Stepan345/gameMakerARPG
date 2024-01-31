cam = view_camera[0]
if(instance_exists(oPlayer)){
	global.iCamera.x=oPlayer.x
	global.iCamera.y=oPlayer.y
	x = oPlayer.x
	y = oPlayer.y

}
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
camWidth = camera_get_view_width(cam)
camHeight =  camera_get_view_height(cam)
/*
if(camWidth>room_width){
	camera_set_view_size(cam,room_width,camHeight)
	camWidth = camera_get_view_width(cam)
	viewWidthHalf = camera_get_view_width(cam) * 0.5;
}
if(camHeight>room_height){
	camera_set_view_size(cam,camWidth,room_height)
	camHeight =  camera_get_view_height(cam)
	viewHeightHalf = camera_get_view_height(cam) * 0.5;
}
*/

