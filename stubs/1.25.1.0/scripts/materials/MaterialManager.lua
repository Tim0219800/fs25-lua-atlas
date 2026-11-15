---@meta
-- FS25 1.25.1.0 : materials/MaterialManager.lua (stub généré, atlas Lua FS25)

--- Gestionnaire global des matériaux (g_materialManager, dérive d'AbstractManager). Il tient cinq registres : (1) types de matériau (liste de noms), (2) matériaux de base par nom, (3) matériaux par type de remplissage (self.materials), (4) matériaux de particules par type de remplissage (self.particleMaterials), (5) polices (FontMaterial). Les matériaux ne sont pas créés ici : ils sont enregistrés par des rappels « onCreate » de MaterialUtil lors du chargement des I3D « porte-matériaux » (material holders) ; ces I3D et le fichier XML des polices (MaterialManager.DEFAULT_FONT_MATERIAL_XML, constante absente du dump) ne sont pas dans le dump.
--- 
--- CLÉ DE RECHERCHE. Un matériau se retrouve par (fillTypeIndex, nom de type de matériau, indice). Types déclarés à loadMapData (MaterialManager.lua:60-78) : fillplane, icon, unloading, smoke, straw, chopper, soil, sprayer, sprayerCannonSolid, sprayerCannonBillboard, spreader, pipe, mower, belt, belt_cropDirt, belt_cropClean, leveler, washer, pickup. Les noms sont stockés en majuscules ; la table globale MaterialType pointe vers nameToIndex. Pour ajouter un type propre à un mod : addMaterialType (avant le chargement des porte-matériaux).
--- 
--- USAGE EFFETS. getParticleMaterial(fillType, type, indice) fournit le matériau à appliquer à un système de particules selon la matière (ex. grain, terre), via ParticleUtil.setMaterial dans WorkParticles ; getMaterial sert aux autres usages (ex. surfaces de remplissage, tapis, convoyeurs). Les deux renvoient nil si le type de remplissage, le type de matériau ou l'indice n'existe pas, sans journal (les avertissements sont dans des lignes marquées #debug, ignorées en production). Les matériaux déclarés plusieurs fois pour la même clé sont écrasés, avec un avertissement développeur seulement si g_showDevelopmentWarnings.
--- 
--- PARTAGE ET CHARGEMENT. Les porte-matériaux de mods sont mis en file par addModMaterialHolder (nom de fichier = clé : pas de doublon) puis chargés par loadModMaterialHolders en asynchrone (g_i3DManager:loadI3DFileAsync) ; au retour, chaque enfant est détaché de l'arbre et conservé dans loadedMaterialHolderNodes pour que les matériaux restent valides jusqu'à unloadMapData, qui supprime ces nœuds. Aucune des données n'est synchronisée en réseau : le chargement a lieu sur chaque pair (client, serveur) ; l'appelant est probablement l'ensemble mission/mods (NON VÉRIFIÉ : appelant absent du dump).
--- 
--- POINTS D'EXTENSION. Pas de registerFunction ni d'événement : un mod peut appeler g_materialManager:addMaterialType, addParticleMaterial, addBaseMaterial, addModMaterialHolder ou lire les tables. Ces appels doivent précéder la fin du chargement de la carte ; ce moment exact (loadModMaterialHolders) est NON VÉRIFIÉ ici.
---@class MaterialManager : AbstractManager
MaterialManager = {}

--- Crée le gestionnaire et prépare le schéma XML des polices (FontMaterial.registerXMLPaths).
---@param customMt any
---@return MaterialManager
function MaterialManager.new(customMt) end

--- Réinitialise tous les registres : noms, types, matériaux, matériaux de particules, polices, matériaux de base, porte-matériaux de mods et nœuds chargés.
function MaterialManager:initDataStructures() end

--- Déclare les dix-neuf types de matériau vanilla, publie la table globale MaterialType, mémorise le rappel de fin de chargement puis lance le chargement du XML de polices par défaut. Renvoie vrai.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@param finishedLoadingCallback any
---@param callbackTarget any
---@return boolean
function MaterialManager:loadMapData(xmlFile, missionInfo, baseDirectory, finishedLoadingCallback, callbackTarget) end

--- Supprime les nœuds porte-matériaux, le XML courant, les polices (nœuds, matériaux, shared I3D) puis délègue à la classe parente.
function MaterialManager:unloadMapData() end

--- Ajoute un type de matériau (nom en majuscules) après validation du nom ; sans effet si déjà connu.
---@param name string
function MaterialManager:addMaterialType(name) end

--- Renvoie le nom normalisé (majuscules) du type s'il existe, sinon nil.
---@param name string
---@return string
function MaterialManager:getMaterialTypeByName(name) end

--- Enregistre un matériau de base sous son nom (majuscules) et dans la liste des matériaux de base.
---@param materialName string
---@param materialId integer
function MaterialManager:addBaseMaterial(materialName, materialId) end

--- Renvoie l'identifiant du matériau de base par nom (insensible à la casse), nil si absent.
---@param materialName string
---@return integer
function MaterialManager:getBaseMaterialByName(materialName) end

--- Enregistre un matériau pour un type de remplissage, un type de matériau et un indice, dans le registre des matériaux.
---@param fillTypeIndex integer
---@param materialType string
---@param materialIndex integer
---@param materialId integer
function MaterialManager:addMaterial(fillTypeIndex, materialType, materialIndex, materialId) end

--- Même chose, dans le registre des matériaux de particules.
---@param fillTypeIndex integer
---@param materialType string
---@param materialIndex integer
---@param materialId integer
function MaterialManager:addParticleMaterial(fillTypeIndex, materialType, materialIndex, materialId) end

--- Insère le matériau dans la table cible, à trois niveaux (remplissage, type, indice). Ignore l'appel si un argument vaut nil. L'écrasement d'un matériau existant n'est signalé que par un avertissement développeur.
---@param target table
---@param fillTypeIndex integer
---@param materialType string
---@param materialIndex integer
---@param materialId integer
function MaterialManager:addMaterialToTarget(target, fillTypeIndex, materialType, materialIndex, materialId) end

--- Renvoie le matériau pour (type de remplissage, type de matériau, indice), nil sinon.
---@param fillType integer
---@param materialTypeName string
---@param materialIndex integer
---@return integer
function MaterialManager:getMaterial(fillType, materialTypeName, materialIndex) end

--- Renvoie le matériau de particules pour (type de remplissage, type de matériau, indice), nil sinon ; c'est la fonction utilisée pour habiller les particules selon la matière.
---@param fillType integer
---@param materialTypeName string
---@param materialIndex integer
---@return integer
function MaterialManager:getParticleMaterial(fillType, materialTypeName, materialIndex) end

--- Recherche générique dans une table cible : valide le nom du type, puis descend dans type de remplissage, type de matériau et indice ; renvoie nil dès qu'un niveau manque ou qu'un argument est nil.
---@param target integer
---@param fillType integer
---@param materialTypeName string
---@param materialIndex integer
---@return integer
function MaterialManager:getMaterialFromTarget(target, fillType, materialTypeName, materialIndex) end

--- Met en file un fichier I3D porte-matériaux fourni par un mod (clé = nom de fichier, donc dédoublonné).
---@param filename any
function MaterialManager:addModMaterialHolder(filename) end

--- Lance le chargement asynchrone de tous les porte-matériaux de mods en file ; le rappel est materialHolderLoaded.
function MaterialManager:loadModMaterialHolders() end

--- Rappel de chargement : détache chaque enfant de l'I3D chargé, le garde dans loadedMaterialHolderNodes, puis supprime l'I3D racine. Aucun traitement en cas d'échec (identifiant 0).
---@param i3dNode any
---@param failedReason any
---@param args any
function MaterialManager:materialHolderLoaded(i3dNode, failedReason, args) end

--- Renvoie la police par nom ; essaie d'abord le nom préfixé par l'environnement du mod (« mod.nom »), puis le nom brut.
---@param materialName any
---@param customEnvironment any
function MaterialManager:getFontMaterial(materialName, customEnvironment) end

--- Charge un XML de polices en asynchrone avec un compteur de références ; à la fin du dernier chargement, supprime le XML et appelle le rappel de fin enregistré par loadMapData. S'il n'y a aucune police, le rappel est appelé immédiatement.
---@param xmlFilename any
---@param customEnvironment any
---@param baseDirectory any
function MaterialManager:loadFontMaterialsXML(xmlFilename, customEnvironment, baseDirectory) end
