// Feather disable all

/// @param instance
/// @param handleIndex
/// @param value

function PreviewSetHandleOut(_instance, _handleIndex, _value)
{
    with(NodeGetHandleOut(_instance, _handleIndex))
    {
        var _i = 0;
        repeat(array_length(edgeArray))
        {
            var _inHandle = edgeArray[_i].inHandle;
            if (instance_exists(_inHandle))
            {
                _inHandle.previewValue = _value;
                _inHandle.previewValueSet = true;
            }
            
            ++_i;
        }
    }
    
}