// Feather disable all

/// @param node
/// @param handleIndex

function NodeGetHandleIn(_node, _handleIndex)
{
    if (not instance_exists(_node)) return noone;
    return _node.inHandleArray[_handleIndex];
}