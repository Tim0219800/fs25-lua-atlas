# utils/ParticleUtil.lua

Source: `dataS/scripts/utils/ParticleUtil.lua` — FS25 1.25.1.0

> ⚠ In the SDK dump this file only contains **signatures** (no bodies).

✍ Utilitaires de systèmes de particules : chargement depuis le XML ou un nœud I3D, émission, vitesses, échelles, durée de vie, matériau et copie. ⚠ Le dump du SDK ne contient que les signatures : le comportement interne n'est pas lisible. Les descriptions ci-dessous viennent de l'usage observé dans le code vanilla (WorkParticles notamment) ; le reste est NON VÉRIFIÉ. Les fonctions qui portent sur « particleSystem » prennent la table renvoyée par les fonctions de chargement, pas un id de nœud.

- **ParticleUtil** (l.6)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ParticleUtil.loadParticleSystemData(xmlFile: XMLFile\|integer, data: table, baseString: string)` | 12 |  |
| `ParticleUtil.loadParticleSystem(xmlFile: integer, particleSystem: table, baseString: string, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string, defaultLinkNode: integer?) → boolean` | 44 |  |
| `ParticleUtil.loadParticleSystemFromData(data: table, particleSystem: table, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string?, defaultLinkNode: integer?) → boolean` | 60 |  |
| `ParticleUtil.particleI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table)` | 96 |  |
| `ParticleUtil.loadParticleSystemFromNode(rootNode: integer, particleSystem: table, defaultEmittingState: boolean?, worldSpace: boolean?, forceFullLifespan: boolean?) → integer` | 144 | ✍ Initialise la table particleSystem à partir d'un nœud I3D déjà chargé. Usage vanilla (WorkParticles) : émission initiale désactivée et worldSpace=true, de sorte que les particules restent en coordonnées monde après leur émission. |
| `ParticleUtil.deleteParticleSystem(particleSystem: table)` | 193 | ✍ Supprime un système de particules chargé ; appelé dans les onDelete (WorkParticles:onDelete). |
| `ParticleUtil.deleteParticleSystems(particleSystems: table)` | 212 |  |
| `ParticleUtil.setEmittingState(particleSystem: table, state: boolean, resetStartTimer: boolean?, resetStopTimer: boolean?)` | 226 | ✍ Active ou coupe l'émission d'un système. WorkParticles l'appelle à chaque tick avec l'état calculé ; les paramètres resetStartTimer/resetStopTimer ne sont pas utilisés dans ce cas. |
| `ParticleUtil.getParticleSystemAverageSpeed(particleSystem: table) → number` | 262 |  |
| `ParticleUtil.setParticleSystemTimeScale(particleSystem: table, scale: number)` | 274 |  |
| `ParticleUtil.setEmitCountScale(particleSystem: table, scale: number)` | 284 |  |
| `ParticleUtil.setParticleLifespan(particleSystem: table, lifespan: number)` | 294 |  |
| `ParticleUtil.addParticleSystemSimulationTime(particleSystem: table, simTime: number)` | 304 |  |
| `ParticleUtil.setParticleStartStopTime(particleSystem: table, startTime: number, stopTime: number)` | 315 |  |
| `ParticleUtil.getParticleSystemSpeed(particleSystem: table) → number` | 326 |  |
| `ParticleUtil.setParticleSystemSpeed(particleSystem: table, speed: number)` | 338 |  |
| `ParticleUtil.getParticleSystemSpeedRandom(particleSystem: table) → number` | 348 |  |
| `ParticleUtil.setParticleSystemSpeedRandom(particleSystem: table, speedRandom: number)` | 360 |  |
| `ParticleUtil.getParticleSystemNormalSpeed(particleSystem: table) → number` | 370 |  |
| `ParticleUtil.setParticleSystemNormalSpeed(particleSystem: table, normalSpeed: number)` | 382 |  |
| `ParticleUtil.getParticleSystemTangentSpeed(particleSystem: table) → number` | 392 |  |
| `ParticleUtil.setParticleSystemTangentSpeed(particleSystem: table, tangentSpeed: number)` | 404 |  |
| `ParticleUtil.getParticleSystemSpriteScaleX(particleSystem: table) → number` | 414 |  |
| `ParticleUtil.setParticleSystemSpriteScaleX(particleSystem: table, spriteScaleX: number)` | 426 |  |
| `ParticleUtil.getParticleSystemSpriteScaleY(particleSystem: table) → number` | 436 |  |
| `ParticleUtil.setParticleSystemSpriteScaleY(particleSystem: table, spriteScaleY: number)` | 448 |  |
| `ParticleUtil.getParticleSystemSpriteScaleXGain(particleSystem: table) → number` | 458 |  |
| `ParticleUtil.setParticleSystemSpriteScaleXGain(particleSystem: table, spriteScaleXGain: number)` | 470 |  |
| `ParticleUtil.getParticleSystemSpriteScaleYGain(particleSystem: table) → number` | 480 |  |
| `ParticleUtil.setParticleSystemSpriteScaleYGain(particleSystem: table, spriteScaleYGain: number)` | 492 |  |
| `ParticleUtil.getParticleSystemVelocityScale(particleSystem: table) → number` | 502 |  |
| `ParticleUtil.setParticleSystemVelocityScale(particleSystem: table, velocityScale: number)` | 513 |  |
| `ParticleUtil.resetNumOfEmittedParticles(particleSystem: table)` | 522 |  |
| `ParticleUtil.setEmitterShape(particleSystem: table, emitterShape: integer)` | 532 |  |
| `ParticleUtil.initEmitterScale(particleSystem: table, scale: number)` | 553 |  |
| `ParticleUtil.setMaxNumOfParticlesToEmitScale(particleSystem: table, scale: number)` | 571 |  |
| `ParticleUtil.setMaterial(particleSystem: table, material: integer)` | 584 | ✍ Applique un matériau à un système. Usage vanilla : matériau de particule propre au type de remplissage (g_materialManager:getParticleMaterial). |
| `ParticleUtil.copyParticleSystem(xmlFile: XMLFile, key: string, particleSystem: table, emitterShape: integer) → table` | 597 | ✍ Duplique un système de référence (venant de g_particleSystemManager) et l'attache à emitterShape, avec des surcharges lues sous la clé XML ; renvoie la table du nouveau système (usage : WorkParticles:loadGroundParticleMapping). |
| `ParticleUtil.registerParticleXMLPaths(schema: XMLSchema, basePath: string, name: string)` | 660 |  |
| `ParticleUtil.registerParticleCopyXMLPaths(schema: XMLSchema, basePath: string)` | 680 | ✍ Enregistre dans un schéma XML les attributs acceptés par copyParticleSystem (appelé depuis WorkParticles.registerGroundParticleMappingXMLPaths). |
