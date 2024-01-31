function attackSlash(){
	if(sprite_index != sPlayer_Attack_Slash){
		sprite_index = sPlayer_Attack_Slash
		localFrame = 0
		image_index = 0
		if(!ds_exists(hitByAttack,ds_type_list))hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack)
	}
	playerAnimateSprite();
	if(animationEnd){
		state = playerStateFree
		animationEnd = false
	}
	calcAttack(sPlayer_Attack_SlashHB)
}
function calcAttack(hitBox){
	mask_index = hitBox;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,pEntity,hitByAttackNow,false);
	if(hits > 0){
		for(i = 0; i<hits;i++){
			var hitID = hitByAttackNow[| i];
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack,hitID)
				with(hitID){
					if(entityHitScript != -1){
						script_execute(entityHitScript)
					} //ew
				} //ew
			} //ew
		} //ew
	} //ew
	ds_list_destroy(hitByAttackNow)
	mask_index = sPlayer;
}