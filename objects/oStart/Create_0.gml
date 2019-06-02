/// @desc ?
step = 0;
p1Ready = false;
p2Ready = false;

if room != rmStart {
	if oSoul.playAudio {
		audio_sound_pitch(sfxVictoryRings, random_range(0.5,1.5))
		audio_play_sound(sfxVictoryRings, 1, false);
	}
}