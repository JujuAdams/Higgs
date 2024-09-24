// Feather disable all

/// @param element
/// @param parent

function ContextMenuHasBranchParent(_element, _parent)
{
    if (not instance_exists(_element)) return false;
    if (not instance_exists(_parent)) return false;
    
    if (_element == _parent) return true;
    
    return ContextMenuHasBranchParent(_element.parent, _parent);
}