persistent = true;

if (!variable_global_exists("music_enabled")) global.music_enabled = true;
if (!variable_global_exists("music_volume"))  global.music_volume  = 0.6;

current_track = noone;
current_handle = -1;