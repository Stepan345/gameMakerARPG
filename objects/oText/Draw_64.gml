draw_sprite_stretched(sTextBoxBg,background,x1,y1,x2-x1,y2-y1);
textSetting(c_black);
var print = string_copy(message,1,textProgress);

if (resp[0] != -1 && textProgress >= string_length(message)){
	for (i = 0; i < array_length(resp); i++){
		print += "\n"
		if(i == respSelected) print += "> ";
		print += resp[i];
		if(i == respSelected) print += " <";
	}
}

draw_text((x1+x2)/2,y1+10,print);
draw_set_color(c_white);
draw_text(((x1+x2)/2)+1,y1+9,print);