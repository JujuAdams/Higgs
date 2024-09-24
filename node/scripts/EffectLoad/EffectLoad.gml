// Feather disable all

/// @param path

function EffectLoad(_path)
{
    var _buffer = buffer_load(_path);
    BufferDeserialize(_buffer);
    buffer_delete(_buffer);
    
    CameraRefocus();
}