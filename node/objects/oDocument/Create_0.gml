// Feather disable all

effectName = undefined;

dragging = false;
dragOnMiddleClick = false;
dragX = 0;
dragY = 0;

viewPower = 0;
viewPowerTarget = 0;
viewScale = 1;

baseWidth  = camera_get_view_width( view_camera[0]);
baseHeight = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], -baseWidth/2, -baseHeight/2);