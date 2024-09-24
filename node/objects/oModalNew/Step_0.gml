// Feather disable all

input_string_tick();

if (keyboard_check_pressed(vk_escape))
{
    instance_destroy();
}
else if (keyboard_check_pressed(vk_enter))
{
    var _index = array_get_index(oDocument.effectArray, input_string_get());
    if ((string_length(input_string_get()) > 5) && (_index < 0))
    {
        instance_destroy();
        EffectNew(input_string_get());
    }
}

text = $"Type to set the name for the new shader asset.\nThe shader will appear as an asset in your asset browser.\n\n\"{input_string_get()}\"\n\nescape = Cancel\nenter = Confirm";

image_xscale = (string_width( text) + 30) / sprite_get_width(sprite_index);
image_yscale = (string_height(text) + 30) / sprite_get_height(sprite_index);