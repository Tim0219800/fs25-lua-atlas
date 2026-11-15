---@meta
-- FS25 1.25.1.0 : materials/MotionPathEffectManager.lua (generated stub, FS25 Lua Atlas)

--- Gestionnaire des effets « motion path » définis par carte (g_motionPathEffectManager, dérive d'AbstractManager) : effets de végétation/terre à base de maillages animés par shader (coupe de la barre de coupe, chaumes, cultivateur, charrue, andaineur). Il ne crée pas les effets : il charge des définitions XML, des I3D partagés et des matériaux, puis fournit à la classe d'effet (MotionPathEffect et ses classes filles, absentes du dump) les maillages, matériaux et réglages de shader appropriés. Le comportement des classes d'effets est donc NON VÉRIFIÉ ici. Tourne sur chaque pair (client et serveur) ; aucun réseau.
--- 
--- CHARGEMENT. loadMapData lit, dans le XML de la carte, map.motionPathEffects.motionPathEffect(?)#filename (fichiers internes d'abord, donc prioritaires à la sélection) et map.motionPathEffects#filename (fichier externe qui énumère d'autres fichiers). Il refuse un nom de fichier I3D à cet endroit (il faut un XML d'effets). Chaque XML d'effets (schéma créé par createMotionPathEffectXMLSchema) contient motionPathEffects.motionPathEffect(?) avec : #effectClass (MotionPathEffect par défaut ; classe cherchée dans g_effectManager, puis avec le préfixe de l'environnement du mod, puis par ClassUtil.getClassObject), #effectType (mots séparés par des espaces, mis en majuscules, DEFAULT par défaut), #filename (I3D chargé en asynchrone et partagé), .typeDefinition (propre à la classe d'effet), .effectMeshes.effectMesh(?) (#node, #rowLength 30, #numRows 12, #skipPositions, #numVariations 1), .effectMaterials.effectMaterial(?) (nœud, LOD, textures personnalisées diffuse/normale/spéculaire) et des réglages de shader (variation, cartes personnalisées, paramètres). Une fois l'I3D chargé (motionPathEffectI3DFileLoaded), les nœuds retenus sont détachés, l'I3D racine supprimé, et l'effet indexé par type (effectsByType, liste effects).
--- 
--- SÉLECTION ET APPLICATION. Un effet de véhicule demande un effet partagé (getSharedMotionPathEffect) puis le maillage (getMotionPathEffectMesh) et le matériau (getMotionPathEffectMaterial) par appariement fait par l'objet d'effet lui-même (getIsSharedEffectMatching / getIsEffectMeshMatching / getIsEffectMaterialMatching, avec un second passage « alternatives » si rien ne correspond). applyEffectConfiguration applique à chaque clone les réglages de shader (cartes, variation, paramètres), fixe les cartes « shapeArray » et « animationArray » depuis une texture et calcule la vitesse d'animation : valeur forcée sinon matériau, sinon maillage, sinon effet partagé, sinon 0.5. Les paramètres shader s'appliquent par setShaderParameterRecursive. La vitesse est une échelle d'animation ; aucun dt n'intervient dans ce fichier.
--- 
--- POINTS D'EXTENSION. Un mod peut déclarer ses effets par le XML de carte/mod (effectClass d'un mod accepté avec préfixe d'environnement) ; la liste modMotionPathEffectsToLoad est initialisée mais jamais utilisée dans ce fichier (à noter, non vérifié en jeu).
---@class MotionPathEffectManager : AbstractManager
MotionPathEffectManager = {}

--- Crée le gestionnaire.
---@param customMt any
---@return table
function MotionPathEffectManager.new(customMt) end

--- Initialise les listes de XML ouverts, d'identifiants de chargement partagé, d'effets par type, d'effets et d'effets de mods (cette dernière liste n'est pas utilisée ailleurs dans ce fichier).
function MotionPathEffectManager:initDataStructures() end

--- Mémorise le répertoire de base, déduit l'environnement de mod, charge les effets déclarés dans le XML de la carte puis ceux d'un éventuel fichier externe. Renvoie vrai.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function MotionPathEffectManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Ouvre un XML externe contenant la liste d'effets (clé motionPathEffects.motionPathEffect) et la charge, puis ferme le fichier.
---@param filename string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffectsFromExternalFile(filename, baseDirectory, customEnvironment) end

--- Parcourt une liste de clés motionPathEffect dans un XML ; pour chacune lit #filename et charge le XML d'effets associé. S'arrête avec une erreur XML si le nom désigne un .i3d.
---@param xmlFileHandle integer
---@param key string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffects(xmlFileHandle, key, baseDirectory, customEnvironment) end

--- Charge un XML d'effets, instancie les définitions, résout la classe d'effet, lit types, typeDefinition (par la classe d'effet) et lance le chargement asynchrone de l'I3D partagé de chaque effet. Compte les références pour fermer le XML une fois tous les I3D reçus.
---@param filename string
---@param baseDirectory string
---@param customEnvironment string?
function MotionPathEffectManager:loadMotionPathEffectsXML(filename, baseDirectory, customEnvironment) end

--- Rappel de chargement de l'I3D : crée les maillages (rowLength, numRows, skipPositions, numVariations, réglages shader, données de classe d'effet) et les matériaux (LOD, textures personnalisées, réglages shader), détache les nœuds, indexe l'effet par type, supprime l'I3D racine et libère le XML au dernier retour. À noter : pour la normal map personnalisée, l'appel setMaterialNormalMapFromFile reçoit le chemin customDiffuse au lieu de customNormal (lignes 277-278) ; apparent défaut, non vérifié en jeu.
---@param i3dNode any
---@param failedReason any
---@param args any
function MotionPathEffectManager:motionPathEffectI3DFileLoaded(i3dNode, failedReason, args) end

--- Lit les réglages de shader d'une entité : nom de variation, cartes personnalisées (nom, fichier, texture créée par createMaterialTextureFromFile) et paramètres (nom, vecteur de 4 valeurs, 0 0 0 0 par défaut). À noter : les appels pour maillages et matériaux ne passent pas de répertoire de base (le chemin est résolu par Utils.getFilename avec baseDirectory nil ; effet NON VÉRIFIÉ).
---@param target table
---@param xmlFile table
---@param key string
---@param baseDirectory any
function MotionPathEffectManager:loadCustomShaderSettingsFromXML(target, xmlFile, key, baseDirectory) end

--- Supprime les nœuds de maillages et de matériaux encore existants, les textures de cartes personnalisées, libère les I3D partagés, ferme les XML en attente puis délègue à la classe parente.
function MotionPathEffectManager:unloadMapData() end

--- Supprime les textures de cartes personnalisées d'une entité si elles existent encore.
---@param entity any
function MotionPathEffectManager:deleteCustomShaderMaps(entity) end

--- Renvoie le premier effet dont l'objet d'effet demandeur accepte la correspondance stricte, sinon la première correspondance « alternative » ; nil si rien.
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getSharedMotionPathEffect(motionPathEffectObject) end

--- Renvoie le maillage d'effet qui correspond (passe stricte puis alternative), nil sinon.
---@param sharedEffect table
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getMotionPathEffectMesh(sharedEffect, motionPathEffectObject) end

--- Renvoie le matériau d'effet qui correspond (passe stricte puis alternative), nil sinon.
---@param sharedEffect table
---@param motionPathEffectObject table
---@return table
function MotionPathEffectManager:getMotionPathEffectMaterial(sharedEffect, motionPathEffectObject) end

--- Applique aux nœuds clonés les réglages de shader de l'effet, du maillage et du matériau, puis les cartes « shapeArray » et « animationArray » (texture donnée) ; renvoie l'échelle de vitesse (forcée, sinon matériau, maillage, effet, 0.5 par défaut). Sans effet partagé ni clones, renvoie la valeur forcée ou 1.
---@param sharedEffect table
---@param effectMesh table
---@param effectMaterial array
---@param clonedNodes array
---@param textureEntityId integer
---@param overwrittenSpeedScale number
function MotionPathEffectManager:applyEffectConfiguration(sharedEffect, effectMesh, effectMaterial, clonedNodes, textureEntityId, overwrittenSpeedScale) end

--- Applique à un nœud les cartes, la variation de shader et les paramètres vectoriels d'une cible (setShaderParameterRecursive).
---@param node any
---@param target any
function MotionPathEffectManager:applyShaderSettingsParameters(node, target) end

--- Lit un paramètre de shader sur le nœud (ou son premier enfant forme) ; renvoie quatre zéros si aucune forme n'est trouvée.
---@param node integer
---@param name string
---@return number
---@return number
---@return number
---@return number
function MotionPathEffectManager:getEffectShaderParameter(node, name) end

--- Applique une variation de shader au matériau du nœud et de tous ses enfants formes (LOD), en remplaçant le matériau si un nouveau est créé.
---@param node integer
---@param variation string
function MotionPathEffectManager:setEffectCustomShaderVariation(node, variation) end

--- Applique une carte personnalisée au matériau de l'emplacement 0 du nœud ; remplace le matériau si nécessaire.
---@param node integer
---@param name string
---@param textureEntityId integer
function MotionPathEffectManager:setEffectCustomMapOnNode(node, name, textureEntityId) end

--- Applique une carte personnalisée au nœud et à ses enfants formes (LOD).
---@param node integer
---@param name string
---@param textureEntityId integer
function MotionPathEffectManager:setEffectCustomMap(node, name, textureEntityId) end

--- Affecte le matériau d'effet à un nœud et à ses enfants (matériau spécifique par LOD si défini, à partir du deuxième enfant).
---@param node integer
---@param material integer
function MotionPathEffectManager:setEffectMaterial(node, material) end

--- Construit une fois le schéma XML des effets (clés génériques plus celles des classes MotionPathEffect, TypedMotionPathEffect, CutterMotionPathEffect, CultivatorMotionPathEffect, PlowMotionPathEffect, WindrowerMotionPathEffect) ; plusieurs clés ne servent qu'aux scripts de génération hors jeu.
function MotionPathEffectManager.createMotionPathEffectXMLSchema() end

--- Enregistre les clés de réglages de shader : variation (#name), paramètres (#name, #value) et cartes (#name, #filename).
---@param schema any
---@param basePath any
function MotionPathEffectManager.registerCustomShaderSettingXMLPaths(schema, basePath) end
