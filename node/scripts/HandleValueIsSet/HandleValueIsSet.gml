// Feather disable all

/// @param handle

function HandleValueIsSet(_handle)
{
    if (not instance_exists(_handle)) return false;
    
    return _handle.previewValueSet;
}