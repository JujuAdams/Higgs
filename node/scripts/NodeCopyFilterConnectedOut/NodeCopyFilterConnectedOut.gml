// Feather disable all

/// @param node
/// @param [array]

function NodeCopyFilterConnectedOut(_node, _array = [])
{
    var _i = 0;
    repeat(NodeGetHandleOutCount(_node))
    {
        var _edgeArray = NodeGetHandleOut(_node, _i).edgeArray;
        
        var _j = 0;
        repeat(array_length(_edgeArray))
        {
            array_push(_array, _edgeArray[_i].inHandle.node);
            ++_j;
        }
        
        ++_i;
    }
    
    return _array;
}