// Feather disable all

if (not instance_exists(inHandle))
{
    draw_set_color(c_black);
    DrawArrowThick(outHandle.x, outHandle.y, mouse_x, mouse_y, 20, 2);
    draw_set_color(c_white);
    DrawArrowThick(outHandle.x, outHandle.y, mouse_x, mouse_y, 20, 1);
}
else if (not instance_exists(outHandle))
{
    draw_set_color(c_black);
    DrawArrowThick(mouse_x, mouse_y, inHandle.x, inHandle.y, 20, 2);
    draw_set_color(c_white);
    DrawArrowThick(outHandle.x, outHandle.y, mouse_x, mouse_y, 20, 1);
}