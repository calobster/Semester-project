// Check distance every frame
if (instance_exists(oPlayer1) && distance_to_object(oPlayer1) < distance_to_player)
{
    // CHASE
    target_x = oPlayer1.x;
    target_y = oPlayer1.y;
}
else
{
    // WANDER
    if (point_distance(x, y, target_x, target_y) < 4)
    {
        target_x = random_range(xstart - 100, xstart + 100);
        target_y = random_range(ystart - 100, ystart + 100);
    }
}

// Movement (always runs)
var dir = point_direction(x, y, target_x, target_y);
var _hor = lengthdir_x(1, dir);
var _ver = lengthdir_y(1, dir);

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap);