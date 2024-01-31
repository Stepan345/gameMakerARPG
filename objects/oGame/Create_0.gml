randomize();

global.gamePaused = false;
global.iCamera = instance_create_layer(0,0,layer,oCamera);
global.textSpeed = 0.75;
global.targetRoom = -1
global.targetX = -1
global.targetY = -1
global.targetDirection = 1
global.iLifted = noone

global.potGiven = false
surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H);
room_goto(ROOM_START);

// Load JSON file
/*
var json_file = file_text_open_read("");
var json_string = "";

while (!file_text_eof(json_file)) {
    json_string += file_text_readln(json_file);
}

file_text_close(json_file);

// Parse JSON string
global.json_data = json_decode(json_string);

// Access data from JSON

// Use the data in your game
show_message("Player: " + playerName + ", Score: " + string(playerScore));
*/