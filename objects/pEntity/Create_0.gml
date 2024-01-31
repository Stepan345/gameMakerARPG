/// @desc Entity Setup
z = 0
flash = 0
uFlash = shader_get_uniform(shFlash,"flash")
centerX = x - sprite_get_xoffset(sprite_index) + sprite_width / 2
centerY = y - sprite_get_yoffset( sprite_index) + sprite_height / 2
lifted = 0
thrown = false
entityCollisionStart = entityCollision