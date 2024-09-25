// Feather disable all

/// @param handle

function HandleIsConnected(_handle)
{
    if (not instance_exists(_handle)) return false;
    
    if (_handle.object_index == oHandleIn)
    {
        return instance_exists(_handle.edge);
    }
    else if (_handle.object_index == oHandleOut)
    {
        return (array_length(edgeArray) > 0);
    }
    else if (_handle.object_index == oHandleConstant)
    {
        return true;
    }
    
    return false;
}