// Feather disable all

/// @param [x]
/// @param [y]
/// @param [executeAfter]

function ModalCreateHelp(_x = display_get_gui_width()/2, _y = display_get_gui_height()/2, _executeAfter = undefined)
{
    with(oModalParent) instance_destroy();
    
    return instance_create_layer(_x, _y, "Modals", oModalHelp, { executeAfter: _executeAfter });
}