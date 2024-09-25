// Feather disable all

function EffectPopulatePermanents()
{
    if (not instance_exists(oDocument)) return;
    
    var _array = [];
    array_push(_array, NodeCreate(0, 0, "vertexPosition"));
    array_push(_array, NodeCreate(0, 0, "particleIndex"));
    array_push(_array, NodeCreate(0, 0, "emitterPosition"));
    array_push(_array, NodeCreate(0, 0, "age"));
    NodeLayoutArray(_array, -1000);
    
    var _array = [];
    array_push(_array, NodeCreate(0, 0, "outputPosition"));
    array_push(_array, NodeCreate(0, 0, "outputSprite"));
    array_push(_array, NodeCreate(0, 0, "outputImage"));
    array_push(_array, NodeCreate(0, 0, "outputColor"));
    NodeLayoutArray(_array, 1000);
}