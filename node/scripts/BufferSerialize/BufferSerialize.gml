// Feather disable all

function BufferSerialize(_buffer)
{
    buffer_write(_buffer, buffer_string, "v0");
    buffer_write(_buffer, buffer_u64, instance_number(oNodeParent));
    
    with(oNodeParent)
    {
        buffer_write(_buffer, buffer_string, object_get_name(object_index));
        buffer_write(_buffer, buffer_f64, x);
        buffer_write(_buffer, buffer_f64, y);
        
        buffer_write(_buffer, buffer_u8, array_length(outLinkArray));
        var _i = 0;
        repeat(array_length(outLinkArray))
        {
            buffer_write(_buffer, buffer_string, outLinkArray[_i].uuid);
            ++_i;
        }
    }
}