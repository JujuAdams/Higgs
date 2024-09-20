// Feather disable all

if (mouse_check_button(mb_left))
{
    stream.Stream(mouse_x, mouse_y);
}

if (mouse_check_button_pressed(mb_right))
{
    system.Attach(mouse_x, mouse_y, new HiggsStarburst12());
}