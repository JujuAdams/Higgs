// Feather disable all

window_set_size(floor(0.8*display_get_width()), floor(0.8*display_get_height()));
window_center();

windowWidth  = window_get_width();
windowHeight = window_get_height();

surface_resize(application_surface, windowWidth, windowHeight);