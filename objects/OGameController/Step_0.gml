// Find whichever player exists
var p = instance_find(oPlayer1, 0);
if (p == noone) p = instance_find(oPlayer2, 0);

if (p != noone)
{
    var cam = view_camera[0];

    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    camera_set_view_pos(cam,
        p.x - cam_w/2,
        p.y - cam_h/2);
}