// cooldown so it can't spam shock
if (shock_cooldown > 0) shock_cooldown--;

// find an active player
var p = instance_find(oPlayer1, 0);
if (p == noone) p = instance_find(oPlayer2, 0);

if (p != noone)
{
    // broader collision check (less finicky than instance_place)
    var touching = collision_rectangle(
        bbox_left, bbox_top,
        bbox_right, bbox_bottom,
        p.object_index,
        false, true
    );

    // trigger only if touching, eel ready, and player not already shocked
    if (touching != noone && shock_cooldown <= 0 && p.shock_timer <= 0)
    {
        // 1) Knock player away FIRST so they don't stay inside the eel
        var push_dir = point_direction(x, y, p.x, p.y);
        p.knockback_x = lengthdir_x(10, push_dir);
        p.knockback_y = lengthdir_y(10, push_dir);
        p.knockback_timer = 10;

        // 2) Apply shock (2 seconds)
        p.shock_timer = room_speed * 2;

        // 3) Eel pauses + becomes un-hittable for 1 second
        stun_timer   = room_speed * 1;
        invuln_timer = room_speed * 1;

        // 4) Cooldown so shock can't immediately re-trigger
        shock_cooldown = room_speed * 3;
    }
}

// run normal parent behavior after our shock logic
event_inherited();