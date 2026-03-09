/// CREATE EVENT
/// This runs once when the options room starts.

menu_index = 0;          // Which menu item is currently selected (0 = first item)
menu_items = 4;          // Total number of menu entries

// Default settings values
music_volume = 0.5;      // Music volume (range 0.0 - 1.0)
sfx_volume   = 0.5;      // Sound effects volume
fullscreen   = window_get_fullscreen(); 
// Automatically read current fullscreen state from the game

// Apply fullscreen immediately (ensures it matches stored value)
window_set_fullscreen(fullscreen);