// Feather disable all

/// @param x
/// @param y

function InstanceGetHover(_x, _y)
{
    var _hover = noone;
    
    with(oNode)
    {
        if (point_in_rectangle(_x, _y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            _hover = id;
        }
    }
    
    with(oEdge)
    {
        if (not instance_exists(inHandle)) continue;
        if (not instance_exists(outHandle)) continue;
        
        if (PointLineDistance(_x, _y, inHandle.x, inHandle.y, outHandle.x, outHandle.y) < 10)
        {
            _hover = id;
        }
    }
    
    with(oHandleParent)
    {
        if (point_in_rectangle(_x, _y, bbox_left, bbox_top, bbox_right, bbox_bottom))
        {
            _hover = id;
        }
    }
    
    return _hover;
}