// Feather disable all

function RecentDataLoad()
{
    try
    {
        var _buffer = buffer_load(game_save_id + "recent.json");
        var _string = buffer_read(_buffer, buffer_text);
        var _json = json_parse(_string);
        buffer_delete(_buffer);
        return _json;
    }
    catch(_error)
    {
        show_debug_message(json_stringify(_error, true));
    }
    
    return {};
}