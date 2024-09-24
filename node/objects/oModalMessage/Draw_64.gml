// Feather disable all

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

var _width  = string_width( label) + 30;
var _height = string_height(label) + 30;

draw_set_color(c_white);
draw_rectangle(x - _width/2, y - _height/2, x + _width/2, y + _height/2, false);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, label);
draw_set_color(c_white);