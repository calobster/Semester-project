// move slider up/down
slider += slider_dir * slider_speed;

if (slider <= 0) { slider = 0; slider_dir = 1; }
if (slider >= bar_h) { slider = bar_h; slider_dir = -1; }

// countdown
timer--;
if (timer <= 0)
{
    qte_fail();
}

// press K to attempt
if (keyboard_check_pressed(ord("K")))
{
    if (slider >= zone_start && slider <= zone_end)
        qte_success();
    else
        qte_fail();
}

function qte_success()
{
    global.qte_active = false;

    // Destroy the hook after QTE
    if (instance_exists(global.qte_hook))
    {
        instance_destroy(global.qte_hook);
    }

    // Clear references
    global.qte_player = noone;
    global.qte_hook = noone;

    instance_destroy();
}

function qte_fail()
{
    // Damage player
    if (instance_exists(global.qte_player))
    {
        global.qte_player.hp -= 2;
        global.qte_player.damage_flash = 10;
        global.qte_player.image_blend = c_red;
    }

    global.qte_active = false;

    // Destroy the hook after QTE
    if (instance_exists(global.qte_hook))
    {
        instance_destroy(global.qte_hook);
    }

    // Clear references
    global.qte_player = noone;
    global.qte_hook = noone;

    instance_destroy();
}