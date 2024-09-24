// Feather disable all

/// @param name

function EffectNew(_name)
{
    if (not instance_exists(oDocument)) return;
    
    var _projectName = filename_change_ext(filename_name(oDocument.projectPath), "");
    
    var _projectDirectory = filename_dir(oDocument.projectPath) + "\\";
    var _newDirectory = $"{_projectDirectory}shaders\\{_name}\\";
    
    directory_create(_newDirectory);
    
    if (not directory_exists(_newDirectory))
    {
        Error($"Failed to create new shader directory\n{_newDirectory}");
        return;
    }
    
    file_copy("default.vsh", $"{_newDirectory}{_name}.vsh");
    file_copy("default.fsh", $"{_newDirectory}{_name}.fsh");
    
    var _buffer = buffer_load("default.yy");
    var _string = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    
    _string = string_replace_all(_string, "%effectName%", _name);
    _string = string_replace_all(_string, "%projectName%", _projectName);
    
    var _buffer = buffer_create(1024, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, _string);
    buffer_save_ext(_buffer, $"{_newDirectory}{_name}.yy", 0, buffer_tell(_buffer));
    
    var _buffer = buffer_load(oDocument.projectPath);
    var _string = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    
    var _search = "  \"resources\":[";
    var _pos = string_pos(_search, _string);
    
    if (_pos <= 0)
    {
        Error("Resources array not found in .yyp");
        return;
    }
    
    var _string = string_insert($"\n    \{\"id\":\{\"name\":\"{_name}\",\"path\":\"shaders/{_name}/{_name}.yy\",},},", _string, _pos + string_length(_search));
    
    var _buffer = buffer_create(1024, buffer_grow, 1);
    buffer_write(_buffer, buffer_text, _string);
    buffer_save_ext(_buffer, oDocument.projectPath, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
    
    EffectClear();
    EffectPopulatePermanents();
    CameraRefocus();
    
    array_push(oDocument.effectArray, _name);
    array_sort(oDocument.effectArray, true);
    oDocument.effectName = _name;
    
    ModalCreateMessageTimed($"Created new effect \"{_name}", undefined, undefined, ModalCreateConfiguration);
}