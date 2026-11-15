---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StonePicker.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des ramasse-pierres : ramasse les pierres de la carte de densité des pierres (stoneSystem) et les verse dans une unité de remplissage de type STONE. EFFETS (client) : deux groupes chargés par g_effectManager:loadEffect, effects (vehicle.stonePicker.effects : pierres éjectées/ramassées) et soilEffects (vehicle.stonePicker.soilEffects : terre soulevée par l'outil). Classes d'effets et EffectManager absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (calculé côté serveur dans onEndWorkAreaProcessing, puis diffusé) : l'effet pierres est actif si de la surface a été touchée dans les 500 derniers ms (lastChangedAreaTime) ; l'effet de terre (soilEffects) est actif si l'outil travaille (isWorking : vitesse > 0.5 lors d'un traitement de zone) ET que le véhicule est sur un champ (self.isOnField). Le serveur n'appelle setStonePickerEffectsState que si l'un des trois éléments (pierres, stade 1-3, terre) a changé, puis lève dirtyFlag. DONNÉES TRANSMISES : pour les pierres, setEffectTypeInfo(effets, FillType.STONE, nil, growthState) où growthState = clamp(floor(stoneFactor + 0.49), 1, 3) (stade de densité de pierres lu par updateStonePickerArea) ; pour la terre, simple start/stop sans type. CONDITIONS de zone : le traitement de zone ne se fait que si l'outil est allumé (si needsActivation, vrai par défaut), qu'il n'est pas plein (freeCapacity > 0, sauf IA), après 2000 ms depuis l'attelage et, par défaut, abaissé. Le plein arrête aussi l'outil (onFillUnitFillLevelChanged, serveur). TERRAIN : updateStonePickerArea (corps absent du dump, NON VÉRIFIÉ) renvoie facteur de pierres, surface touchée et totale ; litres = surface en m2 (getFruitPixelsToSqm) * stoneSystem:getLitersPerSqm() * facteur, ajoutés à l'unité de remplissage en fin de passe. eraseTireTrack toujours appelé ; hors client lointain (> StonePicker.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ) le traitement est sauté. MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : flux initial et flux de mise à jour (effet pierres, stade sur 2 bits, effet terre) ; le client applique donc l'état du serveur via setStonePickerEffectsState sans le recalculer. dt : fenêtre de 500 ms mesurée avec g_time, indépendante du FPS. getDoGroundManipulation (surcharge) renvoie faux si pas isWorking : consulté par WorkParticles.lua:238 pour les particules de sol. Les multiplicateurs de salissure/usure ne comptent que la marche avant (movingDirection > 0) ; la salissure lit spec.speedLimit (champ non défini dans ce fichier, la ligne d'usure lit self.speedLimit : NON VÉRIFIÉ). POINTS D'EXTENSION : fonction processStonePickerArea et setStonePickerEffectsState ; surcharges doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type STONEPICKER), getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn ; événements de flux, onFillUnitFillLevelChanged, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Enregistre aussi une stratégie IA (AIDriveStrategyStonePicker). Vitesse limite par défaut : 10.
---@class StonePicker
StonePicker = {}

--- Enregistre la stratégie de conduite IA AIDriveStrategyStonePicker, le type de zone stonePicker et le schéma XML (effets effects et soilEffects, sons, unité de remplissage, noeud de direction, needsActivation, onlyActiveWhenLowered). Non relu clé par clé.
function StonePicker.initSpecialization() end

--- Exige FillUnit et WorkArea.
---@param specializations table
---@return boolean
function StonePicker.prerequisitesPresent(specializations) end

--- Enregistre processStonePickerArea et setStonePickerEffectsState (liste exacte non relue).
---@param vehicleType any
function StonePicker.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn.
---@param vehicleType any
function StonePicker.registerOverwrittenFunctions(vehicleType) end

--- S'abonne notamment à onLoad, onDelete, aux quatre événements de flux, onFillUnitFillLevelChanged, onAIFieldCourseSettingsInitialized, onPostAttach, onDeactivate et aux événements de traitement de zone.
---@param vehicleType any
function StonePicker.registerEventListeners(vehicleType) end

--- Charge sons et deux groupes d'effets (client), lit unité de remplissage, noeud de charge, direction, needsActivation (vrai) et onlyActiveWhenLowered (vrai), initialise les paramètres de passe et, côté serveur, les exigences IA (plage semable, carte de pierres).
---@param savegame table
function StonePicker:onLoad(savegame) end

--- Libère effets effects et soilEffects.
function StonePicker:onDelete() end

--- Lit à la connexion l'état de l'effet pierres, le stade (2 bits) et l'état de l'effet terre, puis les applique.
---@param streamId any
---@param connection any
function StonePicker:onReadStream(streamId, connection) end

--- Écrit ces trois valeurs.
---@param streamId any
---@param connection any
function StonePicker:onWriteStream(streamId, connection) end

--- Côté client : si le drapeau est levé, lit et applique les trois valeurs.
---@param streamId any
---@param timestamp any
---@param connection any
function StonePicker:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit les trois valeurs lorsque dirtyFlag est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function StonePicker:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Ignoré si l'outil n'est pas actif (isActive de la passe). Efface les traces de pneus, puis (hors client lointain) appelle updateStonePickerArea, calcule les litres ramassés, retient le stade de pierres 1-3, l'heure de dernière modification et met isWorking (vitesse > 0.5). Renvoie surface touchée et totale.
---@param workArea any
---@param dt any
function StonePicker:processStonePickerArea(workArea, dt) end

--- Point central des effets : mémorise les trois états et, côté client, démarre/arrête l'effet pierres (avec FillType.STONE et le stade), l'effet terre et les sons associés. N'agit que sur changement d'état.
---@param state any
---@param growthState any
---@param stateSoil any
function StonePicker:setStonePickerEffectsState(state, growthState, stateSoil) end

--- Applique la limite de vitesse quand l'outil est abaissé et, si activation requise, allumé.
---@param superFunc any
---@return boolean
function StonePicker:doCheckSpeedLimit(superFunc) end

--- Renvoie faux si isWorking est faux ; sinon délègue. Interrogé par WorkParticles.
---@param superFunc any
---@return boolean
function StonePicker:getDoGroundManipulation(superFunc) end

--- Ajoute la salissure de travail (marche avant, isWorking, outil allumé si requis), pondérée par la vitesse.
---@param superFunc any
---@return number
function StonePicker:getDirtMultiplier(superFunc) end

--- Idem pour l'usure, sans facteur de pierres.
---@param superFunc any
---@return number
function StonePicker:getWearMultiplier(superFunc) end

--- Force le type de zone STONEPICKER si le type lu est DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function StonePicker:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Pour STONEPICKER : inactive pendant le délai post-attelage, si non abaissée (quand exigé) ou si l'outil est plein (sauf IA).
---@param superFunc any
---@param workArea any
function StonePicker:getIsWorkAreaActive(superFunc, workArea) end

--- Refuse l'allumage si l'outil est plein (sauf IA).
---@param superFunc any
function StonePicker:getCanBeTurnedOn(superFunc) end

--- Renvoie le texte d'avertissement « outil plein » dans ce cas.
---@param superFunc any
function StonePicker:getTurnedOnNotAllowedWarning(superFunc) end

--- Interdit le basculement manuel si needsActivation est faux.
---@param superFunc any
function StonePicker:getCanToggleTurnedOn(superFunc) end

--- Serveur : éteint l'outil lorsque l'unité de remplissage devient pleine (hors IA).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function StonePicker:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Paramètres de parcours IA : bordures d'abord, segment initial travaillé, découpage des segments à 50, outil toujours actif.
---@param fieldCourseSettings any
function StonePicker:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Arme le délai d'activation de 2000 ms.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function StonePicker:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Coupe le son de travail (la fin du fichier n'arrête pas les effets : non vérifié en jeu).
function StonePicker:onDeactivate() end

--- Avant la passe : isWorking = faux, passe active si allumé (ou activation non requise), angle de la carte de densité, remise à zéro des litres et surfaces.
---@param dt any
function StonePicker:onStartWorkAreaProcessing(dt) end

--- Serveur : statistiques de surface, décision des états d'effet (pierres < 500 ms, terre = isWorking et sur champ) avec diffusion réseau si changement, puis ajout des litres de pierres à l'unité de remplissage.
---@param dt any
function StonePicker:onEndWorkAreaProcessing(dt) end

--- Limite de vitesse par défaut : 10.
---@return number
function StonePicker.getDefaultSpeedLimit() end
