// Feather disable all

if ((window_get_width() > 0) && (window_get_height() > 0))
{
    if ((window_get_width() != windowWidth) || (window_get_height() != windowHeight))
    {
        windowWidth  = window_get_width();
        windowHeight = window_get_height();
        
        surface_resize(application_surface, windowWidth, windowHeight);
    }
}

if (mouse_check_button_pressed(mb_right))
{
    if (not instance_exists(oDocument))
    {
        ContextMenuOpen(id);
    }
}