// Feather disable all

function NodeCheckDocumentHasCycle()
{
    var _safeMap = ds_map_create();
    var _visitedMap = ds_map_create();
    var _pendingMap = ds_map_create();
    var _pendingArray = [];
    
    ds_map_clear(_safeMap);
    
    with(oNode)
    {
        if (ds_map_exists(_safeMap, id)) continue;
        
        ds_map_clear(_visitedMap);
        ds_map_clear(_pendingMap);
        array_resize(_pendingArray, 0);
        
        _safeMap[? id] = true;
        _pendingMap[? id] = true;
        array_push(_pendingArray, id);
        
        while(array_length(_pendingArray) > 0)
        {
            with(array_pop(_pendingArray))
            {
                if (ds_map_exists(_visitedMap, id)) return true;
                _visitedMap[? id] = true;
                
                ds_map_delete(_pendingMap, id);
                
                var _i = 0;
                repeat(array_length(outHandleArray))
                {
                    var _handle = outHandleArray[_i];
                    
                    var _outEdgeArray = _handle.edgeArray;
                    var _j = 0;
                    repeat(array_length(_outEdgeArray))
                    {
                        var _inNode = _outEdgeArray[_j].inHandle.node;
                        
                        if (not ds_map_exists(_pendingMap, _inNode))
                        {
                            _safeMap[? _inNode] = true;
                            _pendingMap[? _inNode] = true;
                            array_push(_pendingArray, _inNode);
                        }
                        
                        ++_j;
                    }
                    
                    ++_i;
                }
            }
        }
    }
    
    return false;
}