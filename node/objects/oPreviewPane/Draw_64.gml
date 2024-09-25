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
        draw_primitive_begin(pr_trianglestrip);
        PreviewDrawVertex(vertexArray[0]);
        PreviewDrawVertex(vertexArray[1]);
        PreviewDrawVertex(vertexArray[2]);
        PreviewDrawVertex(vertexArray[3]);
        draw_primitive_end();
    }
    
    ++_i;
}

surface_reset_target();

draw_surface(surface, panelX, panelY);