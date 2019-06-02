/// @desc ?

if room == rmStart && keyboard_check_pressed(vk_f1) {
	room_goto(rmHelp)
} else if keyboard_check_pressed(vk_f1){
	room_goto(rmStart)
}


if keyboard_check_pressed(vk_f5) {
	game_restart();
}

if keyboard_check_pressed(vk_escape) {
	game_end();
}

if keyboard_check_pressed(vk_backspace) {
	playAudio = !playAudio
	if playAudio {
		audio_play_sound(bgmPiggaBoo, 1, true);
	} else {
		audio_stop_all()
	}
}