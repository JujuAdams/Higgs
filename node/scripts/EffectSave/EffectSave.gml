// Feather disable all

/// @param [showMessage=true]

function EffectSave(_showMessage = true)
{
    if (not instance_exists(oDocument)) return;
    if (oDocument.effectName == undefined) return;
    
    if (not file_exists("default.vsh"))
    {
        ModalCreateMessage("Save failed!\n\nFailed to find default vertex shader.");
        return;
    }
    
    var _projectDirectory = filename_dir(oDocument.projectPath) + "\\";
    var _shaderPath = $"{_projectDirectory}shaders\\{oDocument.effectName}\\{oDocument.effectName}.vsh";
    
    var _buffer = buffer_create(1024, buffer_grow, 1);
    BufferSerialize(_buffer);
    
    var _bufferCompressed = buffer_compress(_buffer, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
    
    var _rawString = buffer_base64_encode(_bufferCompressed, 0, buffer_get_size(_bufferCompressed));
    buffer_delete(_bufferCompressed);
    
    var _formattedString = "";
    var _length = string_length(_rawString);
    
    var _pos = 1;
    repeat(ceil(_length / 100))
    {
        _formattedString += string_copy(_rawString, _pos, 100) + "\n";
        _pos += 100;
    }
    
    var _buffer = buffer_load("default.vsh");
    var _sourceString = buffer_read(_buffer, buffer_text);
    
    var _startPos = string_pos(HIGGS_HEADER, _sourceString) + string_length(HIGGS_HEADER);
    var _endPos = string_pos_ext(HIGGS_FOOTER, _sourceString, _startPos);
    
    _sourceString = string_delete(_sourceString, _startPos, _endPos - _startPos);
    _sourceString = string_insert("\n" + _formattedString, _sourceString, _startPos);
    
    buffer_seek(_buffer, buffer_seek_start, 0);
    buffer_write(_buffer, buffer_text, _sourceString);
    buffer_save_ext(_buffer, _shaderPath, 0, buffer_tell(_buffer));
    buffer_delete(_buffer);
    
    if (_showMessage)
    {
        ModalCreateMessageTimed($"Saved effect {oDocument.effectName}");
    }
}