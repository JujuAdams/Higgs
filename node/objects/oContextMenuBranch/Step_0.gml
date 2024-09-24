// Feather disable all

if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom))
{
    if (not open)
    {
        open = true;
        ContextMenuCreateButtons(x, y, childArray, subject, menuJSON);
    }
}
else
{
    if (open)
    {
        var _i = 0;
        repeat(array_length(childArray))
        {
            instance_destroy(childArray[_i]);
            ++_i;
        }
        
        open = false;
        array_resize(childArray, 0);
    }
}

if (not instance_exists(parent)) instance_destroy();