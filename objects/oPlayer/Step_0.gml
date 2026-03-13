if (instance_exists(oPause) && oPause.paused) {
    exit;
}

ysp = 0;
xsp = 0;

var _h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

xsp = _h * 3;
ysp = _v * 3;

// movement with tile collisions
move_and_collide(xsp, ysp, tilemap);

// Sprite direction
var dir = sign(x - xprevious);

if (dir != 0) {
    image_xscale = dir;
}

// Progress
if place_meeting(x,y,oCoin)
{
    room_goto_next();
}

// Animation of damage
if (damage_flash > 0)
{
    damage_flash--;
}