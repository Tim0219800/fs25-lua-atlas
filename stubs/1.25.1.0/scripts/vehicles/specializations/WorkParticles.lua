---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkParticles.lua (stub généré, atlas Lua FS25)

--- Spécialisation véhicule qui gère trois familles d'effets de travail du sol, uniquement côté client (sur serveur pur, ses écouteurs onDelete/onUpdateTick/onDeactivate sont retirés dans onLoad) : (1) « particleAnimations », des maillages animés par shader (paramètre VertxoffsetVertexdeformMotionUVscale) dont la visibilité suit la profondeur de travail ; (2) « particles », de vrais systèmes de particules allumés ou éteints via ParticleUtil.setEmittingState ; (3) « effects », des effets EffectManager dont le type de remplissage vient de la zone de travail. La décision est prise à chaque onUpdateTick, pas à chaque frame. Conditions communes : getDoGroundManipulation() et véhicule sur un champ (sauf vehicle.workParticles#requireField=false). Aucune donnée météo ni humidité n'entre en jeu : seuls la vitesse, le sens de marche, le contact au sol et la profondeur comptent. Point d'extension : surcharger getDoGroundManipulation (fonction enregistrée) ou les écouteurs ; tout est purement visuel, sans synchronisation réseau.
---@class WorkParticles
WorkParticles = {}

--- Aucun prérequis : renvoie toujours true.
---@param specializations any
function WorkParticles.prerequisitesPresent(specializations) end

--- Enregistre dans Vehicle.xmlSchema les clés vehicle.workParticles.particleAnimation(?), .particle(?) et .effect(?) (avec speedThreshold, activeDirection, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn), #requireField (par défaut true) et l'attribut #depthNode des groundReferenceNode.
function WorkParticles.initSpecialization() end

--- Enregistre les attributs d'un nœud d'animation de sol : node, refNodeIndex, animMeshNode, ou bien materialType+materialId en l'absence de fichier externe, et maxDepth (par défaut -0.1 m).
---@param schema any
---@param key any
function WorkParticles.registerGroundAnimationMappingXMLPaths(schema, key) end

--- Enregistre les attributs d'un nœud de particules de sol : node, refNodeIndex, particleNode, ou bien particleType+fillType sans fichier, speedThreshold (par défaut 0.5) et movingDirection, plus les attributs de copie de ParticleUtil.
---@param schema any
---@param key any
function WorkParticles.registerGroundParticleMappingXMLPaths(schema, key) end

--- Expose au type de véhicule : getDoGroundManipulation, les chargeurs d'animations, particules et effets, et getFillTypeFromWorkAreaIndex.
---@param vehicleType any
function WorkParticles.registerFunctions(vehicleType) end

--- Surcharge loadGroundReferenceNode et updateGroundReferenceNode pour ajouter la mesure de profondeur, de déplacement et de sens au nœud de référence au sol.
---@param vehicleType any
function WorkParticles.registerOverwrittenFunctions(vehicleType) end

--- Écoute onLoad, onDelete, onUpdateTick et onDeactivate.
---@param vehicleType any
function WorkParticles.registerEventListeners(vehicleType) end

--- Côté client seulement : lit requireField puis charge en boucle chaque particleAnimation(i), particle(i) et effect(i) du XML du véhicule dans spec_workParticles. Sur une instance non cliente, retire les écouteurs devenus inutiles.
---@param savegame any
function WorkParticles:onLoad(savegame) end

--- Libère les I3D partagés (g_i3DManager:releaseSharedI3DFile), supprime les systèmes de particules (ParticleUtil.deleteParticleSystem) et les effets (g_effectManager:deleteEffects).
function WorkParticles:onDelete() end

--- Cœur de la spécialisation. Animations : profondeur normalisée = depth/maxWorkDepth, bornée entre 0 et 1, lissée selon la distance parcourue, et mise à 0 hors champ ; elle pilote la visibilité et le shader. Particules : émission si manipulation active, sur champ, nœud de référence actif, vitesse > speedThreshold et bon sens de marche. Effets : mêmes conditions, plus needsSetIsTurnedOn (l'outil ou son attelage doit être allumé), le contact au sol de la zone de travail et activeDirection ; le fillType est alors transmis à setEffectTypeInfo avant startEffects. Bascule binaire marche/arrêt, sans modulation d'intensité.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkParticles:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Renvoie true par défaut ; d'autres spécialisations ou mods peuvent la surcharger pour couper tous les effets de la spécialisation.
function WorkParticles:getDoGroundManipulation() end

--- Lit speedThreshold et les nœuds node(j), puis lance le chargement asynchrone de l'I3D externe (#file) via loadSubSharedI3DFile.
---@param xmlFile any
---@param key any
---@param animation any
---@param index any
function WorkParticles:loadGroundAnimations(xmlFile, key, animation, index) end

--- Rappel de chargement : attache chaque animNode à son nœud, le masque, puis supprime la racine I3D chargée.
---@param i3dNode any
---@param args any
function WorkParticles:onGroundAnimationI3DLoaded(i3dNode, args) end

--- Résout node, refNodeIndex et animMeshNode ; sans animMeshNode, applique au nœud le matériau de base materialType. Renvoie false (avec un avertissement XML) si une référence est invalide.
---@param xmlFile any
---@param key any
---@param mapping any
---@param index any
function WorkParticles:loadGroundAnimationMapping(xmlFile, key, mapping, index) end

--- Avec #file : chargement asynchrone de l'I3D partagé (g_i3DManager:loadSharedI3DFileAsync). Sinon, mappings construits directement depuis le gestionnaire de particules (particleType).
---@param xmlFile any
---@param key any
---@param particle any
---@param index any
function WorkParticles:loadGroundParticles(xmlFile, key, particle, index) end

--- Rappel : construit les mappings, attache les particleNode et crée les systèmes avec ParticleUtil.loadParticleSystemFromNode (émission initiale désactivée, espace monde activé).
---@param i3dNode any
---@param failedReason any
---@param args any
function WorkParticles:groundParticleI3DLoaded(i3dNode, failedReason, args) end

--- Sans fichier externe : récupère g_particleSystemManager:getParticleSystem(particleType), applique le matériau de particule du fillType s'il est connu, puis copie le système sur le nœud (ParticleUtil.copyParticleSystem). Lit speedThreshold (par défaut 0.5) et movingDirection.
---@param xmlFile any
---@param key any
---@param mapping any
---@param index any
---@param i3dNode any
function WorkParticles:loadGroundParticleMapping(xmlFile, key, mapping, index, i3dNode) end

--- Lit les paramètres de l'effet (speedThreshold 0.5, activeDirection 1, workAreaIndex, groundReferenceNodeIndex, needsSetIsTurnedOn false) et le charge avec g_effectManager:loadEffect.
---@param xmlFile any
---@param key any
---@param effect any
---@param index any
function WorkParticles:loadGroundEffects(xmlFile, key, effect, index) end

--- Type de remplissage de la zone de travail : workArea.fillType, à défaut une conversion depuis workArea.fruitType, sinon FillType.UNKNOWN. À noter : la conversion passe par getFruitTypeIndexByFillTypeIndex alors que l'argument est un fruitType ; le nom laisse penser que le sens de conversion est inversé (non vérifié en jeu).
---@param workAreaIndex any
function WorkParticles:getFillTypeFromWorkAreaIndex(workAreaIndex) end

--- Après la fonction d'origine, ajoute au nœud de référence au sol : depthNode, movedDistance, depth et movingDirection, initialisés à 0.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param groundReferenceNode any
function WorkParticles:loadGroundReferenceNode(superFunc, xmlFile, key, groundReferenceNode) end

--- Côté client, avec un depthNode : calcule le déplacement local depuis la dernière position, le sens de marche (seuil 0.0001 sur z local), la distance parcourue et la profondeur, soit la hauteur du nœud moins getTerrainHeightAtWorldPos (en mètres, négative quand le nœud est enfoncé).
---@param superFunc any
---@param groundReferenceNode any
---@param x any
---@param y any
---@param z any
---@param terrainHeight any
---@param densityHeight any
function WorkParticles:updateGroundReferenceNode(superFunc, groundReferenceNode, x, y, z, terrainHeight, densityHeight) end

--- Coupe toutes les émissions de particules et masque les animations quand le véhicule est désactivé.
function WorkParticles:onDeactivate() end
