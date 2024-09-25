// Feather disable all

/// @param inputValueStruct

function PreviewExecute(_inputStruct)
{
    HandleResetAllValues();
    
    global.previewInputStruct  = _inputStruct;
    global.previewOutputStruct = {};
    
    var _pendingVisitArray  = [];
    var _pendingValuesArray = [];
    
    var _anyExecuted = true;
    NodeCopyFilterInputNode(_pendingValuesArray);
    
    while(_anyExecuted)
    {
        _anyExecuted = false;
        
        array_copy(_pendingVisitArray, array_length(_pendingVisitArray), _pendingValuesArray, 0, array_length(_pendingValuesArray));
        array_resize(_pendingValuesArray, 0);
        
        while(array_length(_pendingVisitArray) > 0)
        {
            var _node = array_shift(_pendingVisitArray);
            
            if (not NodeAllInHandlesSet(_node))
            {
                array_push(_pendingValuesArray, _node);
            }
            else
            {
                _anyExecuted = true;
                
                _node.nodeTypeData.previewFunc();
                NodeCopyFilterConnectedOut(_node, _pendingVisitArray);
            }
        }
    }
    
    return global.previewOutputStruct;
}