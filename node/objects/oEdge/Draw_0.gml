// Feather disable all

if ((not instance_exists(inHandle)) || (not instance_exists(outHandle)))
{
    return;
}

draw_set_color(c_black);
DrawArrowThick(outHandle.x, outHandle.y, inHandle.x, inHandle.y, 20, 2);
draw_set_color(c_white);
DrawArrowThick(outHandle.x, outHandle.y, inHandle.x, inHandle.y, 20, 1);