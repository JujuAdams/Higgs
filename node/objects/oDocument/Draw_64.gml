// Feather disable all

if (effectName == undefined)
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Right click and select \"New\" or \"Load\" to start editing an effect.");
}
else
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_text(13, 13, effectName);
    draw_set_alpha(1);
    draw_text( 9, 10, effectName);
    draw_text(11, 10, effectName);
    draw_text(10,  9, effectName);
    draw_text(10, 11, effectName);
    draw_set_color(c_white);
    draw_text(10, 10, effectName);
}