---@meta
-- FS25 1.25.1.0 : materials/ParticleSystemManager.lua (stub généré, atlas Lua FS25)

--- Gestionnaire global des systèmes de particules « partagés » (g_particleSystemManager, dérive d'AbstractManager). Il conserve une liste de types de particules (noms) et, pour chaque type, une unique table particleSystem de référence, créée par MaterialUtil.onCreateParticleSystem à partir d'un nœud I3D d'un porte-particules (particle holder, absent du dump). Les effets copient ensuite ce système de référence (ParticleUtil.copyParticleSystem, dont le corps est absent du dump) ; l'usage exact de la copie est donc NON VÉRIFIÉ ici. Fonctionne sur chaque pair : rien n'est synchronisé en réseau.
--- 
--- TYPES VANILLA déclarés à loadMapData (ParticleSystemManager.lua:40-82), à garder en tête pour une réutilisation : unloading ; smoke, smoke_damping, smoke_chimney, smoke_train_main, smoke_train_side ; chopper, straw, cutter_chopper ; soil, soil_smoke, soil_chunks, soil_big_chunks, soil_harvesting ; spreader, spreader_smoke ; windrower, tedder, weeder ; crusher_wood, crusher_dust ; prepare_fruit ; cleaning_soil, cleaning_dust ; washer_water ; SPRAYERCANNON_MIST ; chainsaw_wood, chainsaw_dust ; pickup, pickup_falling ; sowing ; loading ; wheel_dust, wheel_dry, wheel_wet, wheel_snow ; bees ; horse_step_slow, horse_step_fast ; spraycan_paint ; HYDRAULIC_HAMMER, HYDRAULIC_HAMMER_DEBRIS ; STONE. Les noms sont mis en majuscules et la table globale ParticleType pointe vers nameToIndex. Ce fichier ne dit pas quelle machine utilise quel type (relations à chercher dans les spécialisations, ex. WorkParticles).
--- 
--- LIMITE : un seul système par type (pas de variante par type de remplissage dans ce gestionnaire ; la matière est gérée par MaterialManager:getParticleMaterial). Ajouter un système pour un type existant supprime le précédent (ParticleUtil.deleteParticleSystem) : un mod qui re-déclare un type remplace donc le système vanilla pour tous les usages.
--- 
--- POINTS D'EXTENSION : addParticleType pour de nouveaux types (avant le chargement du porte-particules), addParticleSystem, getParticleSystem. Le moment exact du chargement des porte-particules est NON VÉRIFIÉ (hors dump).
---@class ParticleSystemManager : AbstractManager
ParticleSystemManager = {}

--- Crée le gestionnaire.
---@param customMt any
---@return table
function ParticleSystemManager.new(customMt) end

--- Réinitialise les tables de noms, de types et de systèmes de particules.
function ParticleSystemManager:initDataStructures() end

--- Déclare les types de particules vanilla (liste dans le module), publie la table globale ParticleType et renvoie vrai.
---@return boolean
function ParticleSystemManager:loadMapData() end

--- Supprime chaque système de particules de référence (ParticleUtil.deleteParticleSystem) puis délègue à la classe parente.
function ParticleSystemManager:unloadMapData() end

--- Ajoute un type de particule (nom validé puis mis en majuscules) ; sans effet si déjà connu.
---@param name string
function ParticleSystemManager:addParticleType(name) end

--- Renvoie le nom normalisé (majuscules) s'il est déclaré, sinon nil.
---@param name string
---@return string
function ParticleSystemManager:getParticleSystemTypeByName(name) end

--- Associe un système de particules de référence à un type ; si un système existait déjà pour ce type, il est supprimé d'abord. À noter : le commentaire d'origine mentionne un indice de matériau et un identifiant qui n'existent pas dans la signature réelle (particleType, particleSystem).
---@param particleType string
---@param particleSystem integer
function ParticleSystemManager:addParticleSystem(particleType, particleSystem) end

--- Renvoie la table de référence du type demandé par nom, nil si le type est inconnu ou sans système. À noter : le commentaire d'origine évoque un type de remplissage, mais la fonction ne prend que le nom du type.
---@param particleTypeName string
---@return table
function ParticleSystemManager:getParticleSystem(particleTypeName) end
