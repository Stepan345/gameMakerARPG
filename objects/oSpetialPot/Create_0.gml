///@desc If Questy has pot then don't spawn
if(global.potGiven)instance_destroy()

event_inherited();

