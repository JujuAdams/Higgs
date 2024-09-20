#define PARTICLE_INDEX  in_Position.z
#define PARTICLE_SIZE   u_vTextureData.xy
#define COUNT           12.0
#define COLOUR          vec4(247.0/255.0, 223.0/255.0, 100.0/255.0, 1.0) //#F7DF64 at 100% alpha

attribute vec3 in_Position; //z-coord is the particle index
attribute vec2 in_TextureCoord;

uniform vec2  u_vPosition;
uniform float u_fSeed;
uniform float u_fLife;
uniform vec3  u_vTextureData;
uniform float u_fSpriteIndex;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float easeSlowToFastQuad(float value)
{
    return value*value;
}

float easeSlowToFastQuart(float value)
{
    return (value *= value)*value;
}

float easeFastToSlowQuad(float value)
{
    value -= 1.0;
    return 1.0 - value*value;
}

float easeFastToSlowQuart(float value)
{
    value -= 1.0;
    return 1.0 - ((value *= value)*value);
}

float easeSmoothStep(float value)
{
    return smoothstep(0.0, 1.0, value);
}

float random(float value, float salt)
{
    return value*fract(sin(dot(vec2(u_fSeed + salt, PARTICLE_INDEX), vec2(12.9898, 78.233))) * 43758.5453);
}

float randomRange(float range, float salt)
{
    return range*(1.0 - random(2.0, salt));
}

float randomBetween(float mini, float maxi, float salt)
{
    return mix(mini, maxi, random(1.0, salt));
}

vec2 randomBetween(vec2 mini, vec2 maxi, float salt)
{
    return mix(mini, maxi, random(1.0, salt));
}

float distribute(float mini, float maxi)
{
    return mix(mini, maxi, PARTICLE_INDEX / (COUNT - 1.0));
}

vec2 distribute(vec2 mini, vec2 maxi)
{
    return mix(mini, maxi, PARTICLE_INDEX / (COUNT - 1.0));
}

float distributeIncomplete(float mini, float maxi)
{
    return mix(mini, maxi, PARTICLE_INDEX / COUNT);
}

vec2 distributeIncomplete(vec2 mini, vec2 maxi)
{
    return mix(mini, maxi, PARTICLE_INDEX / COUNT);
}

void moveDirection(inout vec2 vector, in float dist, in float degree)
{
    float sine   = sin(radians(degree));
    float cosine = cos(radians(degree));
    vector += dist*vec2(cosine, -sine);
}

void rotate(inout vec2 vector, in float degree)
{
    float sine   = sin(radians(degree));
    float cosine = cos(radians(degree));
    vector = mat2(cosine, -sine, sine, cosine)*vector;
}

float alternating(float mini, float maxi)
{
    return mix(mini, maxi, mod(PARTICLE_INDEX, 2.0));
}

float choose(float a, float b, float salt)
{
    return mix(a, b, step(0.5, random(1.0, salt)));
}

vec2 spriteTextureCoords(float spriteIndex)
{
    spriteIndex = floor(spriteIndex);
    float limit = floor(u_vTextureData.z / u_vTextureData.x);
    return (vec2(mod(spriteIndex, limit), floor(spriteIndex / limit)) + in_TextureCoord.xy) * (PARTICLE_SIZE / u_vTextureData.z);
}

void main()
{
    vec2 position = in_Position.xy;
    
    
    
    position *= PARTICLE_SIZE; //Scale up the particle
    position *= randomBetween(0.8, 1.2,   0.0); //Choose a random scaling factor between 80% and 120%
    position *= (1.0 - easeSlowToFastQuad(u_fLife)); //Put the shrinking animation on a smooth curve
    rotate(position, random(360.0,   1.0)); //Rotate randomly
    
    position += u_vPosition; //Offset the position to the draw coordinates
    float direction = distributeIncomplete(0.0, 360.0) + randomRange(20.0,   2.0); //Choose a random direction for motion
    float dist = randomBetween(80.0, 120.0,   3.0)*easeFastToSlowQuart(u_fLife); //Choose a random ending offset and smoothly animate to get there
    moveDirection(position, dist + 100.0, direction); //Move along this path, including a 100px starting offset
    
    
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(position, 0.0, 1.0);
    v_vTexcoord = spriteTextureCoords(u_fSpriteIndex);
    v_vColour   = COLOUR;
}