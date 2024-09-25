// Feather disable all

panelX      = display_get_gui_width()/2;
panelY      = 0;
panelWidth  = round(display_get_gui_width());
panelHeight = round(display_get_gui_height());

if (keyboard_check_pressed(vk_space))
{
    open = not open;
}

if (open)
{
    if (mouse_check_button_pressed(mb_left))
    {
        var _outputStruct = PreviewExecute({
            vertexPosition: [-0.5, -0.5],
            particleIndex: 0,
            emitterPosition: [0, 0],
            age: 0,
        });
        
        show_debug_message(json_stringify(_outputStruct, true));
    }
}