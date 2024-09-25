// Feather disable all

if (not open) return;

if (not surface_exists(surface))
{
    surface = surface_create(panelWidth, panelHeight);
}

if ((surface_get_width(surface) != panelWidth) || (surface_get_height(surface) != panelHeight))
{
    surface_free(surface);
    surface = surface_create(panelWidth, panelHeight);
}

surface_set_target(surface);
draw_clear(c_grey);

var _i = 0;
repeat(array_length(particleArray))
{
    with(particleArray[_i])
    {
        var _vertexPosition = vertexArray[0].outputStruct[$ "outputPosition"];
        var _x = array_length(_vertexPosition)? _vertexPosition[0] : 0;
        var _y = array_length(_vertexPosition)? _vertexPosition[1] : 0;
        
        draw_circle(_x, _y, 20, true);
    }
}

surface_reset_target();

draw_surface(surface, panelX, panelY);