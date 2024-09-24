// Feather disable all

function PointLineDistance(_px, _py, _x1, _y1, _x2, _y2)
{
    var _dX = _x2 - _x1;
    var _dY = _y2 - _y1;
    
    var _lengthSquared = _dX*_dX + _dY*_dY;
    if (_lengthSquared <= 0) return point_distance(_px, _py, _x1, _y1);
    
    var _t = clamp(dot_product(_px - _x1, _py - _y1, _dX, _dY) / _lengthSquared, 0, 1);
    return point_distance(_px, _py, _x1 + _t*_dX, _y1 + _t*_dY);
}