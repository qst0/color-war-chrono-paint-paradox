/// @desc ?
scoreBlue = 0;
scoreRed = 0;
with oPlatform {
	if image_blend == c_red {
		oGame.scoreRed++;
	} else if image_blend == c_blue {
		oGame.scoreBlue++;
	}
}

with oBGWall {
	if image_blend == c_red {
		oGame.scoreRed++;
	} else if image_blend == c_blue {
		oGame.scoreBlue++;
	}
}

with oBGWallDark {
	if image_blend == c_red {
		oGame.scoreRed++;
	} else if image_blend == c_blue {
		oGame.scoreBlue++;
	}
}