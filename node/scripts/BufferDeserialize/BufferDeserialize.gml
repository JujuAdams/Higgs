// Feather disable all

function BufferDeserialize(_buffer)
{
    var _version = buffer_read(_buffer, buffer_string);
    if (_version != "v0")
    {
        Error($"Expecting version \"v0\", found \"{_version}\"");
    }
    
    var _nodeCount = buffer_read(_buffer, buffer_u64);
    repeat(_nodeCount)
    {
        var _type = buffer_read(_buffer, buffer_string);
        var _uuid = buffer_read(_buffer, buffer_string);
        var _x    = buffer_read(_buffer, buffer_f64);
        var _y    = buffer_read(_buffer, buffer_f64);
        
        var _instance = NodeCreate(_x, _y, _type);
        _instance.uuid = _uuid;
    }
}