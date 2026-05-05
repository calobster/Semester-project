// Freeze hook during QTE
if (global.qte_active) exit;

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

        instance_create_layer(0, 0, "Instances", oQTE);
    }
}