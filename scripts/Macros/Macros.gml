#macro FRAME_RATE 60
#macro CARRY_HEIGHT 13
#macro TILE_SIZE 16
#macro VERTICAL_COL_OFFSET 4
#macro CARDINAL_DIR round(direction/ 90)
#macro ROOM_START rVillage
#macro RESOLUTION_W 320
#macro RESOLUTION_H 180
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1
function print(text){
	show_debug_message(text);
}
function textSetting(color){
	draw_set_font(fText);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(color);
}
function script_execute_array(src, args){
	switch(array_length(args)){
		case 1: return script_execute(src,args[0])
		case 2: return script_execute(src,args[0],args[1])
		case 3: return script_execute(src,args[0],args[1],args[2])
		case 4: return script_execute(src,args[0],args[1],args[2],args[3])
		case 5: return script_execute(src,args[0],args[1],args[2],args[3],args[4])
		case 6: return script_execute(src,args[0],args[1],args[2],args[3],args[4],args[4])
		case 7: return script_execute(src,args[0],args[1],args[2],args[3],args[4],args[4],args[5])
		default: show_error("Too much arg(augh). *or whatever a computer chocking on di- i mean arguments sounds like*",false)
	}
}
enum ENEMY_STATE{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}