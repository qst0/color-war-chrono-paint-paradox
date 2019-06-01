/// @desc ?

p1 = instance_nearest(x+4,y+4,oPlayer);
p2 = instance_nearest(x+4,y+4,oPlayer2);

p1dist = point_distance(x+4,y+4,p1.x,p1.y);
p2dist = point_distance(x+4,y+4,p2.x,p2.y);

neardist = min(p1dist, p2dist)
if neardist > 16 || p1dist == p2dist {
	//Matching distance
} else if neardist == p1dist {
	image_blend = oPlayer.color;
} else if neardist == p2dist {
	image_blend = oPlayer2.color;
}

