// Feather disable all

function CameraRefocus()
{
    if (instance_number(oNode) <= 0) return;
    if (not instance_exists(oDocument)) return;
    
    with(oDocument)
    {
        var _minX =  infinity;
        var _maxX = -infinity;
        var _minY =  infinity;
        var _maxY = -infinity;
        
        with(oNode)
        {
            _minX = min(_minX, bbox_left   - 100);
            _maxX = max(_maxX, bbox_right  + 100);
            _minY = min(_minY, bbox_top    - 100);
            _maxY = max(_maxY, bbox_bottom + 100);
        }
        
        var _camera = view_camera[0];
        
        var _newWidth  = _maxX - _minX;
        var _newHeight = _maxY - _minY;
        var _newX      = 0.5*(_minX + _maxX);
        var _newY      = 0.5*(_minY + _maxY);
        
        var _scale = max(_newWidth / baseWidth, _newHeight / baseHeight);
        
        var _power = ln(_scale) / ln(2);
        _power = ceil(_power / 0.25) * 0.25;
        _scale = power(2, _power);
        
        var _width  = _scale*baseWidth;
        var _height = _scale*baseHeight;
        
        camera_set_view_pos(_camera, _newX - _width/2, _newY - _height/2);
        camera_set_view_size(_camera, _width, _height);
        
        viewScale       = _scale;
        viewPower       = _power;
        viewPowerTarget = _power;
    }
}