event_inherited();

// Face direction
var player_near = false;

if (instance_exists(oPlayer1))
{
    if (distance_to_object(oPlayer1) < inflate_distance)
    {
        player_near = true;
    }
}

if (instance_exists(oPlayer2))
{
    if (distance_to_object(oPlayer2) < inflate_distance)
    {
        player_near = true;
    }
}
// Inflate
if (player_near)
{
    if (image_index < image_number - 1)
    {
        image_speed = 0.4;
    }
    else
    {
        image_index = image_number - 1;
        image_speed = 0;
    }
}
// Deflate
else
{
    if (image_index > 0)
    {
        image_speed = -0.4;
    }
    else
    {
        image_index = 0;
        image_speed = 0;
    }
}