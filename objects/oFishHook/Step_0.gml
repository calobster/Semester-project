// Freeze hook during QTE
if (global.qte_active) exit;

// Move down/up
if (state == "down")
{
    y += speed;
    if (y >= end_y) state = "up";
}
else
{
    y -= speed;
    if (y <= start_y)
    {
        y = start_y;
        state = "down";
        triggered = false;
    }
}

// Start QTE when a player touches the hook
if (!triggered)
{
    var p = instance_place(x, y, oPlayer1);
    if (p == noone) p = instance_place(x, y, oPlayer2);

    if (p != noone)
    {
        triggered = true;

        global.qte_active = true;
        global.qte_player = p;
        global.qte_hook = id;

        // spawn QTE controller (use your instance layer name if different)
        instance_create_layer(0, 0, "Instances", oQTE);
    }
}