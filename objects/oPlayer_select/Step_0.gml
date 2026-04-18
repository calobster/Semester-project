// Move up
if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
{
    selection--;
    if (selection < 0) selection = max_selection;
}

// Move down
if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))
{
    selection++;
    if (selection > max_selection) selection = 0;
}

// Confirm selection
if (keyboard_check_pressed(vk_enter))
{
    global.selected_player_object = characters[selection].object;
    room_goto(rGame1);
}