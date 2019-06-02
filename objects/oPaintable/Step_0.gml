/// @desc ?

p1 = oGame.p1
p2 = oGame.p2

nearestGhost = instance_nearest(x+4,y+4,oGhost);

p1dist = point_distance(x+4,y+4,p1.x,p1.y-4);
p2dist = point_distance(x+4,y+4,p2.x,p2.y-4);

if nearestGhost != noone {
	nGhostDist = point_distance(x+4,y+4,nearestGhost.x,nearestGhost.y-4);
} else {
	nGhostDist = 10000; //TODO real type of int max thing goes here
}
neardist = min(p1dist, p2dist, nGhostDist)
if neardist > 13 {
	//Matching distance
} else if neardist == nGhostDist {
	image_blend = nearestGhost.color;
} else if neardist == p1dist {
	image_blend = p1.color;
} else if neardist == p2dist {
	image_blend = p2.color;
}
