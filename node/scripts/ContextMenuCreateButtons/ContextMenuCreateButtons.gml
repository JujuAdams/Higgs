// Feather disable all

/// @param x
/// @param y
/// @param childArray
/// @param subject
/// @param menuJSON
/// @param hAlign

function ContextMenuCreateButtons(_x, _y, _childArray, _subject, _menuJSON, _hAlign)
{
    var _maxWidth = 0;
    
    var _i = 0;
    repeat(array_length(_menuJSON))
    {
        var _menuData = _menuJSON[_i];
        
        if (struct_exists(_menuData, "button"))
        {
            var _instance = instance_create_layer(0, 0, "ContextMenu", oContextMenuButton, {
                topLevel: topLevel,
                parent: id,
                label: _menuData.button,
                subject: _subject,
                func: _menuData.func,
            });
            
            _maxWidth = max(_maxWidth, _instance.sprite_width);
            
            array_push(_childArray, _instance);
        }
        else if (struct_exists(_menuData, "branch"))
        {
            var _instance = instance_create_layer(0, 0, "ContextMenu", oContextMenuBranch, {
                topLevel: topLevel,
                parent: id,
                label: _menuData.branch,
                subject: _subject,
                menuJSON: _menuData.children,
            });
            
            _maxWidth = max(_maxWidth, _instance.sprite_width);
            
            array_push(_childArray, _instance);
        }
        
        ++_i;
    }
    
    if (_hAlign == fa_left)
    {
        _x += _maxWidth/2;
    }
    else if (_hAlign == fa_right)
    {
        _x -= _maxWidth/2;
    }
    
    var _i = 0;
    repeat(array_length(_childArray))
    {
        with(_childArray[_i])
        {
            x = _x;
            y = _y;
            
            image_xscale = _maxWidth / sprite_get_width(sprite_index);
            _y += sprite_height + 6;
        }
        
        ++_i;
    }
}