// Feather disable all

/// @param node
/// @param handleIndex

function NodeGetHandleOut(_node, _handleIndex)
{
    if (not instance_exists(_node)) return noone;
    return _node.outHandleArray[_handleIndex];
}