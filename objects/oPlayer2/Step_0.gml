/// @desc ?
/// @desc ?

if !dying {
	keyLeft = keyboard_check(vk_left) //or keyboard_check(ord("A"));
	keyRight = keyboard_check(vk_right) //or keyboard_check(ord("D"));
	keyUp = keyboard_check(vk_up) //or keyboard_check(ord("W"));;
	keyDown = keyboard_check(vk_down) //or keyboard_check(ord("S"));
	keyJump = keyboard_check_pressed(vk_rcontrol);
} else {
	keyLeft = false;
	keyRight = false;
	keyUp = false;
	keyDown = false;
	keyJump = false;
}

/*
// TODO Re-add ducking when the camera comes back
if keyDown {
	oCamera.yOffset = oCamera.viewHeightHalf / 2;
} else if keyUp {
	oCamera.yOffset = -oCamera.viewHeightHalf / 2;
} else {
	oCamera.yOffset = 0;
}
*/

if oGame.step % frictionRate == 0 {
	if hsp != 0 {
		if hsp > 0{
			hsp -= frictionFactor;
		} else if hsp < 0 {
			hsp += frictionFactor;
		}
	}
}

if oGame.step % walkRate == 0 {
var move = keyRight - keyLeft;
if (hsp + move * walksp) < maxwalksp
	and (hsp + move * walksp) > -maxwalksp
hsp += move * walksp;
}

if oGame.step % frictionRate == 0 {
	if vsp != 0 {
		if vsp > 0{
			vsp -= frictionFactor;
		} else if hsp < 0 {
			vsp += frictionFactor;
		}
	}
}

if vsp < maxvsp {
	vsp += grv;
}

// jumping on the floor
if place_meeting(x, y + 0.1, oSolid){
	jumpCharges = maxJumpCharges;
	if keyJump {
		vsp = - jumppow;
	}
}

// Jumpming in the air
if keyJump and jumpCharges {
	vsp = - jumppow;
	jumpCharges--;
}

/*
if place_meeting(x + hsp, y, oSolid) // we'll hit a solid going left or right
	&& place_meeting(x + hsp, y, oBlood)  // and it will be a blood
	{
	bloodFall = true;
}
*/

if place_meeting(x + hsp, y, oSolid) // we'll hit a solid going left or right
	// && place_meeting(x + hsp, y, oWall)  // and it will be a wall
	{
	while !place_meeting(x + sign(hsp)/10, y, oSolid) {
		x += sign(hsp)/10;
	}
	pushed = false;
	for (var i = 1; i <= thresh; i++){
		if !place_meeting(x + sign(hsp), y - i, oSolid) {
			y -=  i;
			pushed = true;
		} else {
		}
	}
	
	if !pushed {
		hsp = 0;
	}
}

x += hsp;

// do floor detections. aka falling and rising

/*
if place_meeting(x, y + vsp, oSolid) // We'll hit a solid
	&& place_meeting(x, y + vsp, oBlood) // it'll be blood
	{
	if bloodFall {
		bloodFall = false;
	} else if sign(vsp) != -1 {
		while !place_meeting(x, y + sign(vsp)/10, oBlood) {
			y += sign(vsp)/10;
		}
		vsp = 0;
	}

}
*/

if place_meeting(x, y + vsp, oSolid) // We'll hit a solid
	//&& place_meeting(x, y + vsp, oWall) // it will be a Wall.
	{
	// So go toward it till we do hit it.
	while !place_meeting(x, y + sign(vsp)/10, oSolid) {
		y += sign(vsp)/10;
	}
	//Then stop.
	//effect_create_below(ef_rain, x, y, vsp*10, c_red);
	vsp = 0;
}

y += vsp;

/*
//TODO Death needs added again, this logic is for qstPixel / Marrow quest.

if !dying 
	&& (place_meeting(x, y, oDeathTrigger) 
	|| playerHealth <= 0
	|| place_meeting(x,y, oChaser))
	{
	//You died.
	sprite_index = sprPlayerDeath;
	image_index = 0;
	image_speed = 1;
	alarm[0] = 180;
	if playerHealth > 0 {
		oPlayer.deathMessage = "Watch out, marrow is fragile!";
	} else {
		oPlayer.deathMessage = "Clicking spends marrow's blood!";
	}
	dying = true;
}

if dying {
	if image_speed = 1 && image_index == sprite_get_number(sprPlayerDeath) - 1{
		image_speed = 0;
	}
	if playerHealth > 0 {
		playerHealth--;
	}
	makeBlood(playerHealth, -9, 9, -7, 9, oQstPixel.pixelScale, oQstPixel.step);
	return;
}
*/


// Animations

if hsp > 0 { // Moving Right.
	image_xscale = 1;
}
if hsp < 0 { // Moving left.
	image_xscale = -1;
}

// Jumping
image_blend = color;
if !place_meeting(x, y + 0.1, oSolid) {
	sprite_index = sprPlayerJump;
	image_speed = 0;
	if (sign(vsp) > 0) { //falling
		image_index = 6;
	} else { //Rising
		image_index = 2;
	}
} else {
	image_speed = 1;
	if (hsp == 0) { //Idle
		if keyDown {
			sprite_index = sprPlayerDownIdle;
		} else if keyUp {
			sprite_index = sprPlayerUpIdle;
		} else {
			sprite_index = sprPlayerIdle;
		}
	} else { //Running
		sprite_index = sprPlayerRun;
	}
}

