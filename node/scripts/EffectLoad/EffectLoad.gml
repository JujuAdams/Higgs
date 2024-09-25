// Feather disable all

/// @param name

function EffectLoad(_name)
{
    if (not instance_exists(oDocument)) return;
    
    var _projectDirectory = filename_dir(oDocument.projectPath) + "\\";
    var _shaderPath = $"{_projectDirectory}shaders\\{_name}\\{_name}.vsh";
    
    var _buffer = buffer_load(_shaderPath);
    var _sourceString = buffer_read(_buffer, buffer_text);
    buffer_delete(_buffer);
    
    var _startPos = string_pos(HIGGS_HEADER, _sourceString) + string_length(HIGGS_HEADER);
    var _endPos = string_pos_ext(HIGGS_FOOTER, _sourceString, _startPos);
    
    var _base64String = string_copy(_sourceString, _startPos, _endPos - _startPos);
    _base64String = string_replace_all(_base64String, "\n", "");
    
    var _compressedBuffer = buffer_base64_decode(_base64String);
    var _buffer = buffer_decompress(_compressedBuffer);
    buffer_delete(_compressedBuffer);
    
    EffectClear();
    BufferDeserialize(_buffer);
    buffer_delete(_buffer);
    
    CameraRefocus();
    oDocument.effectName = _name;
}