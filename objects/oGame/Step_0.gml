/// @desc hmmmm

//First Step Settings, (instance hackery? is this needed? Check later TODO)
if step == 0 {
	p1Rec_xstart = p1.xstart;
	p1Rec_ystart = p1.ystart;
	p2Rec_xstart = p2.xstart;
	p2Rec_ystart = p2.ystart;
}

if keyboard_check_pressed(vk_f12) {
	debug = !debug;
}

if step % 4 == 0 {
	if p1PaintPercent < 100 && p1.keyDown
		&& !p1.keyLeft && !p1.keyRight{
		p1PaintPercent++;
	}
	if p2PaintPercent < 100 && p2.keyDown
		&& !p2.keyLeft && !p2.keyRight {
		p2PaintPercent++;
	}
}


//TODO adjust for levels
//Default game play 3 sec hold to win, paint half the tiles
scoreToWin = 180
scoreForAdv = totalPaintable / 2;

if BlueToWin == scoreToWin {
	room_goto(rmBlue)
}

if RedToWin == scoreToWin {
	room_goto(rmRed)
}

if scoreRed >= scoreForAdv && scoreBlue < scoreForAdv {
	if RedToWin < scoreToWin { 
		RedToWin++;
		if step % 18 == 0 {
			effect_create_below(ef_rain, p2.x, p2.y, 1, c_red);
		}
	}
	if BlueToWin > 0 {
		BlueToWin--;
	}
	show_debug_message("RED!! " + string(RedToWin))
}

if scoreBlue >= scoreForAdv && scoreRed < scoreForAdv {
	if BlueToWin < scoreToWin { 
		BlueToWin++;
		if step % 18 == 0 {
			effect_create_below(ef_rain, p1.x, p1.y, 1, c_blue);
		}
	}
	if RedToWin > 0 {
		RedToWin--;
	}
	show_debug_message("BLUE!!" + string(BlueToWin))
}

/*
if keyboard_check_pressed(ord("G")) || gamepad_button_check_pressed(0,gp_shoulderr) {
p1Rec = [];
recordingStartStep = step;
recording = true;
p1Rec_xstart = p1.x;
p1Rec_ystart = p1.y;
}

if keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(1,gp_shoulderr) {
p2Rec = [];
recordingStartStep2 = step;
recording2 = true;
p2Rec_xstart = p2.x;
p2Rec_ystart = p2.y;
}
/**/

if recording == true {
	data_point = [p1.keyUp, p1.keyDown, p1.keyLeft, p1.keyRight, p1.keyJump]
	p1Rec[step - recordingStartStep] = data_point;
}
if recording2 == true {
	data_point = [p2.keyUp, p2.keyDown, p2.keyLeft, p2.keyRight, p2.keyJump]
	p2Rec[step - recordingStartStep2] = data_point;
}

if stepsTillY2K != 0 {
	stepsTillY2K--;
} else if stepsTillY2K == 0 {
	if keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0,gp_shoulderl)
	&& p1PaintPercent > 0 {
		p1PaintPercent -= 10
		if recording == true {
			if oSoul.playAudio {
				audio_sound_pitch(sfxTimeSummon, random_range(0.8,1.2))
				audio_play_sound(sfxTimeSummon, 1, false);
			}
			//recording = false
			recordingStopStep = step;
		}
		ghost = instance_create_layer(p1Rec_xstart, p1Rec_ystart, "players", oGhost);
		with ghost {
			color = choose(c_blue);
			//playbackStep = oGame.recordingStartStep;
			recording = oGame.p1Rec;
			finalStep = oGame.recordingStopStep - oGame.recordingStartStep;
		}
	}

	if keyboard_check_pressed(vk_rshift)  || gamepad_button_check_pressed(1,gp_shoulderl)
	&& p2PaintPercent > 0 {
		p2PaintPercent -= 10
		if recording2 == true {
			if oSoul.playAudio {
				audio_sound_pitch(sfxTimeSummon, random_range(0.8,1.2))
				audio_play_sound(sfxTimeSummon, 1, false);
			}
			//recording2 = false
			recordingStopStep2 = step;
		}
		ghost = instance_create_layer(p2Rec_xstart, p2Rec_ystart, "players", oGhost);
		with ghost {
			color = choose(c_red);
			//playbackStep = oGame.recordingStartStep;
			recording = oGame.p2Rec;
			finalStep = oGame.recordingStopStep2 - oGame.recordingStartStep2;
		}
	}
}

step++;