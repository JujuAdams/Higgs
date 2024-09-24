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
                        ModalCreateMessage(subject.nodeTypeData[$ "description"] ?? "No description found", x, y);
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
                        ModalCreateMessage(subject.nodeTypeData[$ "description"] ?? "No description found", x, y);
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
            roomX: mouse_x,
            roomY: mouse_y,
            subject: _subject,
            menuJSON: _menuJSON,
        });
    }
    else if (_subject.object_index == oDocument)
    {
        if (_subject.effectPath == undefined)
        {
            var _menuJSON = [
                {
                    button: "New",
                    func: function()
                    {
                        ModalCreateNew();
                    }
                },
                {
                    button: "Load",
                    func: function()
                    {
                        var _path = "default.dat";
                        EffectClear();
                        EffectLoad(_path);
                        ModalCreateMessageTimed($"Loaded effect {_path}");
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
        }
        else
        {
            var _menuJSON = [
                {
                    branch: "Node ...",
                    children: [
                        {
                            branch: "Arithmetic ...",
                            children: [
                                {
                                    button: "Add",
                                    func: function()
                                    {
                                        NodeCreate(topLevel.roomX, topLevel.roomY, "addVec2");
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
                            branch: "Random ...",
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
                            branch: "Motion ...",
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
                            branch: "Easing ...",
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
                    button: "Save",
                    func: function()
                    {
                        var _path = "default.dat";
                        EffectSave(_path);
                        ModalCreateMessageTimed($"Saved effect {_path}");
                    }
                },
                {
                    button: "Refocus Camera",
                    func: function()
                    {
                        CameraRefocus();
                    }
                },
                {
                    button: "Configuration",
                    func: function()
                    {
                        
                    },
                },
                {
                    branch: "File Ops ...",
                    children: [
                        {
                            button: "New",
                            func: function()
                            {
                                ModalCreateNew();
                            }
                        },
                        {
                            button: "Load",
                            func: function()
                            {
                                var _path = "default.dat";
                                EffectClear();
                                EffectLoad(_path);
                                ModalCreateMessageTimed($"Loaded effect {_path}");
                                
                                //ModalCreateLoad();
                            }
                        },
                        {
                            button: "Switch Project",
                            func: function()
                            {
                                ModalCreateSwitchProject();
                            }
                        },
                    ],
                },
            ];
        }
        
        array_push(_menuJSON,
            {
                button: "Help!",
                func: function()
                {
                    ModalCreateHelp();
                }
            }
        );
        
        var _contextMenu = instance_create_layer(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), "ContextMenu", oContextMenu, {
            roomX: mouse_x,
            roomY: mouse_y,
            subject: _subject,
            menuJSON: _menuJSON,
        });
    }
    else if (_subject.object_index == oApp)
    {
        var _menuJSON = [
            {
                button: "Switch Project",
                func: function()
                {
                    ModalCreateSwitchProject();
                }
            },
            {
                button: "Help!",
                func: function()
                {
                    ModalCreateHelp();
                }
            },
        ];
        
        var _contextMenu = instance_create_layer(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), "ContextMenu", oContextMenu, {
            roomX: mouse_x,
            roomY: mouse_y,
            subject: _subject,
            menuJSON: _menuJSON,
        });
    }
    
    return noone;
}