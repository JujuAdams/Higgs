// Feather disable all

if (instance_exists(oModalParent)) return;

if (mouse_wheel_up()) viewPowerTarget -= 0.25;
if (mouse_wheel_down()) viewPowerTarget += 0.25;

var _oldViewPower = viewPower;
viewPower = lerp(viewPower, viewPowerTarget, 0.4);
viewScale = power(2, viewPower);

if (_oldViewPower != viewPower)
{
    var _newWidth  = viewScale*baseWidth;
    var _newHeight = viewScale*baseHeight;
    
    var _dX = (camera_get_view_x(view_camera[0]) - mouse_x) * (_newWidth  / camera_get_view_width( view_camera[0]));
    var _dY = (camera_get_view_y(view_camera[0]) - mouse_y) * (_newHeight / camera_get_view_height(view_camera[0]));
    
    camera_set_view_pos(view_camera[0], mouse_x + _dX, mouse_y + _dY);
    camera_set_view_size(view_camera[0], _newWidth, _newHeight);
}

if (mouse_check_button(mb_middle))
{
    if (mouse_check_button_pressed(mb_middle))
    {
        dragging = true;
        dragOnMiddleClick = true;
        dragX = mouse_x;
        dragY = mouse_y;
    }
}
else if (dragging)
{
    if (dragOnMiddleClick)
    {
        if (not mouse_check_button(mb_middle)) dragging = false;
    }
    else
    {
        if (not mouse_check_button(mb_left)) dragging = false;
    }
}
else if (keyboard_check(vk_control) && keyboard_check_pressed(ord("S")))
{
    EffectSave();
}
else
{
    var _hover = InstanceGetHover(mouse_x, mouse_y);
    if (instance_exists(_hover))
    {
        if (mouse_check_button_pressed(mb_left))
        {
            if (_hover.object_index == oNode)
            {
                with(_hover)
                {
                    dragging = true;
                    dragDX = x - mouse_x;
                    dragDY = y - mouse_y;
                }
            }
            else if (object_is_ancestor(_hover.object_index, oHandleParent))
            {
                if (_hover.object_index == oHandleConstant)
                {
                    ModalCreateEnterValue(_hover);
                }
                else
                {
                    var _instance = instance_create_layer(_hover.x, _hover.y, "Edges", oEdgeDragging);
                    if (_hover.object_index == oHandleIn)
                    {
                        _instance.inHandle = _hover;
                    }
                    else if (_hover.object_index == oHandleOut)
                    {
                        _instance.outHandle = _hover;
                    }
                }
            }
        }
        else if (mouse_check_button_pressed(mb_right))
        {
            if (_hover.object_index == oNode)
            {
                ContextMenuOpen(_hover);
            }
            else if (_hover.object_index == oEdge)
            {
                //Delete edges straight away
                instance_destroy(_hover);
            }
        }
    }
    else
    {
        if (mouse_check_button_pressed(mb_left))
        {
            dragging = true;
            dragOnMiddleClick = false;
            dragX = mouse_x;
            dragY = mouse_y;
        }
        else if (mouse_check_button_pressed(mb_right))
        {
            ContextMenuOpen(id);
        }
    }
}

if (dragging)
{
    camera_set_view_pos(view_camera[0],
                        camera_get_view_x(view_camera[0]) - (mouse_x - dragX),
                        camera_get_view_y(view_camera[0]) - (mouse_y - dragY));
    dragX = mouse_x;
    dragY = mouse_y;
}