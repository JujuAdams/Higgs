// Feather disable all

global.nodeTypes = {
    
    addVec2: {
        label: "Add Vec2",
        description: "Adds two vec2s together",
        
        in: [
            {
                label: "a",
                datatype: "vec2",
            },
            {
                label: "b",
                datatype: "vec2",
            },
        ],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            var _a = PreviewGetHandleIn(id, 0, 2);
            var _b = PreviewGetHandleIn(id, 1, 2);
            PreviewSetHandleOut(id, 0, [_a[0] + _b[0], _a[1] + _b[1]]);
        },
    },
    
    multiply: {
        label: "Multiply",
        description: "Multiplies a vec2 by a float",
        
        in: [
            {
                label: "vector",
                datatype: "vec2",
            },
            {
                label: "factor",
                datatype: "float",
            },
        ],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            var _a = PreviewGetHandleIn(id, 0, 2);
            var _b = PreviewGetHandleIn(id, 1, 1);
            PreviewSetHandleOut(id, 0, [_a[0]*_b, _a[1]*_b]);
        },
    },
    
    
    
    
    
    vertexPosition: {
        label: "Vertex Position",
        description: "Outputs the vertex position as a vec2\nThe x and y values will be either -0.5 or +0.5",
        permanent: true,
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput("vertexPosition", 2));
        },
    },
    
    particleIndex: {
        label: "Particle Index",
        description: "Outputs the particle's index as a float",
        permanent: true,
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "index",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput("particleIndex", 1));
        },
    },
    
    emitterPosition: {
        label: "Emitter Position",
        description: "Outputs the emitter's world-space position as a vec2",
        permanent: true,
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput("emitterPosition", 2));
        },
    },
    
    age: {
        label: "Age",
        description: "Outputs the particle's age as a float",
        permanent: true,
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "age",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput("age", 1));
        },
    },
    
    
    
    
    
    constFloat: {
        label: "Const Float",
        description: "Outputs a constant float",
        inputNode: true,
        
        in: [
            {
                label: "value",
                constant: true,
                datatype: "float",
            },
        ],
        
        out: [
            {
                label: "value",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetValue(id, 0));
        },
    },
    
    constVec2: {
        label: "Const Vec2",
        description: "Outputs a constant vec2",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetValue(id, 0), PreviewGetValue(id, 1)]);
        },
    },
    
    constVec3: {
        label: "Const Vec3",
        description: "Outputs a constant vec3",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetValue(id, 0), PreviewGetValue(id, 1), PreviewGetValue(id, 2)]);
        },
    },
    
    constVec4: {
        label: "Const Vec4",
        description: "Outputs a constant vec4",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetValue(id, 0), PreviewGetValue(id, 1), PreviewGetValue(id, 2), PreviewGetValue(id, 3)]);
        },
    },
    
    
    
    
    
    "random": {
        label: "Random (0-1)",
        description: "Outputs a random value between 0 and 1",
        
        in: [],
        
        out: [
            {
                label: "value",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [random(1)]);
        },
    },
    
    randomVector: {
        label: "Random Vector",
        description: "Outputs a random normalized vector as a vec2",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            var _angle = random(360);
            PreviewSetHandleOut(id, 0, [lengthdir_x(1, _angle), lengthdir_y(1, _angle)])
        },
    },
    
    
    
    
    uniformFloat: {
        label: "Uniform Float",
        description: "Outputs a float passed as a uniform parameter",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "value",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput(PreviewGetValue(id, 0), 1));
        },
    },
    
    uniformVec2: {
        label: "Uniform Vec2",
        description: "Outputs a vec2 passed as a uniform parameter",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput(PreviewGetValue(id, 0), 2));
        },
    },
    
    uniformVec3: {
        label: "Uniform Vec3",
        description: "Outputs a vec3 passed as a uniform parameter",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput(PreviewGetValue(id, 0), 3));
        },
    },
    
    uniformVec4: {
        label: "Uniform Vec4",
        description: "Outputs a vec4 passed as a uniform parameter",
        inputNode: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, PreviewGetInput(PreviewGetValue(id, 0), 4));
        },
    },
    
    
    
    
    
    outputPosition: {
        label: "Output Position",
        description: "Receives a vec2 for the position of the vertex",
        permanent: true,
        outputNode: true,
        
        in: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        out: [],
        
        previewFunc: function()
        {
            PreviewSetOutput("outputPosition", PreviewGetHandleIn(id, 0, 2));
        },
    },
    
    outputSprite: {
        label: "Output Sprite",
        description: "Receives a float for the sprite index of the particle",
        permanent: true,
        outputNode: true,
        
        in: [
            {
                label: "sprite index",
                datatype: "float",
            },
        ],
        
        out: [],
        
        previewFunc: function()
        {
            PreviewSetOutput("outputSprite", PreviewGetHandleIn(id, 0, 1));
        },
    },
    
    outputImage: {
        label: "Output Image",
        description: "Receives a float for the image index of the particle",
        permanent: true,
        outputNode: true,
        
        in: [
            {
                label: "image",
                datatype: "float",
            },
        ],
        
        out: [],
        
        previewFunc: function()
        {
            PreviewSetOutput("outputImage", PreviewGetHandleIn(id, 0, 1));
        },
    },
    
    outputColor: {
        label: "Output Color",
        description: "Receives a vec4 for the color of the particle\nThe x/y/z/w components map to r/g/b/a",
        permanent: true,
        outputNode: true,
        
        in: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        out: [],
        
        previewFunc: function()
        {
            PreviewSetOutput("outputColor", PreviewGetHandleIn(id, 0, 4));
        },
    },
    
    
    
    
    
    expandVec2: {
        label: "Expand Vec2",
        description: "Expands a vec2 into two floats",
        
        in: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        out: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            var _vector = PreviewGetHandleIn(id, 0, 2);
            PreviewSetHandleOut(id, 0, _vector[0]);
            PreviewSetHandleOut(id, 1, _vector[1]);
        },
    },
    
    expandVec3: {
        label: "Expand Vec3",
        description: "Expands a vec3 into three floats",
        
        in: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
        
        out: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
            {
                label: "z",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            var _vector = PreviewGetHandleIn(id, 0, 3);
            PreviewSetHandleOut(id, 0, _vector[0]);
            PreviewSetHandleOut(id, 1, _vector[1]);
            PreviewSetHandleOut(id, 2, _vector[2]);
        },
    },
    
    expandVec4: {
        label: "Expand Vec4",
        description: "Expands a vec4 into four floats",
        
        in: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        out: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
            {
                label: "z",
                datatype: "float",
            },
            {
                label: "w",
                datatype: "float",
            },
        ],
        
        previewFunc: function()
        {
            var _vector = PreviewGetHandleIn(id, 0, 4);
            PreviewSetHandleOut(id, 0, _vector[0]);
            PreviewSetHandleOut(id, 1, _vector[1]);
            PreviewSetHandleOut(id, 2, _vector[2]);
            PreviewSetHandleOut(id, 3, _vector[2]);
        },
    },
    
    
    
    
    
    combineVec2: {
        label: "Combine Vec2",
        description: "Combines two floats into a vec2",
        
        in: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
        ],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetHandleIn(id, 0, 1), PreviewGetHandleIn(id, 1, 1)]);
        },
    },
    
    combineVec3: {
        label: "Combine Vec3",
        description: "Combines three floats into a vec3",
        
        in: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
            {
                label: "z",
                datatype: "float",
            },
        ],
        
        out: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetHandleIn(id, 0, 1), PreviewGetHandleIn(id, 1, 1), PreviewGetHandleIn(id, 2, 1)]);
        },
    },
    
    combineVec4: {
        label: "Combine Vec4",
        description: "Combines four floats into a vec4",
        
        in: [
            {
                label: "x",
                datatype: "float",
            },
            {
                label: "y",
                datatype: "float",
            },
            {
                label: "z",
                datatype: "float",
            },
            {
                label: "w",
                datatype: "float",
            },
        ],
        
        out: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        previewFunc: function()
        {
            PreviewSetHandleOut(id, 0, [PreviewGetHandleIn(id, 0, 1), PreviewGetHandleIn(id, 1, 1), PreviewGetHandleIn(id, 2, 1), PreviewGetHandleIn(id, 3, 1)]);
        },
    },
};