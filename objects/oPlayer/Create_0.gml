state = playerStateFree;
stateAttack = attackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
image_speed = 0;
z = 0;
hSpd = 0;
vSpd = 0;
playerLock = 0;
spdWalk = 2.0;
spdRoll = 3.0;
distanceRoll = 72;
distanceBonk = 30;
distanceBonkHeight = 12;
speedBonk = 1;
animationEndScript = -1
yCol = y-VERTICAL_COL_OFFSET

rollCooldown = 1*FRAME_RATE;
rollDown = 0;
activateCooldown = 10;
activateDown = 0;
throwDown = 0
throwCooldown = FRAME_RATE/2



spriteRun = sPlayer_Run;
spriteIdle = sPlayer;
spriteRoll = sPlayer_Roll;
localFrame = 0;

if(global.targetX != -1){
	x=global.targetX
	y=global.targetY
	direction = global.targetDirection
}

