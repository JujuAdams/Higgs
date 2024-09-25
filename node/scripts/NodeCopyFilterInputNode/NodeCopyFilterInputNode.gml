// Feather disable all

/// @param [array]

function NodeCopyFilterInputNode(_array = [])
{
    with(oNode)
    {
        if (nodeTypeData[$ "inputNode"] ?? false)
        {
            array_push(_array, id);
        }
    }
    
    return _array;
}