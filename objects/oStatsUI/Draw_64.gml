draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var x_pos = 40;
var y_pos = 40;

draw_text(x_pos, y_pos, "STATS");
y_pos += 40;

draw_text(x_pos, y_pos, "Runs: " + string(runs_loaded));
y_pos += 30;

draw_text(x_pos, y_pos, "Most recent runs:");
y_pos += 30;

var show = min(10, runs_loaded);

for (var i = 0; i < show; i++)
{
    var idx = runs_loaded - 1 - i;

    var time_str = string(round(times[idx] * 100) / 100);
    var line = "#" + string(idx + 1)
        + "  Time: " + time_str + "s"
        + "  Kills: " + string(kills[idx]);

    if (dates[idx] != "") line += "  [" + dates[idx] + "]";

    draw_text(x_pos, y_pos, line);
    y_pos += 24;
}

y_pos += 30;
draw_text(x_pos, y_pos, "Press Enter/Esc to return");