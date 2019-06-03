/// @desc ?
if room != rmStart && step > 120 {
	if p1Ready && p2Ready {
		randomize()
		room_goto(rmFall)//choose(rmPlatformMaze, rmBig))//choose(rmTheMan, rmCheckers))
	}
} else if room == rmStart{
	if p1Ready && p2Ready {
		randomize()
		room_goto(rmFall)//choose(rmPlatformMaze, rmBig))//choose(rmTheMan, rmCheckers))
	}
}
step++;