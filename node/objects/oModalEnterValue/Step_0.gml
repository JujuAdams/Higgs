// Feather disable all

input_string_tick();

if (keyboard_check_pressed(vk_escape))
{
    instance_destroy();
}
else if (keyboard_check_pressed(vk_enter))
{
    try
    {
        constantHandle.previewValue = [real(input_string_get())];
    }
    catch(_error)
    {
        show_debug_message(json_stringify(_error, true));
    }
    
    instance_destroy();
    if (is_callable(executeAfter)) executeAfter();
}

text = $"Type to set a new value.\nOld value = >{oldValue}<\n\n\>{input_string_get()}<\n\nescape = Cancel\nenter = Confirm";

image_xscale = (string_width( text) + 30) / sprite_get_width(sprite_index);
image_yscale = (string_height(text) + 30) / sprite_get_height(sprite_index);