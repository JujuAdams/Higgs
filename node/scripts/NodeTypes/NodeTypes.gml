// Feather disable all

global.nodeTypes = {
    
    addVec2: {
        label: "Add Vec2",
        
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