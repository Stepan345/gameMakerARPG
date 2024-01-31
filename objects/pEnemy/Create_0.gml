event_inherited()

state = ENEMY_STATE.IDLE
hSpeed = 0 
vSpeed = 0
xTo = xstart
yTo = ystart
dir = 0
timePassed = 0
waitDuration = 60
wait = 0
aggroCheck = 0
aggroCheckDuration = 5
statePrevious = state
stateTarget = state
stateWait = 0
stateWaitDuration = 0

sprMove = sSlime

enemyScript[ENEMY_STATE.IDLE] = -1
enemyScript[ENEMY_STATE.WANDER] = -1
enemyScript[ENEMY_STATE.CHASE] = -1
enemyScript[ENEMY_STATE.ATTACK] = -1
enemyScript[ENEMY_STATE.HURT] = -1
enemyScript[ENEMY_STATE.DIE] = -1
enemyScript[ENEMY_STATE.WAIT] = enemyWait