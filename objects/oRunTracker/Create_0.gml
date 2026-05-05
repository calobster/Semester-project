persistent = true;

// Prevent duplicates
if (instance_number(oRunTracker) > 1) { instance_destroy(); exit; }

// Run state
global.run_active = false;
global.run_start_time = 0;     // get_timer() value
global.run_end_time = 0;
global.run_kills = 0;

// Saved stats
global.run_count = 0;

// Load stats from disk
ini_open("stats.ini");
global.run_count = ini_read_real("stats", "run_count", 0);
ini_close();