switch(type){
	case(TRANS_TYPE.FADE):{
		draw_set_color(c_black)
		draw_set_alpha(percent)
		draw_rectangle(0,0,width,height,false)
		break
	}
	case(TRANS_TYPE.SLIDE):{
		draw_set_color(c_black)
		draw_rectangle(0,0,width,percent*heightHalf,false)
		draw_rectangle(0,height,width,height-(percent*heightHalf),false)
		break
	}
	case(TRANS_TYPE.NONE):{
		break
	}
		
}