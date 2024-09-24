// Feather disable all

function BufferDeserialize(_buffer)
{
    var _nodeArray = [];
    
    var _version = buffer_read(_buffer, buffer_string);
    if (_version != "v0")
    {
        Error($"Expecting version \"v0\", found \"{_version}\"");
    }
    
    var _nodeCount = buffer_read(_buffer, buffer_u64);
    repeat(_nodeCount)
    {
        var _objectName = buffer_read(_buffer, buffer_string);
        var _x          = buffer_read(_buffer, buffer_f64);
        var _y          = buffer_read(_buffer, buffer_f64);
        var _uuid       = buffer_read(_buffer, buffer_string);
        
        var _outCount = buffer_read(_buffer, buffer_u8);
        
        var _tempOutLinkArray = array_create(_outCount, undefined);
        var _i = 0;
        repeat(_outCount)
        {
            _tempOutLinkArray[_i] = buffer_read(_buffer, buffer_string);
            ++_i;
        }
        
        var _object = asset_get_index(_objectName);
        var _instance = instance_create_depth(_x, _y, 0, _object);
        with(_instance)
        {
            uuid = _uuid;
            tempOutLinkArray = _tempOutLinkArray;
        }
        
        array_push(_nodeArray, _instance);
    }
    
    var _i = 0;
    repeat(array_length(_nodeArray))
    {
        with(_nodeArray[_i])
        {
            var _j = array_length(tempOutLinkArray)-1;
            repeat(array_length(tempOutLinkArray))
            {
                var _uuid = tempOutLinkArray[_j];
                var _found = undefined;
                with(oNodeParent)
                {
                    if (uuid == _uuid)
                    {
                        _found = id;
                        break;
                    }
                }
                
                if (_found != undefined)
                {
                    array_push(outLinkArray, _found);
                }
                
                --_j;
            }
            
            variable_struct_remove(id, "tempOutLinkArray");
        }
    }
}