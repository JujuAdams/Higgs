// Feather disable all

function BufferSerialize(_buffer)
{
    buffer_write(_buffer, buffer_string, "v0");
    
    buffer_write(_buffer, buffer_u64, instance_number(oNode));
    with(oNode)
    {
        buffer_write(_buffer, buffer_string, nodeType);
        buffer_write(_buffer, buffer_string, uuid);
        buffer_write(_buffer, buffer_f64, x);
        buffer_write(_buffer, buffer_f64, y);
    }
    
    buffer_write(_buffer, buffer_u64, instance_number(oEdge));
    with(oEdge)
    {
        buffer_write(_buffer, buffer_string, inHandle.parent.uuid);
        buffer_write(_buffer, buffer_string, inHandle.index);
        buffer_write(_buffer, buffer_string, outHandle.parent.uuid);
        buffer_write(_buffer, buffer_string, outHandle.index);
    }
}