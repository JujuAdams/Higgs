// Feather disable all

if (current_time - createTime > 500)
{
    if (mouse_check_button_pressed(mb_any))
    {
        instance_destroy();
        if (is_callable(executeAfter)) executeAfter();
    }
}