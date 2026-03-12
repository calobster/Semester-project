if (instance_exists(oPause) && oPause.paused) {
    exit;
}

ysp=0
xsp=0

var _h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

xsp = _h * 3;
ysp = _v * 3;

x += xsp;
y += ysp;

// Sprite change
if (_h < 0) {
    sprite_index = sPlayer_Backward;
}
else if (_h > 0) {
    sprite_index = sPlayer_Forward;
}

// Progress
if place_meeting(x,y,oCoin)
{
    room_goto_next();
}
//Animation
