// Pick track by room
var want = noone;

if (room == rMenu)      want = snd_music_Menu;
else if (room == rGame1) want = snd_music_Game1;
else if (room == rGame2) want = snd_music_Game2;
else if (room == rGame3) want = snd_music_Game3;
else if (room == rVictory) want = snd_music_Victory;

// If music disabled, stop it
if (!global.music_enabled)
{
    if (current_handle != -1) audio_stop_sound(current_handle);
    current_handle = -1;
    current_track = noone;
    exit;
}

// Switch track when room changes
if (want != noone && want != current_track)
{
    if (current_handle != -1) audio_stop_sound(current_handle);
    current_handle = audio_play_sound(want, 0, true);
    current_track = want;
}

// Apply volume continuously
if (current_handle != -1)
{
    audio_sound_gain(current_handle, global.music_volume, 0);
}