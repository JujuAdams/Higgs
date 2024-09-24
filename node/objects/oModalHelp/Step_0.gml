// Feather disable all

if (current_time - createTime > 1000)
{
    if (mouse_check_button_pressed(mb_left))
    {
        instance_destroy();
        if (is_callable(executeAfter)) executeAfter();
    }
}