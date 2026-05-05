function run_finish(){
if (!global.run_active) exit;

global.run_active = false;
global.run_end_time = get_timer();

var elapsed_us = global.run_end_time - global.run_start_time;
var elapsed_sec = elapsed_us / 1000000.0;

ini_open("stats.ini");

var count = ini_read_real("stats", "run_count", 0);
count += 1;
ini_write_real("stats", "run_count", count);

var key = "run_" + string(count);

ini_write_real(key, "time_sec", elapsed_sec);
ini_write_real(key, "kills", global.run_kills);
ini_write_string(key, "date", date_datetime_string(date_current_datetime()));

ini_close();
}