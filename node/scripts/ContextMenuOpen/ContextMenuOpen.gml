// Feather disable all

/// @param subject

function ContextMenuOpen(_subject)
{
    if (not instance_exists(_subject)) return noone;
    
    layer_destroy_instances("ContextMenu");
    
    if (_subject.object_index == oNode)
    {
        if (_subject.nodeTypeData[$ "permanent"] ?? false)
        {
            var _menuJSON = [
                {
                    button: "Info",
                    func: function()
                    {
                        
                    }
                },
            ];
        }
        else
        {
            var _menuJSON = [
                {
                    button: "Info",
                    func: function()
                    {
                        
                    }
                },
                {
                    button: "Delete",
                    func: function()
                    {
                        instance_destroy(subject);
                    }
                },
            ];
        }
        
        var _contextMenu = instance_create_layer(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), "ContextMenu", oContextMenu, {
            subject: _subject,
            menuJSON: _menuJSON,
        });
    }
    else if (_subject.object_index == oDocument)
    {
        var _menuJSON = [
            {
                branch: "Node",
                children: [
                    {
                        branch: "Arithmetic",
                        children: [
                            {
                                button: "Add",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Subtract",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Multiply",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Divide",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Lerp",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Min",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Max",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Clamp",
                                func: function()
                                {
                                    
                                },
                            },
                        ],
                    },
                    {
                        branch: "Random",
                        children: [
                            {
                                button: "Random 0-1",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Range Range",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Random Vector",
                                func: function()
                                {
                                    
                                },
                            },
                        ],
                    },
                    {
                        branch: "Motion",
                        children: [
                            {
                                button: "Projectile",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Exponential Decay",
                                func: function()
                                {
                                    
                                },
                            },
                        ],
                    },
                    {
                        branch: "Easing",
                        children: [
                            {
                                button: "Quadratic",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Quartic",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Back-in",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Elastic",
                                func: function()
                                {
                                    
                                },
                            },
                            {
                                button: "Bounce",
                                func: function()
                                {
                                    
                                },
                            },
                        ],
                    },
                ],
            },
            {
                button: "Sprite Config",
                func: function()
                {
                    
                },
            },
            {
                button: "Save",
                func: function()
                {
                    ModalCreateMessage("Saved!");
                }
            },
            {
                button: "Load",
                func: function()
                {
                    ModalCreateLoad();
                }
            },
            {
                button: "New",
                func: function()
                {
                    ModalCreateNew();
                }
            },
            {
                button: "Switch Project",
                func: function()
                {
                    ModalCreateSwitchProject();
                }
            },
        ];
        
        var _contextMenu = instance_create_layer(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), "ContextMenu", oContextMenu, {
            subject: _subject,
            menuJSON: _menuJSON,
        });
    }
    
    return noone;
}