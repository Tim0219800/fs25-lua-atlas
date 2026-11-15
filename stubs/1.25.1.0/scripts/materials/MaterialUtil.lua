---@meta
-- FS25 1.25.1.0 : materials/MaterialUtil.lua (stub généré, atlas Lua FS25)

--- Fonctions utilitaires liées aux matériaux. Les quatre fonctions « onCreate » sont des rappels destinés à être déclarés dans un I3D (attribut onCreate du nœud, résolu par nom de fonction globale) : ils lisent les attributs utilisateur du nœud (getUserAttribute) et enregistrent le résultat dans g_materialManager ou g_particleSystemManager. Elles s'exécutent donc au chargement des I3D porte-matériaux et porte-particules (absents du dump), sur chaque pair.
--- 
--- ATTRIBUTS UTILISATEUR LUS. Matériau de base : materialName. Matériau par matière : fillType (nom de type de remplissage, via g_fillTypeManager), materialType (doit exister dans MaterialManager) et materialIndex (entier, 1 par défaut). Système de particules : particleType (obligatoire, doit exister dans ParticleSystemManager), defaultEmittingState (faux par défaut), worldSpace (vrai par défaut), forceFullLifespan (faux par défaut). Le matériau retenu est toujours celui de l'emplacement 0 du nœud (getMaterial(id, 0)). Pour un mod : placer ces attributs et ces onCreate dans son I3D est la voie vanilla pour déclarer matériaux et particules, sous réserve d'être chargé par addModMaterialHolder pour les matériaux (le chemin équivalent pour les particules n'est pas dans ce fichier : NON VÉRIFIÉ).
--- 
--- GESTION D'ERREUR : tous les cas invalides sont signalés par Logging.i3dWarning avec le nœud, puis l'appel est abandonné sans exception ; onCreateParticleSystem affiche aussi la liste des types disponibles. Les corps de ParticleUtil.loadParticleSystemFromNode et de getUserAttribute sont absents du dump : la manière dont defaultEmittingState, worldSpace et forceFullLifespan sont appliqués est NON VÉRIFIÉE ici.
---@class MaterialUtil
MaterialUtil = {}

--- Rappel de porte-matériaux : lit l'attribut materialName du nœud et enregistre le matériau d'emplacement 0 comme matériau de base (g_materialManager:addBaseMaterial) ; avertit si l'attribut manque.
---@param _ any
---@param id integer
function MaterialUtil.onCreateBaseMaterial(_, id) end

--- Valide les attributs fillType, materialType et materialIndex d'un nœud et renvoie, en cas de succès, vrai puis l'indice du type de remplissage, le nom de type de matériau et l'indice (1 par défaut). Renvoie faux avec avertissement I3D si un attribut manque, si le type de remplissage ou de matériau est inconnu, ou si l'indice n'est pas numérique.
---@param node integer
---@param sourceFuncName string
---@return boolean
---@return integer
---@return integer
---@return integer
function MaterialUtil.validateMaterialAttributes(node, sourceFuncName) end

--- Rappel de porte-matériaux : après validation, enregistre le matériau d'emplacement 0 dans le registre des matériaux (g_materialManager:addMaterial).
---@param _ any
---@param id integer
function MaterialUtil.onCreateMaterial(_, id) end

--- Rappel de porte-matériaux : après validation, enregistre le matériau d'emplacement 0 dans le registre des matériaux de particules (g_materialManager:addParticleMaterial).
---@param _ any
---@param id integer
function MaterialUtil.onCreateParticleMaterial(_, id) end

--- Rappel de porte-particules : lit particleType, defaultEmittingState, worldSpace et forceFullLifespan, construit un système de particules depuis le nœud (ParticleUtil.loadParticleSystemFromNode) et l'enregistre comme système de référence du type (g_particleSystemManager:addParticleSystem), en remplaçant tout système déjà déclaré pour ce type.
---@param _ any
---@param id integer
function MaterialUtil.onCreateParticleSystem(_, id) end

--- Cherche, récursivement dans le nœud puis ses enfants, le premier matériau dont le nom d'emplacement (getMaterialSlotName) vaut le nom demandé ; ne regarde que les formes (ClassIds.SHAPE) ; renvoie son identifiant ou nil.
---@param node any
---@param materialName any
function MaterialUtil.getMaterialBySlotName(node, materialName) end
