// Feather disable all

randomize();

draw_set_font(fMain);

dragging = false;
dragOnMiddleClick = false;
dragX = 0;
dragY = 0;

viewPower = 0;
viewPowerTarget = 0;

baseWidth  = camera_get_view_width( view_camera[0]);
baseHeight = camera_get_view_height(view_camera[0]);

camera_set_view_pos(view_camera[0], -baseWidth/2, -baseHeight/2);

var _array = [];
array_push(_array, NodeCreate(0, 0, "vertexPosition"));
array_push(_array, NodeCreate(0, 0, "particleIndex"));
array_push(_array, NodeCreate(0, 0, "emitterPosition"));
array_push(_array, NodeCreate(0, 0, "time"));
NodeLayoutArray(_array, -baseWidth/2);

var _array = [];
array_push(_array, NodeCreate(0, 0, "constFloat"));
array_push(_array, NodeCreate(0, 0, "randomVector"));
NodeLayoutArray(_array, -baseWidth/6);

var _array = [];
array_push(_array, NodeCreate(0, 0, "addVec2"));
array_push(_array, NodeCreate(0, 0, "multiply"));
array_push(_array, NodeCreate(0, 0, "multiply"));
array_push(_array, NodeCreate(0, 0, "addVec2"));
NodeLayoutArray(_array, baseWidth/6);

var _array = [];
array_push(_array, NodeCreate(0, 0, "outputPosition"));
array_push(_array, NodeCreate(0, 0, "outputSprite"));
array_push(_array, NodeCreate(0, 0, "outputImage"));
array_push(_array, NodeCreate(0, 0, "outputColor"));
NodeLayoutArray(_array, baseWidth/2);
