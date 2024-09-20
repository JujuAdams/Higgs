// Feather disable all

system = new HiggsSystem();

stream = new HiggsStream();
system.Attach(0, 0, stream);

HiggsSpriteCacheStart(2048);
HiggsSpriteCache(sStar);
HiggsSpriteCache(sStar_1);
HiggsSpriteCacheEnd();