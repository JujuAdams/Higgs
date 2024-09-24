// Feather disable all

if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom))
{
    if (mouse_check_button_pressed(mb_left))
    {
        var _method = method(self, func);
        _method();
    }
}

if (not instance_exists(parent)) instance_destroy();