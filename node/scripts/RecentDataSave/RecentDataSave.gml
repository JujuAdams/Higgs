// Feather disable all

/// @param data

function RecentDataSave(_data)
{
    var _string = json_stringify(_data, true);
    
    var _buffer = buffer_create(string_byte_length(_string), buffer_fixed, 1);
    buffer_write(_buffer, buffer_text, _string);
    buffer_save(_buffer, game_save_id + "recent.json");
    buffer_delete(_buffer);
}