/// STEP EVENT
/// This runs every frame and handles input + logic.


// Move selection UP
if (keyboard_check_pressed(ord("W")))
{
    menu_index--;
}

// Move selection DOWN
if (keyboard_check_pressed(ord("S")))
{
    menu_index++;
}

// Prevent menu index from going outside range
menu_index = clamp(menu_index, 0, menu_items - 1);



// If LEFT key pressed, decrease value
if (keyboard_check_pressed(ord("A")))
{
    switch(menu_index)
    {
        case 0: // Music volume
            music_volume -= 0.1;
            music_volume = clamp(music_volume, 0, 1);
        break;

        case 1: // SFX volume
            sfx_volume -= 0.1;
            sfx_volume = clamp(sfx_volume, 0, 1);
        break;

        case 2: // Fullscreen toggle
            fullscreen = false;
        break;
    }
}

// If RIGHT key pressed, increase value
if (keyboard_check_pressed(ord("D")))
{
    switch(menu_index)
    {
        case 0: // Music volume
            music_volume += 0.1;
            music_volume = clamp(music_volume, 0, 1);
        break;

        case 1: // SFX volume
            sfx_volume += 0.1;
            sfx_volume = clamp(sfx_volume, 0, 1);
        break;

        case 2: // Fullscreen toggle
            fullscreen = true;
        break;
    }
}


// Apply fullscreen immediately when changed
window_set_fullscreen(fullscreen);



// If ENTER is pressed while "Back" is selected
if (keyboard_check_pressed(vk_enter) && menu_index == 3)
{
    room_goto(rMenu);  // Return to main menu
}