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
PreviewDraw();
surface_reset_target();

draw_surface(surface, panelX, panelY);