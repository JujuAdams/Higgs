// Feather disable all

if (current_time - createTime > 1300)
{
    instance_destroy();
    if (is_callable(executeAfter)) executeAfter();
}