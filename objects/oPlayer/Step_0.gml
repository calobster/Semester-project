
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

//DeATH AND PROGRESS
if place_meeting(x,y,oCoin)
{
	room_goto_next()
}

if place_meeting(x,y,oKnife)
{
	room_restart()
}