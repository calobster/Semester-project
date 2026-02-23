
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
// floor collision

if place_meeting(x,y,oFloor2)
{
	ysp=0
	if keyboard_check(vk_up)
	{
		ysp=-2
	}
}

if place_meeting(x,y+1,oFloor)
{
	ysp=0
	if keyboard_check(vk_up)
	{
		ysp=-2
	}
}

move_and_collide(xsp,ysp,oFloor)

//DeATH AND PROGRESS
if place_meeting(x,y,oCoin)
{
	room_goto_next()
}

if place_meeting(x,y,oKnife)
{
	room_restart()
}