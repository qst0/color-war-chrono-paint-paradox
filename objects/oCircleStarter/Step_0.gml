/// @desc ?
if  pID == 1 && (gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(vk_space)){
	color = c_blue;
	oStart.p1Ready = true;
	if oSoul.playAudio {
		audio_play_sound(sfxFutureSelect, 1, false);
	}
}

if pID == 2 && (gamepad_button_check_pressed(1, gp_face1) || keyboard_check_pressed(vk_rcontrol)) {
	color = c_red;
	oStart.p2Ready = true;
	if oSoul.playAudio {
		audio_play_sound(sfxFutureSelect, 1, false);
	}
}