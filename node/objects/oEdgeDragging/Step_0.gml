// Feather disable all

if (mouse_check_button_released(mb_left))
{
    var _hover = noone;
    
    with(oHandleParent)
    {
        if (object_index == oHandleConstant) continue;
        
        if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            _hover = id;
        }
    }
    
    if (instance_exists(_hover))
    {
        if (not instance_exists(inHandle))
        {
            if ((_hover.object_index == oHandleIn) && (outHandle.datatype == _hover.datatype))
            {
                var _edge = EdgeCreate(_hover, outHandle);
                
                if (NodeCheckDocumentHasCycle())
                {
                    instance_destroy(_edge);
                }
            }
        }
        else if (not instance_exists(outHandle))
        {
            if ((_hover.object_index == oHandleOut) && (inHandle.datatype == _hover.datatype))
            {
                EdgeCreate(inHandle, _hover);
                
                if (NodeCheckDocumentHasCycle())
                {
                    instance_destroy(_edge);
                }
            }
        }
    }
}

if (not mouse_check_button(mb_left))
{
    instance_destroy();
}