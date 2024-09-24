// Feather disable all

if (current_time - createTime > 600)
{
    if (mouse_check_button_pressed(mb_any))
    {
        instance_destroy();
    }
}