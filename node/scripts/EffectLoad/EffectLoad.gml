// Feather disable all

/// @param name

function EffectLoad(_name)
{
    if (not instance_exists(oDocument)) return;
    
    var _buffer = buffer_load(_path);
    BufferDeserialize(_buffer);
    buffer_delete(_buffer);
    
    CameraRefocus();
    oDocument.effectName = _name;
}