// Feather disable all

if (not instance_exists(parent))
{
    instance_destroy();
    return;
}

if (not instance_exists(topLevel))
{
    instance_destroy();
    return;
}