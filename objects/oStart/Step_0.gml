/// @desc ?
if room != rmStart && step > 120 {
	if p1Ready && p2Ready {
		randomize()
		room_goto(choose(rmTheMan, rmCheckers))
	}
} else if room == rmStart{
	if p1Ready && p2Ready {
		randomize()
		room_goto(choose(rmTheMan, rmCheckers))
	}
}
step++;