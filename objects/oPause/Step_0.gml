// Toggle pause
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
}

// Only allow menu control if paused
if (paused) {

    if (keyboard_check_pressed(vk_up)) {
        menu_index--;
    }

    if (keyboard_check_pressed(vk_down)) {
        menu_index++;
    }

    menu_index = clamp(menu_index, 0, array_length(menu_items) - 1);

    if (keyboard_check_pressed(vk_enter)) {

        switch(menu_index) {

            case 0: // Resume
                paused = false;
            break;

            case 1: // Restart
                room_restart();
            break;

            case 2: // Main Menu
                room_goto(rMenu);
            break;
        }
    }
}