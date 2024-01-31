keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyActivate = keyboard_check_pressed(vk_space);
keyAttack = keyboard_check_pressed(vk_shift);
keyItem = keyboard_check_pressed(vk_control);

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight-keyLeft!=0)||(keyDown-keyUp!=0);
depth = -bbox_bottom;
if(!global.gamePaused) script_execute(state);

//print(keyActivate)
//print("oPlayer.x = " + string(x))
//print("oPlayer.y = " + string(y))