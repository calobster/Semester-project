
ysp=0
xsp=0

if (keyboard_check(ord("S")))
{
    ysp = 3;
}

if (keyboard_check(ord("W")))
{
    ysp = -3;
}

if (keyboard_check(ord("A")))
{
    xsp = -3;
}

if (keyboard_check(ord("D")))
{
    xsp = 3;
}
x += xsp;
y += ysp;

//Sprite change
var move = 0;

if (keyboard_check(ord("A"))) {
    move = -1;
    sprite_index = sPlayer_Backward;
}

if (keyboard_check(ord("D"))) {
    move = 1;
    sprite_index = sPlayer_Forward;
}

x += move * 4; // movement speed

//DeATH AND PROGRESS
if place_meeting(x,y,oCoin)
{
	room_goto_next()
}

if place_meeting(x,y,oKnife)
{
	room_restart()
}