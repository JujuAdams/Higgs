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

if (instance_exists(topLevel.hover) && (not ContextMenuHasBranchParent(topLevel.hover, id)))
{
    var _i = 0;
    repeat(array_length(childArray))
    {
        instance_destroy(childArray[_i]);
        ++_i;
    }
    
    open = false;
    array_resize(childArray, 0);
}