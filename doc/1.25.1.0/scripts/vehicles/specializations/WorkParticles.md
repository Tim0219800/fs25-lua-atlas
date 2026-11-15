# vehicles/specializations/WorkParticles.lua

Source: `dataS/scripts/vehicles/specializations/WorkParticles.lua` — FS25 1.25.1.0

✍ Spécialisation véhicule qui gère trois familles d'effets de travail du sol, uniquement côté client (sur serveur pur, ses écouteurs onDelete/onUpdateTick/onDeactivate sont retirés dans onLoad) : (1) « particleAnimations », des maillages animés par shader (paramètre VertxoffsetVertexdeformMotionUVscale) dont la visibilité suit la profondeur de travail ; (2) « particles », de vrais systèmes de particules allumés ou éteints via ParticleUtil.setEmittingState ; (3) « effects », des effets EffectManager dont le type de remplissage vient de la zone de travail. La décision est prise à chaque onUpdateTick, pas à chaque frame. Conditions communes : getDoGroundManipulation() et véhicule sur un champ (sauf vehicle.workParticles#requireField=false). Aucune donnée météo ni humidité n'entre en jeu : seuls la vitesse, le sens de marche, le contact au sol et la profondeur comptent. Point d'extension : surcharger getDoGroundManipulation (fonction enregistrée) ou les écouteurs ; tout est purement visuel, sans synchronisation réseau.

- **WorkParticles** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `WorkParticles.prerequisitesPresent(specializations: any)` | 17 | ✍ Aucun prérequis : renvoie toujours true. |
| `WorkParticles.initSpecialization()` | 23 | ✍ Enregistre dans Vehicle.xmlSchema les clés vehicle.workParticles.particleAnimation(?), .particle(?) et .effect(?) (avec speedThreshold, activeDirection, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn), #requireField (par défaut true) et l'attribut #depthNode des groundReferenceNode. |
| `WorkParticles.registerGroundAnimationMappingXMLPaths(schema: any, key: any)` | 50 | ✍ Enregistre les attributs d'un nœud d'animation de sol : node, refNodeIndex, animMeshNode, ou bien materialType+materialId en l'absence de fichier externe, et maxDepth (par défaut -0.1 m). |
| `WorkParticles.registerGroundParticleMappingXMLPaths(schema: any, key: any)` | 63 | ✍ Enregistre les attributs d'un nœud de particules de sol : node, refNodeIndex, particleNode, ou bien particleType+fillType sans fichier, speedThreshold (par défaut 0.5) et movingDirection, plus les attributs de copie de ParticleUtil. |
| `WorkParticles.registerFunctions(vehicleType: any)` | 79 | ✍ Expose au type de véhicule : getDoGroundManipulation, les chargeurs d'animations, particules et effets, et getFillTypeFromWorkAreaIndex. |
| `WorkParticles.registerOverwrittenFunctions(vehicleType: any)` | 93 | ✍ Surcharge loadGroundReferenceNode et updateGroundReferenceNode pour ajouter la mesure de profondeur, de déplacement et de sens au nœud de référence au sol. |
| `WorkParticles.registerEventListeners(vehicleType: any)` | 100 | ✍ Écoute onLoad, onDelete, onUpdateTick et onDeactivate. |
| `WorkParticles:onLoad(savegame: any)` | 109 | ✍ Côté client seulement : lit requireField puis charge en boucle chaque particleAnimation(i), particle(i) et effect(i) du XML du véhicule dans spec_workParticles. Sur une instance non cliente, retire les écouteurs devenus inutiles. |
| `WorkParticles:onDelete()` | 176 | ✍ Libère les I3D partagés (g_i3DManager:releaseSharedI3DFile), supprime les systèmes de particules (ParticleUtil.deleteParticleSystem) et les effets (g_effectManager:deleteEffects). |
| `WorkParticles:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 211 | ✍ Cœur de la spécialisation. Animations : profondeur normalisée = depth/maxWorkDepth, bornée entre 0 et 1, lissée selon la distance parcourue, et mise à 0 hors champ ; elle pilote la visibilité et le shader. Particules : émission si manipulation active, sur champ, nœud de référence actif, vitesse > speedThreshold et bon sens de marche. Effets : mêmes conditions, plus needsSetIsTurnedOn (l'outil ou son attelage doit être allumé), le contact au sol de la zone de travail et activeDirection ; le fillType est alors transmis à setEffectTypeInfo avant startEffects. Bascule binaire marche/arrêt, sans modulation d'intensité. |
| `WorkParticles:getDoGroundManipulation()` | 311 | ✍ Renvoie true par défaut ; d'autres spécialisations ou mods peuvent la surcharger pour couper tous les effets de la spécialisation. |
| `WorkParticles:loadGroundAnimations(xmlFile: any, key: any, animation: any, index: any)` | 317 | ✍ Lit speedThreshold et les nœuds node(j), puis lance le chargement asynchrone de l'I3D externe (#file) via loadSubSharedI3DFile. |
| `WorkParticles:onGroundAnimationI3DLoaded(i3dNode: any, args: any)` | 350 | ✍ Rappel de chargement : attache chaque animNode à son nœud, le masque, puis supprime la racine I3D chargée. |
| `WorkParticles:loadGroundAnimationMapping(xmlFile: any, key: any, mapping: any, index: any)` | 366 | ✍ Résout node, refNodeIndex et animMeshNode ; sans animMeshNode, applique au nœud le matériau de base materialType. Renvoie false (avec un avertissement XML) si une référence est invalide. |
| `WorkParticles:loadGroundParticles(xmlFile: any, key: any, particle: any, index: any)` | 422 | ✍ Avec #file : chargement asynchrone de l'I3D partagé (g_i3DManager:loadSharedI3DFileAsync). Sinon, mappings construits directement depuis le gestionnaire de particules (particleType). |
| `WorkParticles:groundParticleI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 456 | ✍ Rappel : construit les mappings, attache les particleNode et crée les systèmes avec ParticleUtil.loadParticleSystemFromNode (émission initiale désactivée, espace monde activé). |
| `WorkParticles:loadGroundParticleMapping(xmlFile: any, key: any, mapping: any, index: any, i3dNode: any)` | 490 | ✍ Sans fichier externe : récupère g_particleSystemManager:getParticleSystem(particleType), applique le matériau de particule du fillType s'il est connu, puis copie le système sur le nœud (ParticleUtil.copyParticleSystem). Lit speedThreshold (par défaut 0.5) et movingDirection. |
| `WorkParticles:loadGroundEffects(xmlFile: any, key: any, effect: any, index: any)` | 554 | ✍ Lit les paramètres de l'effet (speedThreshold 0.5, activeDirection 1, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn false) et le charge avec g_effectManager:loadEffect. |
| `WorkParticles:getFillTypeFromWorkAreaIndex(workAreaIndex: any)` | 567 | ✍ Type de remplissage de la zone de travail : workArea.fillType, à défaut une conversion depuis workArea.fruitType, sinon FillType.UNKNOWN. À noter : la conversion passe par getFruitTypeIndexByFillTypeIndex alors que l'argument est un fruitType ; le nom laisse penser que le sens de conversion est inversé (non vérifié en jeu). |
| `WorkParticles:loadGroundReferenceNode(superFunc: any, xmlFile: any, key: any, groundReferenceNode: any)` | 582 | ✍ Après la fonction d'origine, ajoute au nœud de référence au sol : depthNode, movedDistance, depth et movingDirection, initialisés à 0. |
| `WorkParticles:updateGroundReferenceNode(superFunc: any, groundReferenceNode: any, x: any, y: any, z: any, terrainHeight: any, densityHeight: any)` | 597 | ✍ Côté client, avec un depthNode : calcule le déplacement local depuis la dernière position, le sens de marche (seuil 0.0001 sur z local), la distance parcourue et la profondeur, soit la hauteur du nœud moins getTerrainHeightAtWorldPos (en mètres, négative quand le nœud est enfoncé). |
| `WorkParticles:onDeactivate()` | 621 | ✍ Coupe toutes les émissions de particules et masque les animations quand le véhicule est désactivé. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getDoGroundManipulation` | 80 |
| registerFunction | `loadGroundAnimations` | 81 |
| registerFunction | `onGroundAnimationI3DLoaded` | 82 |
| registerFunction | `loadGroundAnimationMapping` | 83 |
| registerFunction | `loadGroundParticles` | 84 |
| registerFunction | `groundParticleI3DLoaded` | 85 |
| registerFunction | `loadGroundParticleMapping` | 86 |
| registerFunction | `loadGroundEffects` | 87 |
| registerFunction | `getFillTypeFromWorkAreaIndex` | 88 |
| registerOverwrittenFunction | `loadGroundReferenceNode` | 94 |
| registerOverwrittenFunction | `updateGroundReferenceNode` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onUpdateTick` | 103 |
| registerEventListener | `onDeactivate` | 104 |
