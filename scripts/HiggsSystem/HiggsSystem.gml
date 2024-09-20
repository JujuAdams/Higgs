// Feather disable all

function HiggsSystem() constructor
{
    __effectArray = [];
    
    static Clear = function()
    {
        var _effectArray = __effectArray;
        var _i = 0;
        repeat(array_length(_effectArray))
        {
            _effectArray[_i].Destroy();
            ++_i;
        }
        
        array_resize(__effectArray, 0);
    }
    
    static Attach = function(_x, _y, _effect)
    {
        _effect.__x = _x;
        _effect.__y = _y;
        array_push(__effectArray, _effect);
    }
    
    static Draw = function(_x = 0, _y = 0)
    {
        var _effectArray = __effectArray;
        var _i = 0;
        repeat(array_length(_effectArray))
        {
            with(_effectArray[_i])
            {
                if (not Draw(_x + __x, _y + __y))
                {
                    array_delete(_effectArray, _i, 1);
                }
                else
                {
                    ++_i;
                }
            }
        }
    }
}