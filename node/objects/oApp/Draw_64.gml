// Feather disable all

if ((not instance_exists(oDocument)) && (alarm[0] <= 0))
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(display_get_gui_width()/2, display_get_gui_height()/2, "Right click and select \"Switch Project\" to begin.");
}