global.player_damage = 1;
instance_create_layer(x, y, layer, global.selected_player_object);
// Create particle system
global.ps = part_system_create();
part_system_depth(global.ps, -100);

// Create bubble particle type
global.pt_bubble = part_type_create();

part_type_shape(global.pt_bubble, pt_shape_circle);
part_type_size(global.pt_bubble, 0.15, 0.4, 0, 0);
part_type_color1(global.pt_bubble, c_white);
part_type_alpha2(global.pt_bubble, 0.8, 0);
part_type_speed(global.pt_bubble, 0.5, 1.2, 0, 0);
part_type_direction(global.pt_bubble, 85, 95, 0, 0);
part_type_life(global.pt_bubble, 15, 25);
part_type_gravity(global.pt_bubble, -0.01, 90);

if (room == rGame1)
{
    message_text = "Eat to get stronger. Escape to the river through the window!";
    message_timer = room_speed * 7;
    message_alpha = 1;
}
else
{
    message_timer = 0;
}