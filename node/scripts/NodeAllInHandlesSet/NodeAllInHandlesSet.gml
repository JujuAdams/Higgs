// Feather disable all

/// @param node

function NodeAllInHandlesSet(_node)
{
    var _i = 0;
    repeat(NodeGetHandleInCount(_node))
    {
        if (not HandleValueIsSet(NodeGetHandleIn(_node, _i)))
        {
            return false;
        }
        
        ++_i;
    }
    
    return true;
}