---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Windrower.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des andaineurs : ramasse le fourrage étalé (types listés par vehicle.windrower#fillTypes / #fillTypeCategories) sur la zone de travail via la carte de hauteur (DensityMapHeightUtil.tipToGroundAroundLine avec -infini) et le redépose en andain dans une zone de dépôt (dropWindrowWorkAreaIndex). Même architecture que Tedder. EFFETS : animationNodes (client, démarrés à l'allumage) et liste vehicle.windrower.effects.effect(?) chargés par g_effectManager:loadEffect, chacun lié à une zone (workAreaIndex) et optionnellement à une zone de dépôt (dropAreaIndex), fenêtre d'activité 250 ms ; si l'effet expose setWorkAreaIndex, la zone lui est communiquée. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur) : dans processWindrowerArea, quand la zone a ramassé des litres, si le dépôt a effectivement déposé de la matière (dropped > 0) et que la vitesse (getLastSpeed(true)) dépasse 0.5, les effets de la zone dont dropAreaIndex correspond sont armés (activeTime = temps + 250 ms), démarrés au besoin et recalés sur le type déposé (setEffectTypeInfo). Aucune densité réglée (contrairement à Tedder). Le type transmis est celui du dernier andain ramassé (lastValidPickupFillType), jamais un stade de culture. Chaque ramassage appelle aussi setTestAreaRequirements(nil, type, nil) avec le type ramassé (rôle exact dans le rendu NON VÉRIFIÉ : fonction hors fichier). CONDITIONS : isWorking = vitesse > 0.5 au traitement d'une zone ; doCheckSpeedLimit s'applique si allumé (ou sans TurnOnVehicle) et chaîne abaissée ; aucun test d'allumage dans la zone elle-même (getIsWorkAreaActive non surchargé ici : NON VÉRIFIÉ). Traitement sauté pour un client éloigné (> Windrower.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). ARRÊT : onUpdateTick (côté serveur) coupe les effets expirés et lève effectDirtyFlag ; onTurnedOff coupe tout. Sur serveur dédié, g_effectManager est appelé sans garde isClient (inoffensif ? non vérifié). MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : types de remplissage par zone (fillTypesDirtyFlag) et booléen par effet (effectDirtyFlag), diffusés au flux initial et en mise à jour ; le client applique type et démarrage/arrêt. dt : 250 ms de temps de jeu ; pas de dt dans la physique du dépôt. À noter : onPostLoad utilise table.insert(spec.effects, i) au lieu de table.remove pour un indice invalide (Windrower.lua:171), vraisemblable faute (non vérifié en jeu). particleSystemIndex est lu dans loadWorkAreaFromXML mais jamais utilisé dans ce fichier (reliquat de l'ancien système de particules ; les clés vehicle.windrowerParticleSystems sont signalées obsolètes). POINTS D'EXTENSION : fonctions processWindrowerArea, processDropArea ; surcharges doCheckSpeedLimit, loadWorkAreaFromXML (type WINDROWER), getDirtMultiplier, getWearMultiplier ; événements onLoad, onPostLoad, flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Vitesse limite par défaut : 15.
---@class Windrower
Windrower = {}

--- Déclare le type de zone windrower et le schéma XML : effets, animationNodes, types de remplissage supportés, limitToLineHeight, sons. Non relu clé par clé.
function Windrower.initSpecialization() end

--- Exige la spécialisation WorkArea (seule).
---@param specializations any
function Windrower.prerequisitesPresent(specializations) end

--- Enregistre processWindrowerArea et processDropArea.
---@param vehicleType any
function Windrower.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier et getWearMultiplier.
---@param vehicleType any
function Windrower.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing et onAIFieldCourseSettingsInitialized (liste non relue ligne à ligne).
---@param vehicleType any
function Windrower.registerEventListeners(vehicleType) end

--- Charge animations et effets (client), lit limitToLineHeight et la liste des types supportés, initialise multiplicateur d'usure de pierres (type WINDROWER) et drapeaux réseau, déclare à l'IA les types de hauteur requis.
---@param savegame any
function Windrower:onLoad(savegame) end

--- Rattache chaque effet à sa zone de travail et à l'indice de type de la zone ; avertit si indice invalide (avec l'insertion fautive signalée dans le module).
---@param savegame any
function Windrower:onPostLoad(savegame) end

--- Libère animations et effets.
function Windrower:onDelete() end

--- Lit les types de remplissage par zone puis l'état de chaque effet ; démarre ou arrête les effets avec le type de la zone.
---@param streamId any
---@param connection any
function Windrower:onReadStream(streamId, connection) end

--- Écrit les types par zone puis l'état envoyé de chaque effet.
---@param streamId any
---@param connection any
function Windrower:onWriteStream(streamId, connection) end

--- Côté client : lit si présents types et états d'effets, applique démarrage/arrêt avec setEffectTypeInfo.
---@param streamId any
---@param timestamp any
---@param connection any
function Windrower:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit types (fillTypesDirtyFlag) et états (effectDirtyFlag).
---@param streamId any
---@param connection any
---@param dirtyMask any
function Windrower:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Serveur : coupe les effets dont la fenêtre de 250 ms a expiré et lève effectDirtyFlag.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Windrower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client : lance le son de travail et les animationNodes.
function Windrower:onTurnedOn() end

--- Coupe tous les effets (sans garde client) et arrête les animations.
function Windrower:onTurnedOff() end

--- Applique la limite de vitesse si la chaîne d'outils est abaissée et l'outil allumé (ou non allumable).
---@param superFunc any
function Windrower:doCheckSpeedLimit(superFunc) end

--- Limite de vitesse par défaut : 15.
function Windrower.getDefaultSpeedLimit() end

--- Force le type WINDROWER si DEFAULT ; pour une zone WINDROWER lit particleSystemIndex (inutilisé) et la zone de dépôt, initialise litres et type, réserve un emplacement dans windrowerWorkAreaFillTypes.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Windrower:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Ajoute la salissure de travail pondérée vitesse/limite quand isWorking.
---@param superFunc any
function Windrower:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres.
---@param superFunc any
function Windrower:getWearMultiplier(superFunc) end

--- Remet à zéro, pour chaque zone, type valide ramassé, litres ramassés et déposés ; isWorking = faux.
---@param dt any
---@param workAreas any
function Windrower:onStartWorkAreaProcessing(dt, workAreas) end

--- Client sans TurnOnVehicle : démarre/arrête le son de travail selon isWorking. Pas d'effet visuel ici.
---@param dt any
---@param workAreas any
function Windrower:onEndWorkAreaProcessing(dt, workAreas) end

--- Paramètres de parcours IA : bordures d'abord, segment initial travaillé.
---@param fieldCourseSettings any
function Windrower:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Ramasse l'andain sous la zone : cherche un type supporté (ou reprend le dernier type, herbe fraîche et sèche équivalentes), mémorise lastValidPickupFillType et appelle setTestAreaRequirements, cumule litres à déposer, dépose via processDropArea et, côté serveur à vitesse > 0.5 avec dépôt réel, met à jour le type par zone et arme/démarre les effets. Renvoie litres déposés et surface (largeur * distance parcourue).
---@param workArea any
---@param dt any
function Windrower:processWindrowerArea(workArea, dt) end

--- Dépose les litres sur la ligne de la zone de dépôt (tipToGroundAroundLine), mémorise le décalage de ligne et renvoie les litres réellement déposés.
---@param dropArea any
---@param litersToDrop any
---@param fillType any
function Windrower:processDropArea(dropArea, litersToDrop, fillType) end
