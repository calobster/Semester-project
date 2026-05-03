// Find whichever player exists
var p = instance_find(oPlayer1, 0);
if (p == noone) p = instance_find(oPlayer2, 0);

if (p != noone)
{
    var cam = view_camera[0];

    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    // Desired camera position
    var target_x = p.x - cam_w/2;
    var target_y = p.y - cam_h/2;

    // Clamp inside room boundaries
    target_x = clamp(target_x, 0, room_width - cam_w);
    target_y = clamp(target_y, 0, room_height - cam_h);

    camera_set_view_pos(cam, target_x, target_y);
}
if (message_timer > 0)
{
    message_timer--;

    // Fade out during last second
    if (message_timer < room_speed)
    {
        message_alpha = message_timer / room_speed;
    }
}