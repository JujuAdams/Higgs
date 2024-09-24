// Feather disable all

hover = noone;

with(oContextMenuParent)
{
    if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom))
    {
        other.hover = id;
    }
}

if (instance_exists(hover))
{
    if (hover.object_index == oContextMenuButton)
    {
        if (mouse_check_button_pressed(mb_left))
        {
            with(hover)
            {
                var _method = method(self, func);
                _method();
            }
            
            instance_destroy();
        }
    }
    else if (hover.object_index == oContextMenuBranch)
    {
        with(hover)
        {
            if (not open)
            {
                open = true;
                ContextMenuCreateButtons(bbox_right + 10, y, childArray, subject, menuJSON, fa_left);
            }
        }
    }
}
else if (mouse_check_button_pressed(mb_any))
{
    instance_destroy();
}

if (mouse_wheel_up() || mouse_wheel_down())
{
    instance_destroy();
}