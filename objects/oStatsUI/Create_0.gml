runs_loaded = 0;
times = [];
kills = [];
dates = [];

ini_open("stats.ini");
runs_loaded = ini_read_real("stats", "run_count", 0);

for (var i = 1; i <= runs_loaded; i++)
{
    var key = "run_" + string(i);
    times[i-1] = ini_read_real(key, "time_sec", 0);
    kills[i-1] = ini_read_real(key, "kills", 0);
    dates[i-1] = ini_read_string(key, "date", "");
}
ini_close();