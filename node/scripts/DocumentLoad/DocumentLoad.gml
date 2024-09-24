// Feather disable all

/// @param path

function DocumentLoad(_path)
{
    if (not file_exists(_path))
    {
        ModalCreateMessage($"Could not find \"{_path}\"");
        return;
    }
    
    if (filename_ext(_path) != ".yyp")
    {
        ModalCreateMessage($"\"{_path}\" is not a valid .yyp file");
        return;
    }
    
    try
    {
        var _buffer = buffer_load(_path);
        var _string = buffer_read(_buffer, buffer_text);
        buffer_delete(_buffer);
        
        var _rootJSON = json_parse(_string);
    }
    catch(_error)
    {
        show_debug_message(json_stringify(_error, true));
        
        ModalCreateMessage($"Error during JSON parsing of \"{_path}\"");
        return;
    }
    
    var _projectDirectory = filename_dir(_path) + "\\";
    var _effectArray = [];
    
    try
    {
        var _resourcesArray = _rootJSON.resources;
        var _i = 0;
        repeat(array_length(_resourcesArray))
        {
            var _resourceData = _resourcesArray[_i].id;
            var _resourcePath = _resourceData.path;
            
            if (string_copy(_resourcePath, 1, 7) == "shaders")
            {
                //It's a shader, do further parsing
                
                var _resourceAbsolutePath = _projectDirectory + _resourcePath;
                
                var _buffer = buffer_load(filename_change_ext(_resourceAbsolutePath, ".vsh"));
                var _string = buffer_read(_buffer, buffer_text);
                buffer_delete(_buffer);
                
                //Only search the first 50 characters as an early out
                var _startPos = string_pos(HIGGS_HEADER, string_copy(_string, 1, 50));
                if (_startPos > 0)
                {
                    var _buffer = buffer_load(_resourceAbsolutePath);
                    var _string = buffer_read(_buffer, buffer_text);
                    buffer_delete(_buffer);
                    
                    var _shaderJSON = json_parse(_string);
                    array_push(_effectArray, _shaderJSON.name);
                }
            }
            
            ++_i;
        }
    }
    catch(_error)
    {
        show_debug_message(json_stringify(_error, true));
        
        ModalCreateMessage($"Error during shader discovery \"{_path}\"");
        return;
    }
    
    EffectClear();
    instance_destroy(oDocument);
    
    var _instance = instance_create_layer(0, 0, "Document", oDocument,
    {
        projectPath: _path,
        effectArray: _effectArray,
    });
    
    //We loaded successfully, save this project path for later
    RecentDataSave({
        projectPath: _path,
    });
    
    if (array_length(_effectArray) <= 0)
    {
        var _next = ModalCreateNew;
    }
    else
    {
        var _next = ModalCreateLoad;
    }
    
    ModalCreateMessageTimed($"Loaded {_path}", undefined, undefined, _next);
}