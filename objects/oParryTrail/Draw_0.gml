draw_set_alpha(alpha);
draw_set_color(c_white);

// How far from body center the swipe sits
var side_offset = -10 * direction_flip;

// Vertical movement (bottom → top)
var bottom_y = 18;
var top_y = -18;

// Interpolate vertical position
var y_offset = lerp(bottom_y, top_y, progress);

// Add slight curve outward as it moves up
var curve = -sin(progress * pi) * 8 * direction_flip;

// Final position
var px = x + side_offset + curve;
var py = y + y_offset;

// Oval shape (vertical oriented)
var width = 3;
var height = 14;

draw_ellipse(
    px - width,
    py - height,
    px + width,
    py + height,
    false
);

draw_set_alpha(1);