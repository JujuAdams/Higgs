// Feather disable all

/// @param path

function EffectSave(_path)
{
    if (not instance_exists(oDocument)) return;
    
    var _buffer = buffer_create(1024, buffer_grow, 1);
    BufferSerialize(_buffer);
    buffer_save(_buffer, _path);
    buffer_delete(_buffer);
}