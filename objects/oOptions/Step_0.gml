/// STEP EVENT

// Ensure globals exist
if (!variable_global_exists("music_enabled")) global.music_enabled = true;
if (!variable_global_exists("music_volume"))  global.music_volume  = 0.6;
if (!variable_global_exists("sfx_volume"))    global.sfx_volume    = 0.8;
if (!variable_global_exists("fullscreen")) global.fullscreen = window_get_fullscreen();

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

// Keep menu index in range
menu_index = clamp(menu_index, 0, menu_items - 1);

// Decrease values
if (keyboard_check_pressed(ord("A")))
{
    switch (menu_index)
    {
        case 0: // Music volume
            global.music_volume = clamp(global.music_volume - 0.1, 0, 1);
        break;

        case 1: // SFX volume
            global.sfx_volume = clamp(global.sfx_volume - 0.1, 0, 1);
        break;

        case 2: // Fullscreen
            global.fullscreen = false;
        break;
    }
}

// Increase values
if (keyboard_check_pressed(ord("D")))
{
    switch (menu_index)
    {
        case 0: // Music volume
            global.music_volume = clamp(global.music_volume + 0.1, 0, 1);
        break;

        case 1: // SFX volume
            global.sfx_volume = clamp(global.sfx_volume + 0.1, 0, 1);
        break;

        case 2: // Fullscreen
            global.fullscreen = true;
        break;
    }
}

// Apply fullscreen immediately
if (window_get_fullscreen() != global.fullscreen)
{
    window_set_fullscreen(global.fullscreen);
}

// (Optional) Toggle music on/off with Enter while on Music volume row
if (keyboard_check_pressed(vk_enter) && menu_index == 0)
{
    global.music_enabled = !global.music_enabled;
}

// Back
if (keyboard_check_pressed(vk_enter) && menu_index == 3)
{
    room_goto(rMenu);
}