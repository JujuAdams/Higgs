// Feather disable all

/// @param instance
/// @param handleIndex
/// @param dimensions

function PreviewGetHandleIn(_instance, _handleIndex, _dimensions)
{
    var _handle = NodeGetHandleIn(_instance, _handleIndex);
    if (not instance_exists(_handle)) return array_create(_dimensions, 0);
    if (not HandleIsConnected(_handle)) return array_create(_dimensions, 0);
    return _handle.previewValue;
}