t += 1;

// Move selection
if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
{
    menu_index--;
    if (menu_index < 0) menu_index = menu_count - 1;
}

if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))
{
    menu_index++;
    if (menu_index >= menu_count) menu_index = 0;
}

// Confirm
if (keyboard_check_pressed(vk_enter))
{
    if (menu_index == 0)
    {
        room_goto(rMenu); // change if your menu room is named differently
    }
    else
    {
        game_end();
    }
}