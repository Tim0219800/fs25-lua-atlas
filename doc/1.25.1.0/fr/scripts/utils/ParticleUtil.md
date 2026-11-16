# utils/ParticleUtil.lua

*[English version](../../../scripts/utils/ParticleUtil.md)*

Source: `dataS/scripts/utils/ParticleUtil.lua` — FS25 1.25.1.0

> ⚠ Dans le dump du SDK, ce fichier ne contient que des **signatures** (pas de corps).

✍ Utilitaires de systèmes de particules : chargement depuis le XML ou un nœud I3D, émission, vitesses, échelles, durée de vie, matériau et copie. ⚠ Le dump du SDK ne contient que les signatures : le comportement interne n'est pas lisible. Les descriptions ci-dessous viennent de l'usage observé dans le code vanilla (WorkParticles notamment) ; le reste est NON VÉRIFIÉ. Les fonctions qui portent sur « particleSystem » prennent la table renvoyée par les fonctions de chargement, pas un id de nœud.

- **ParticleUtil** (l.6)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ParticleUtil.loadParticleSystemData(xmlFile: XMLFile\|integer, data: table, baseString: string)` | 12 | ✍ Signature seule (pas de corps dans le dump du SDK) : lit les données d'un système de particules depuis un fichier XML sous baseString dans la table data, apparemment sans créer le système. NON VÉRIFIÉ. |
| `ParticleUtil.loadParticleSystem(xmlFile: integer, particleSystem: table, baseString: string, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string, defaultLinkNode: integer?) → boolean` | 44 | ✍ Signature seule (pas de corps dans le dump du SDK) : charge un système de particules depuis un XML et une clé de base dans la table particleSystem, avec nœuds de liaison, état d'émission par défaut et fichier par défaut. Utilisé par Motorized pour les particules d'échappement. Comportement interne NON VÉRIFIÉ. |
| `ParticleUtil.loadParticleSystemFromData(data: table, particleSystem: table, linkNodes: array, defaultEmittingState: boolean, defaultPsFile: string?, baseDir: string?, defaultLinkNode: integer?) → boolean` | 60 | ✍ Signature seule (pas de corps dans le dump du SDK) : même principe que loadParticleSystem mais depuis une table de données remplie auparavant par loadParticleSystemData. NON VÉRIFIÉ. |
| `ParticleUtil.particleI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table)` | 96 | ✍ Signature seule (pas de corps dans le dump du SDK) : rappel du chargement I3D asynchrone (i3dNode, failedReason, args), qui termine sans doute la mise en place du système une fois le fichier chargé. NON VÉRIFIÉ. |
| `ParticleUtil.loadParticleSystemFromNode(rootNode: integer, particleSystem: table, defaultEmittingState: boolean?, worldSpace: boolean?, forceFullLifespan: boolean?) → integer` | 144 | ✍ Initialise la table particleSystem à partir d'un nœud I3D déjà chargé. Usage vanilla (WorkParticles) : émission initiale désactivée et worldSpace=true, de sorte que les particules restent en coordonnées monde après leur émission. |
| `ParticleUtil.deleteParticleSystem(particleSystem: table)` | 193 | ✍ Supprime un système de particules chargé ; appelé dans les onDelete (WorkParticles:onDelete). |
| `ParticleUtil.deleteParticleSystems(particleSystems: table)` | 212 | ✍ Signature seule (pas de corps dans le dump du SDK) : supprime une liste de systèmes de particules ; appelée par Motorized:onDelete pour l'échappement. NON VÉRIFIÉ. |
| `ParticleUtil.setEmittingState(particleSystem: table, state: boolean, resetStartTimer: boolean?, resetStopTimer: boolean?)` | 226 | ✍ Active ou coupe l'émission d'un système. WorkParticles l'appelle à chaque tick avec l'état calculé ; les paramètres resetStartTimer/resetStopTimer ne sont pas utilisés dans ce cas. |
| `ParticleUtil.getParticleSystemAverageSpeed(particleSystem: table) → number` | 262 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, renvoie une vitesse moyenne des particules du système. Unité et calcul NON VÉRIFIÉS. |
| `ParticleUtil.setParticleSystemTimeScale(particleSystem: table, scale: number)` | 274 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, règle l'échelle de temps d'un système de particules. NON VÉRIFIÉ. |
| `ParticleUtil.setEmitCountScale(particleSystem: table, scale: number)` | 284 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, met à l'échelle le nombre de particules émises. Motorized l'appelle pour l'échappement avec le ratio de régime. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleLifespan(particleSystem: table, lifespan: number)` | 294 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe la durée de vie des particules (unité probablement ms, NON VÉRIFIÉ). |
| `ParticleUtil.addParticleSystemSimulationTime(particleSystem: table, simTime: number)` | 304 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, ajoute du temps de simulation au système (pour l'avancer comme s'il avait tourné). NON VÉRIFIÉ. |
| `ParticleUtil.setParticleStartStopTime(particleSystem: table, startTime: number, stopTime: number)` | 315 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe les instants de début et de fin de l'émission. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpeed(particleSystem: table) → number` | 326 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit la vitesse initiale des particules. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpeed(particleSystem: table, speed: number)` | 338 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe la vitesse initiale des particules. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpeedRandom(particleSystem: table) → number` | 348 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit la composante aléatoire de la vitesse des particules. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpeedRandom(particleSystem: table, speedRandom: number)` | 360 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe la composante aléatoire de la vitesse des particules. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemNormalSpeed(particleSystem: table) → number` | 370 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit la vitesse selon la normale de l'émetteur. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemNormalSpeed(particleSystem: table, normalSpeed: number)` | 382 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe la vitesse selon la normale de l'émetteur. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemTangentSpeed(particleSystem: table) → number` | 392 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit la vitesse tangentielle. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemTangentSpeed(particleSystem: table, tangentSpeed: number)` | 404 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe la vitesse tangentielle. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpriteScaleX(particleSystem: table) → number` | 414 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit l'échelle du sprite sur X. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpriteScaleX(particleSystem: table, spriteScaleX: number)` | 426 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe l'échelle du sprite sur X. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpriteScaleY(particleSystem: table) → number` | 436 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit l'échelle du sprite sur Y. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpriteScaleY(particleSystem: table, spriteScaleY: number)` | 448 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe l'échelle du sprite sur Y. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpriteScaleXGain(particleSystem: table) → number` | 458 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit le gain (variation au cours de la vie de la particule) de l'échelle X du sprite. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpriteScaleXGain(particleSystem: table, spriteScaleXGain: number)` | 470 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe le gain de l'échelle X du sprite. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemSpriteScaleYGain(particleSystem: table) → number` | 480 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit le gain de l'échelle Y du sprite. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemSpriteScaleYGain(particleSystem: table, spriteScaleYGain: number)` | 492 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe le gain de l'échelle Y du sprite. NON VÉRIFIÉ. |
| `ParticleUtil.getParticleSystemVelocityScale(particleSystem: table) → number` | 502 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, lit l'échelle de vélocité, c'est-à-dire la part de la vitesse de l'émetteur transmise aux particules. NON VÉRIFIÉ. |
| `ParticleUtil.setParticleSystemVelocityScale(particleSystem: table, velocityScale: number)` | 513 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, fixe l'échelle de vélocité, c'est-à-dire la part de la vitesse de l'émetteur transmise aux particules. NON VÉRIFIÉ. |
| `ParticleUtil.resetNumOfEmittedParticles(particleSystem: table)` | 522 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, remet à zéro le compteur de particules émises. NON VÉRIFIÉ. |
| `ParticleUtil.setEmitterShape(particleSystem: table, emitterShape: integer)` | 532 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, affecte la forme d'émission (id de nœud) du système. NON VÉRIFIÉ. |
| `ParticleUtil.initEmitterScale(particleSystem: table, scale: number)` | 553 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, initialise l'échelle de l'émetteur. NON VÉRIFIÉ. |
| `ParticleUtil.setMaxNumOfParticlesToEmitScale(particleSystem: table, scale: number)` | 571 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, met à l'échelle le nombre maximal de particules à émettre. NON VÉRIFIÉ. |
| `ParticleUtil.setMaterial(particleSystem: table, material: integer)` | 584 | ✍ Applique un matériau à un système. Usage vanilla : matériau de particule propre au type de remplissage (g_materialManager:getParticleMaterial). |
| `ParticleUtil.copyParticleSystem(xmlFile: XMLFile, key: string, particleSystem: table, emitterShape: integer) → table` | 597 | ✍ Duplique un système de référence (venant de g_particleSystemManager) et l'attache à emitterShape, avec des surcharges lues sous la clé XML ; renvoie la table du nouveau système (usage : WorkParticles:loadGroundParticleMapping). |
| `ParticleUtil.registerParticleXMLPaths(schema: XMLSchema, basePath: string, name: string)` | 660 | ✍ Signature seule (pas de corps dans le dump du SDK) : d'après son nom, enregistre dans un schéma XML les attributs d'un système de particules sous basePath/name. NON VÉRIFIÉ. |
| `ParticleUtil.registerParticleCopyXMLPaths(schema: XMLSchema, basePath: string)` | 680 | ✍ Enregistre dans un schéma XML les attributs acceptés par copyParticleSystem (appelé depuis WorkParticles.registerGroundParticleMappingXMLPaths). |
