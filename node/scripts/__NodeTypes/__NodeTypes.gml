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
    },
    
    
    
    
    
    vertexPosition: {
        label: "Vertex Position",
        description: "Outputs the vertex position as a vec2\nThe x and y values will be either -0.5 or +0.5",
        permanent: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
    },
    
    particleIndex: {
        label: "Particle Index",
        description: "Outputs the particle's index as a float",
        permanent: true,
        
        in: [],
        
        out: [
            {
                label: "index",
                datatype: "float",
            },
        ],
    },
    
    emitterPosition: {
        label: "Emitter Position",
        description: "Outputs the emitter's world-space position as a vec2",
        permanent: true,
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
    },
    
    time: {
        label: "Time",
        description: "Outputs the emitter's time as a float",
        permanent: true,
        
        in: [],
        
        out: [
            {
                label: "time",
                datatype: "float",
            },
        ],
    },
    
    age: {
        label: "Age",
        description: "Outputs the particle's age as a float",
        permanent: true,
        
        in: [],
        
        out: [
            {
                label: "time",
                datatype: "float",
            },
        ],
    },
    
    
    
    
    
    constFloat: {
        label: "Const Float",
        description: "Outputs a constant float",
        
        in: [],
        
        out: [
            {
                label: "value",
                datatype: "float",
            },
        ],
    },
    
    constVec2: {
        label: "Const Vec2",
        description: "Outputs a constant vec2",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
    },
    
    constVec3: {
        label: "Const Vec3",
        description: "Outputs a constant vec3",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
    },
    
    constVec4: {
        label: "Const Vec4",
        description: "Outputs a constant vec4",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
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
    },
    
    
    
    
    uniformFloat: {
        label: "Uniform Float",
        description: "Outputs a float passed as a uniform parameter",
        
        in: [],
        
        out: [
            {
                label: "value",
                datatype: "float",
            },
        ],
    },
    
    uniformVec2: {
        label: "Uniform Vec2",
        description: "Outputs a vec2 passed as a uniform parameter",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
    },
    
    uniformVec3: {
        label: "Uniform Vec3",
        description: "Outputs a vec3 passed as a uniform parameter",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec3",
            },
        ],
    },
    
    uniformVec4: {
        label: "Uniform Vec4",
        description: "Outputs a vec4 passed as a uniform parameter",
        
        in: [],
        
        out: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
    },
    
    
    
    
    
    outputPosition: {
        label: "Output Position",
        description: "Receives a vec2 for the position of the vertex",
        permanent: true,
        
        in: [
            {
                label: "vector",
                datatype: "vec2",
            },
        ],
        
        out: [],
    },
    
    outputSprite: {
        label: "Output Sprite",
        description: "Receives a float for the sprite index of the particle",
        permanent: true,
        
        in: [
            {
                label: "sprite index",
                datatype: "float",
            },
        ],
        
        out: [],
    },
    
    outputImage: {
        label: "Output Image",
        description: "Receives a float for the image index of the particle",
        permanent: true,
        
        in: [
            {
                label: "image",
                datatype: "float",
            },
        ],
        
        out: [],
    },
    
    outputColor: {
        label: "Output Color",
        description: "Receives a vec4 for the color of the particle\nThe x/y/z/w components map to r/g/b/a",
        permanent: true,
        
        in: [
            {
                label: "vector",
                datatype: "vec4",
            },
        ],
        
        out: [],
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
    },
};