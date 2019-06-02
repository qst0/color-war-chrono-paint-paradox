/// @desc ?

draw_set_font(StarbounD);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


if room == rmStart {
	draw_set_color(c_black);
	draw_rectangle(10,10,80,10+12,false)
	draw_rectangle(180,10,180+80,10+12,false)
	draw_set_color(c_white);
	draw_text(10, 10, "Qst0 Presents:")
	draw_text(182, 10, "F1: Help & Thanks")
	
	draw_set_color(c_black);
	draw_rectangle(58 ,110, 60+120,110+22,false)
	draw_set_color(c_white);
	draw_text(60, 110, "P1: WASD Space and F\nP2: Arrows rCtrl and rShift")
	
	titleString = "Color War Chrono:\n Paint Paradox\n\nBoth Players\n press jump\n to start";
} else if room == rmRed {
	draw_set_color(c_red);
	titleString = "Red claims this\n timeline...\n\nPlay again?\n\nBoth players\nPress jump\nfor rematch";
} else if room == rmBlue {
	draw_set_color(c_blue);
	titleString = "Blue claims this\n timeline...\n\nPlay again?\n\nBoth players\nPress jump\nfor rematch";
}
draw_text(x - string_width(titleString) / 2
,y,titleString);