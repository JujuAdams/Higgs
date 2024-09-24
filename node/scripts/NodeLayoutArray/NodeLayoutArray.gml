// Feather disable all

/// @param array
/// @param xOffset

function NodeLayoutArray(_array, _xOffset)
{
    static _spacing = 20;
    
    var _totalHeight = 0;
    var _i = 0;
    repeat(array_length(_array))
    {
        _totalHeight += _array[_i].sprite_height;
        ++_i;
    }
    
    _totalHeight += _spacing*max(array_length(_array)-1, 0);
    
    var _y = -_totalHeight/2;
    var _i = 0;
    repeat(array_length(_array))
    {
        with(_array[_i])
        {
            x = _xOffset;
            y = _y + sprite_height/2;
            _y = bbox_bottom + _spacing;
        }
        
        ++_i;
    }
}