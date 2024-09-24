// Feather disable all

/// @param x
/// @param y
/// @param childArray
/// @param subject
/// @param menuJSON

function ContextMenuCreateButtons(_x, _y, _childArray, _subject, _menuJSON)
{
    var _i = 0;
    repeat(array_length(_menuJSON))
    {
        var _menuData = _menuJSON[_i];
        
        if (struct_exists(_menuData, "button"))
        {
            var _instance = instance_create_layer(0, 0, "ContextMenu", oContextMenuButton, {
                parent: id,
                label: _menuData.button,
                subject: _subject,
                func: _menuData.func,
            });
            
            array_push(_childArray, _instance);
        }
        else if (struct_exists(_menuData, "branch"))
        {
            var _instance = instance_create_layer(0, 0, "ContextMenu", oContextMenuBranch, {
                parent: id,
                label: _menuData.branch,
                subject: _subject,
                menuJSON: _menuData.children,
            });
            
            array_push(_childArray, _instance);
        }
        
        ++_i;
    }
    
    var _i = 0;
    repeat(array_length(_childArray))
    {
        with(_childArray[_i])
        {
            x = _x;
            y = _y;
            
            _y += sprite_height + 2;
        }
        
        ++_i;
    }
}