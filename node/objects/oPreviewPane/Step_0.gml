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
        var _mouseX = device_mouse_x_to_gui(0) - panelX;
        var _mouseY = device_mouse_y_to_gui(0);
        
        array_push(particleArray,
        {
            vertexArray: [
                {
                    inputStruct: {
                        vertexPosition: [-0.5, -0.5],
                        particleIndex: [0],
                        emitterPosition: [_mouseX, _mouseY],
                        age: [0],
                    },
                    outputStruct: {},
                },
                {
                    inputStruct: {
                        vertexPosition: [0.5, -0.5],
                        particleIndex: [0],
                        emitterPosition: [_mouseX, _mouseY],
                        age: [0],
                    },
                    outputStruct: {},
                },
                {
                    inputStruct: {
                        vertexPosition: [-0.5, 0.5],
                        particleIndex: [0],
                        emitterPosition: [_mouseX, _mouseY],
                        age: [0],
                    },
                    outputStruct: {},
                },
                {
                    inputStruct: {
                        vertexPosition: [0.5, 0.5],
                        particleIndex: [0],
                        emitterPosition: [_mouseX, _mouseY],
                        age: [0],
                    },
                    outputStruct: {},
                },
            ],
            
            age: 0,
        });
    }
    
    var _i = 0;
    repeat(array_length(particleArray))
    {
        with(particleArray[_i])
        {
            age++;
            
            var _j = 0;
            repeat(array_length(vertexArray))
            {
                with(vertexArray[_j])
                {
                    inputStruct.age[0] = other.age;
                    outputStruct = PreviewExecute(inputStruct);
                }
                
                ++_j;
            }
        }
        
        ++_i;
    }
}