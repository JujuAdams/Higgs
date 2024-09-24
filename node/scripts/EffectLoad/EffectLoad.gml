// Feather disable all

/// @param path

function EffectLoad(_path)
{
    if (not instance_exists(oDocument)) return;
    
    var _buffer = buffer_load(_path);
    BufferDeserialize(_buffer);
    buffer_delete(_buffer);
    
    CameraRefocus();
    oDocument.effectPath = _path;
}