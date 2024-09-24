// Feather disable all

if (mouse_check_button_released(mb_left))
{
    var _hover = noone;
    
    with(oHandleParent)
    {
        if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            _hover = id;
        }
    }
    
    if (instance_exists(_hover))
    {
        if (inHandle == noone)
        {
            if (_hover.object_index == oHandleIn)
            {
                if (outHandle.datatype == _hover.datatype)
                {
                    EdgeCreate(_hover, outHandle);
                }
            }
        }
        else if (outHandle == noone)
        {
            if (_hover.object_index == oHandleOut)
            {
                if (inHandle.datatype == _hover.datatype)
                {
                    EdgeCreate(inHandle, _hover);
                }
            }
        }
    }
}

if (not mouse_check_button(mb_left))
{
    instance_destroy();
}