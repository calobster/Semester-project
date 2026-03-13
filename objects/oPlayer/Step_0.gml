if (instance_exists(oPause) && oPause.paused) {
    exit;
}

ysp = 0;
xsp = 0;

var _h = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _v = keyboard_check(ord("S")) - keyboard_check(ord("W"));

xsp = _h * 3;
ysp = _v * 3;

// gravity when outside water
var in_water = place_meeting(x, y, oWater);

if (!in_water)
{
    fall_speed += gravity_strength;
    fall_speed = clamp(fall_speed, 0, max_fall);
    ysp += fall_speed;
}
else
{
    fall_speed = 0;
}

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

// Animation of damage (doesn't really work)
if (damage_flash > 0)
{
    damage_flash--;
}