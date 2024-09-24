// Feather disable all

if (keyboard_check_pressed(ord("1")))
{
    NodeCreate(mouse_x, mouse_y, "add");
}

if (mouse_wheel_up()) viewPowerTarget -= 0.5;
if (mouse_wheel_down()) viewPowerTarget += 0.5;

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

hover = noone;

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
else
{
    with(oNode)
    {
        if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            other.hover = id;
        }
    }
    
    with(oEdge)
    {
        if (not instance_exists(inHandle)) continue;
        if (not instance_exists(outHandle)) continue;
        
        if (PointLineDistance(mouse_x, mouse_y, inHandle.x, inHandle.y, outHandle.x, outHandle.y) < 10)
        {
            other.hover = id;
        }
    }
    
    with(oHandleParent)
    {
        if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            other.hover = id;
        }
    }
    
    if (instance_exists(hover))
    {
        if (mouse_check_button_pressed(mb_left))
        {
            if (hover.object_index == oNode)
            {
                with(hover)
                {
                    dragging = true;
                    dragDX = x - mouse_x;
                    dragDY = y - mouse_y;
                }
            }
            else if (object_is_ancestor(hover.object_index, oHandleParent))
            {
                var _instance = instance_create_layer(hover.x, hover.y, "Edges", oEdgeDragging);
                if (hover.object_index == oHandleIn)
                {
                    _instance.inHandle = hover;
                }
                else
                {
                    _instance.outHandle = hover;
                }
            }
        }
        else if (mouse_check_button_pressed(mb_right))
        {
            if ((hover.object_index == oNode) || (hover.object_index == oEdge))
            {
                instance_destroy(hover);
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