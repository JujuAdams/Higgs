// Feather disable all

/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param headSize
/// @param thickness

function DrawArrowThick(_x1, _y1, _x2, _y2, _headSize, _thickness)
{
    var _x = -_thickness;
    repeat(2*_thickness + 1)
    {
        var _y = -_thickness;
        repeat(2*_thickness + 1)
        {
            draw_arrow(_x1 + _x, _y1 + _y, _x2 + _x, _y2 + _y, _headSize);
            ++_y;
        }
        
        ++_x;
    }
}