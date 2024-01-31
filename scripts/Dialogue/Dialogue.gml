function dialogueResponces(responce,bg){
	switch(responce){
		default:newTextBox("ResponceNotFound");throw(responce);break;
		case 0:break;
		case 1:{
			if(global.iLifted != noone && global.iLifted.object_index == oSpetialPot) newTextBox("Dude no way that's so sick of you",bg,["3:Give him pot","4:Look at what's in the pot"]);
			else newTextBox("WTF dude, you can't lie to me about shit like that\nI can see that you don't have my pot\nThat's like extra fucked up of you",bg)
			break;
		}
		case 2:newTextBox("Alright man see you in a bit, you better have my pot",bg);break;
		case 3:{
			instance_destroy(global.iLifted)
			global.iLifted = noone
			newTextBox("Thank you so much for this pot, but I got to go now\nI'll see you around bro",bg);
			instance_destroy(oQuesty)
			global.potGiven = true
			break;
		}
		case 4:{
			newTextBox("You look inside the pot\nAt the bottom of the pot is a white powdery substance",bg)
			newTextBox("Hey man what are you doing with my pot?",bg)
			newTextBox("you better not be planing to steal it",bg,["5:Steal the pot","3:Give him the pot"])
			break;
		}
		case 5:{
			newTextBox("Hey man give me back my pot,\n that's so not chill of you to steal it like that, that's acually so fucked up\nThat's it I'm leaving man there's no way I'm living here with a pot stealer",bg)
			break;
			}
		case 6:{
			newTextBox("Why won't you kill me? Please just kill me",bg)
			newTextBox("I'm begging you, kill me",bg,["5:Kill him","5:Kill him"]);
		}
		case 10:{
			instance_destroy()
		}
	}
}