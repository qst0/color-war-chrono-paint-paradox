if !debug {
	
	draw_set_color(c_white);
	// p1 playericon White BG
	
	draw_rectangle(22, 22,
		22 + sprite_get_width(sprPlayerIcon),
		20 + sprite_get_height(sprPlayerIcon),
		false);
	// p1 paint bar whitebg
	for (var i = 0; i < 100; i++) {
		draw_circle(24 + i, 80, 18, false)
	}
	
	// p2 playericon white BG
	draw_rectangle(1080 - 22 - sprite_get_width(sprPlayerIcon), 22,
		1080 - 22,
		20 + sprite_get_height(sprPlayerIcon),
		false);
	// p2 paint bar whitebg
	for (var i = 0; i < 100; i++) {
		draw_circle(1080 - 24 - 100 + i, 80, 18, false)
	}
	
	// percentbar paint bar whitebg
	for (var i = 0; i < 400; i++) {
		draw_circle(1080 /2 - 200 + i, 48, 36, false)
	}
	
	draw_set_color(c_black);
	
	// percentbar paint bar black
	for (var i = 0; i < 400; i++) {
		draw_circle(1080 /2 - 200 + i, 48, 32, false)
	}
	
	draw_set_color(c_blue);
	// percentbar paint bar blueScore
	for (var i = 0; i < (scoreBlue / totalPaintable) * 100 * 4; i++) {
		draw_circle(1080 /2 - 200 + i, 48, 32, false)
	}
	
	draw_set_color(c_red);
	// percentbar paint bar blueScore
	for (var i = (scoreRed / totalPaintable) * 100 * 4; i > 0 ; i--) {
		draw_circle(1080 /2 + 200 - i, 48, 32, false)
	}
	
	draw_set_color(c_yellow)
	//y2kbar 
	for (var i = 0; i < stepsTillY2K; i++) {
		draw_circle(1080 /2 - stepsTillY2K + i *2, 48, stepsTillY2K/4, false)
	}
	
	//About to win bar
	winbarThing = ((BlueToWin > RedToWin ? BlueToWin : RedToWin) / totalPaintable) * 100;
	for (var i = 0; i < winbarThing; i++) {
		draw_circle(1080 /2 - winbarThing + i *2, 48, winbarThing/4, false)
	}
	if step % 20 == 0 {
		draw_set_color(c_yellow)
	} else {
		if BlueToWin > RedToWin {
			draw_set_color(c_blue)
		} else {
			draw_set_color(c_red)
		}
	}
	for (var i = 0; i < winbarThing; i++) {
		draw_circle(1080 /2 - winbarThing + i *2, 48, winbarThing/6, false)
	}
	
	
	draw_set_color(c_black);
	
	/*
	//time bg
	draw_rectangle(64, 26,
		140,
		56,
		false);
	
	
	//DRAW TIME
	draw_set_color(c_blue);
	displayTime = string(floor(timeLeft / 60)) + ":" + string(timeLeft % 60);
	draw_text(68, 18, displayTime);
	
	draw_set_color(c_purple);
	
	// score bg p1
	draw_rectangle(160, 26,
	    160 + string_width(scoreBlue) + 10,
		56,
		false);
		
	// score bg p2
	draw_rectangle(1080 - 160 - string_width(scoreRed) + 10, 26,
	    1080 - 160,
		56,
		false);
	*/
	draw_set_color(c_black);

	//p1 playericon black bg
	draw_rectangle(24, 24,
		20 + sprite_get_width(sprPlayerIcon),
		16 + sprite_get_height(sprPlayerIcon),
		false);
	//p2 playericon black bg
	draw_rectangle(1080 - 20 - sprite_get_width(sprPlayerIcon), 24,
		1080 - 24,
		16 + sprite_get_height(sprPlayerIcon),
		false);
		
	
	//Player Icon animations
	offset = 16;
	if step % 60 == 0 {
		playerIconFrame = (playerIconFrame + 1) % playerIconFrames;
	}
	//Draw p1 Icon
	draw_sprite_ext(sprPlayerIcon, playerIconFrame,
		22, offset - 4, 1, 1, 0, c_blue, 1);
	//Draw p2 Icon
	draw_sprite_ext(sprPlayerIcon, playerIconFrame,
		1080 - 22, offset - 4, -1, 1, 0, c_red, 1);
	
	// Paint Bar Black BG
	offset += 64;
	//for p1 Black Paint Bar BG
	for (var i = 0; i < 100; i++) {
		draw_circle(24 + i, offset, 16, false)
	}
	//for P2 Black Paint Bar BG
	for (var i = 0; i < 100; i++) {
		draw_circle(1080 - 24 - 100 + i, offset, 16, false)
	}
	
	//DRAW SCORE
	draw_text(168, 18, scoreBlue);
	
	draw_set_color(c_blue)
	for (var i = 0; i < p1PaintPercent; i++) {
		rad = 2 + p1PaintPercent / 10;
		draw_circle(24 + i, offset, rad, false)
	}
	
	draw_set_color(c_red)
	for (var i = p2PaintPercent; i > 0; i--) {
		rad = 2 + p2PaintPercent / 10;
		draw_circle(1080 - 24 - i, offset, rad, false)
	}
	offset += 32;
	
	
	


} else if debug {
	//score stuff
	draw_set_color(c_yellow);
	yOffset = 10;
	draw_text(10,yOffset, scoreBlue)
	yOffset += 20;
	draw_text(10,yOffset, scoreRed)
	yOffset += 20;

	draw_text(10,yOffset, scoreRed)
	yOffset += 20;
	
	
	/*
	//Check device inputs
	deviceID = 0;
	for (i = 0; i < gamepad_button_count(deviceID); i++) {
		draw_text(10,yOffset, gamepad_button_check(deviceID, i))
		yOffset += 20;
	}
	yOffset += 20;
	draw_text(10,yOffset, gamepad_button_count(deviceID))
	yOffset += 10;

	for (i = 0; i < gamepad_axis_count(deviceID); i++) {
		draw_text(10,yOffset, gamepad_axis_value(deviceID,i))
		yOffset += 20;
	}
	yOffset += 20;
	draw_text(10,yOffset, gamepad_axis_count(deviceID))
	yOffset += 10;

	//check another device inputs
	yOffset = 0;
	deviceID = 1;
	for (i = 0; i < gamepad_button_count(deviceID); i++) {
		draw_text(100,yOffset, gamepad_button_check(deviceID, i))
		yOffset += 20;
	}
	yOffset += 20;
	draw_text(100,yOffset, gamepad_button_count(deviceID))
	yOffset += 10;

	for (i = 0; i < gamepad_axis_count(deviceID); i++) {
		draw_text(100,yOffset, gamepad_axis_value(deviceID,i))
		yOffset += 20;
	}
	yOffset += 20;
	draw_text(100,yOffset, gamepad_axis_count(deviceID))
	yOffset += 10;

	/*
	yOffset += 20;
	draw_text(10,yOffset, gamepad_button_count(4))
	*/

	/*
	//What gamepads are connected?
	yOffset = 10;
	xOffset = 200;
	for (i = 0; i < gamepad_get_device_count(); i++) {
		draw_text(xOffset,yOffset, string(gamepad_is_connected(i))
					+ " " + string(gamepad_button_count(i)))
		yOffset += 20;
	}
	/**/
}