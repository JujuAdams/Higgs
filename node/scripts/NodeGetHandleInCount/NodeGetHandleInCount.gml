// Feather disable all

/// @param node

function NodeGetHandleInCount(_node)
{
    if (not instance_exists(_node)) return 0;
    return array_length(_node.inHandleArray);
}