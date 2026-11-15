---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Weeder.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des bineuses / herses étrilles (désherbage), avec option binage (isHoe) et option prairie (isGrasslandWeeder). Pas de chargement d'effets EffectManager ; l'originalité côté visuel est la coloration des particules de sol : pour chaque correspondance de particules de sol déclarée avec adjustColor (clé XML sur le noeud de WorkParticles), onUpdateTick recolore le shader de ce système de particules. TRAVAIL : processWeederArea (serveur, ou client à distance <= Weeder.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ) appelle FSDensityMapUtil.updateWeederArea (carte des mauvaises herbes ; corps absent du dump, NON VÉRIFIÉ) et, en mode prairie, updateGrassRollerArea ; isWorking = vitesse > 0.5. getStoneArea est lu pour l'usure (pierres). CONDITIONS de zone : getIsWorkAreaActive exige le contact sol du noeud de référence (si requiresGroundContact) et, si disableBackwards, movingDirection > 0 ; l'état abaissé n'est pas testé ici (la limite de vitesse suit getIsImplementChainLowered). À noter : startActivationTime est armé à l'attelage (2000 ms) mais n'est jamais consulté dans ce fichier (non vérifié en jeu : peut-être sans effet). COLORATION (onUpdateTick, client et serveur, tant que isWorking) : la couleur de base est lue à la position monde du noeud : sur un champ, getFieldGroundTyreTrackColor(densityBits) du fieldGroundSystem (couleur de trace de pneu du type de sol), sinon getTerrainAttributesAtWorldPos (couleur d'attribut de terrain) ; une transition lissée sur 1 s (alpha += dt/1000, interpolation vector3ArrayLerp) puis setShaderParameter psColor (alpha final 1). Le paramètre psColor du shader de particules n'est pas vérifiable dans le dump. À noter : la condition de relance de transition (lignes 144-147) compare les composantes par ET logique de différences, ce qui ne se déclenche que si les trois canaux changent à la fois (non vérifié en jeu). MÉTÉO/HUMIDITÉ : aucune donnée lue ; la couleur du sol est celle des cartes de terrain, donc indirectement liée à ce qu'elles encodent (pas relu). RÉSEAU : aucun flux ni dirtyFlag ; la coloration et l'état isWorking sont recalculés localement par chaque client. dt : utilisé pour la transition de couleur (secondes = dt/1000). POINTS D'EXTENSION : fonctions processWeederArea, updateWeederAIRequirements ; surcharges doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type WEEDER), getIsWorkAreaActive, loadGroundParticleMapping (ajoute adjustColor). Les particules de sol elles-mêmes sont chargées/pilotées par WorkParticles (WorkParticles.lua:238 : actif si getDoGroundManipulation() et sur champ ; Weeder ne surcharge pas getDoGroundManipulation, donc la valeur par défaut vrai de WorkParticles.lua:311 s'applique). Vitesse limite par défaut : 15.
---@class Weeder
Weeder = {}

--- Déclare le type de zone de travail weeder, le schéma XML (sons de travail, vehicle.weeder#isHoe, #isGrasslandWeeder) et ajoute à la table de correspondance de WorkParticles la clé adjustColor.
function Weeder.initSpecialization() end

--- Exige WorkArea et AttacherJoints.
---@param specializations table
---@return boolean
function Weeder.prerequisitesPresent(specializations) end

--- Enregistre processWeederArea et updateWeederAIRequirements.
---@param vehicleType any
function Weeder.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive et loadGroundParticleMapping.
---@param vehicleType any
function Weeder.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onDelete, onUpdateTick, onDeactivate, onPostAttach, onStartWorkAreaProcessing, onEndWorkAreaProcessing et onStateChange.
---@param vehicleType any
function Weeder.registerEventListeners(vehicleType) end

--- Charge les sons (client), lit isHoe et isGrasslandWeeder, initialise les accumulateurs de surface, le délai d'activation et les données de multiplicateur d'usure liées aux pierres (type WEEDER du stoneSystem), puis les besoins IA.
---@param savegame table
function Weeder:onLoad(savegame) end

--- Libère les sons de travail s'ils existent.
function Weeder:onDelete() end

--- Si l'outil travaille et possède des particules à couleur ajustable : relit la couleur du sol sous chaque noeud (couleur de trace de pneu si champ, attribut de terrain sinon), fait une transition de 1 s et l'envoie au paramètre de shader psColor du système de particules. Exécuté sur tout participant qui a ces particules (client ou hôte). Aucune lecture météo.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Weeder:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Applique le désherbage (et le rouleau prairie si isGrasslandWeeder) à la carte de densité, cumule les surfaces, met isWorking (vitesse > 0.5) et lit la présence de pierres si l'outil travaille. Renvoie la surface deux fois (réelle et totale identiques).
---@param workArea any
---@param dt any
function Weeder:processWeederArea(workArea, dt) end

--- Déclare à l'IA les états de mauvaises herbes ciblés (via weedSystem:getWeederReplacements) sauf si un semoir est attelé ; sans lien avec les effets. Fin de fonction (lignes 230-240) non relue.
function Weeder:updateWeederAIRequirements() end

--- Force le type de zone WEEDER lorsque le type lu est DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Weeder:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Pour WEEDER : actif si contact sol (quand exigé) et, le cas échéant, marche avant uniquement ; ne regarde ni l'allumage ni le délai post-attelage.
---@param superFunc table
---@param workArea table
---@return boolean
function Weeder:getIsWorkAreaActive(superFunc, workArea) end

--- Applique la limite de vitesse dès que la chaîne d'outils est abaissée.
---@param superFunc any
---@return boolean
function Weeder:doCheckSpeedLimit(superFunc) end

--- Ajoute la salissure de travail pondérée par vitesse / limite de vitesse quand isWorking.
---@param superFunc any
---@return number
function Weeder:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée par vitesse / limite et par le multiplicateur de pierres (spec.stoneLastState).
---@param superFunc any
---@return number
function Weeder:getWearMultiplier(superFunc) end

--- Étend le chargement d'une correspondance de particules de sol : lit adjustColor et, s'il est vrai, enregistre la correspondance dans spec.colorParticleSystems avec un tampon de couleur.
---@param superFunc XMLFile
---@param xmlFile XMLFile
---@param key string
---@param mapping table
---@param index integer
---@param i3dNode integer
---@return boolean
function Weeder:loadGroundParticleMapping(superFunc, xmlFile, key, mapping, index, i3dNode) end

--- Réinitialise isWorking et les surfaces avant la passe.
---@param dt any
function Weeder:onStartWorkAreaProcessing(dt) end

--- Serveur : déclare la surface travaillée (updateLastWorkedArea). Client : démarre/arrête le son de travail selon isWorking.
---@param dt any
---@param hasProcessed any
function Weeder:onEndWorkAreaProcessing(dt, hasProcessed) end

--- À l'attelage ou au dételage, recalcule les besoins IA.
---@param state any
---@param data any
function Weeder:onStateChange(state, data) end

--- Coupe le son de travail.
function Weeder:onDeactivate() end

--- Arme startActivationTime (2000 ms), valeur non consultée ailleurs dans ce fichier.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Weeder:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Limite de vitesse par défaut : 15.
---@return number
function Weeder.getDefaultSpeedLimit() end
