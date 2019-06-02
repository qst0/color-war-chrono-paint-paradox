/// @desc ?

draw_set_font(StarbounD);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

step = 0;
debug = false;

totalPaintable = -42; //Set in Room Start
BlueToWin = 0
RedToWin = 0

recordingStartStep = step;
recordingStartStep2 = step;

stepsTillY2K = 120; //don't make longer than win time, since the menu things

p1 = -42 // Set on instance.
p1PaintPercent = 100;

p2 = -42 // Set on instance.
p2PaintPercent = 100;

// data point keyUp keyDown keyLeft keyRight keyJump
p1Rec = []
p2Rec = []
recording = true;
recording2 = true;

timeLeft = 108; //1:48

playerIconFrame = 0;
playerIconFrames = sprite_get_number(sprPlayerIcon);

scoreBlue = 0;
scoreRed = 0;