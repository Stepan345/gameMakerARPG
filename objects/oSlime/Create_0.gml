event_inherited();

state = ENEMY_STATE.WANDER

sprMove = sSlime
sprAttack = sSlime_Attack
totalDistance = 0

enemyScript[ENEMY_STATE.WANDER] = slimeWander
enemyScript[ENEMY_STATE.CHASE] = slimeChase
enemyScript[ENEMY_STATE.ATTACK] = slimeAttack