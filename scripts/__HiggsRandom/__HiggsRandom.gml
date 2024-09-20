// Feather disable all

if (HIGGS_RANDOMIZE_ON_BOOT)
{
    randomize();
    __HiggsRandom();
}

function __HiggsRandom()
{
    static _state = irandom(0x7FFFFFFFFFFFFFFF);
    _state ^= _state << 13;
    _state ^= _state >> 17;
    _state ^= _state <<  5;
    return abs(_state) / (real(0x7FFFFFFFFFFFFFFF) + 1.0);
}