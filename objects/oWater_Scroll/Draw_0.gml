if (sprite_index == -1) exit;

var w = room_width;
var water_top = 200;

var sw = sprite_get_width(spr_water_scroll);
if (sw <= 0) exit;

for (var i = -1; i < ceil(w / sw) + 1; i++)
{
    draw_sprite(spr_water_scroll, 0,
        scroll_x + i * sw,
        water_top);
}