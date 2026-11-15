---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Tedder.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des faneuses : ramasse l'andain/le fourrage sous la zone de travail (carte de hauteur, DensityMapHeightUtil) et le redépose étalé dans une zone de dépôt, en convertissant le type de remplissage (fillTypeConverter : par ex. herbe vers foin sec, noms non relus). Prérequis : WorkArea et TurnOnVehicle. EFFETS (client) : animationNodes (vehicle.tedder.animationNodes, démarrés à l'allumage, arrêtés à l'extinction) et une liste d'effets vehicle.tedder.effects.effect(?) chargés par g_effectManager:loadEffect, chacun lié à une zone par workAreaIndex, fenêtre d'activité de 250 ms. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT (serveur) : dans processTedderArea, si des litres ont été effectivement redéposés (dropped > 0) et que la vitesse (getLastSpeed(true)) est > 0.5, les effets de la zone sont armés (activeTime = temps + 250 ms), démarrés au besoin et recalés sur le type de remplissage déposé (setEffectTypeInfo au démarrage ou quand le type change). La densité d'effet est réglée à max(vitesse / limite de vitesse, 0.6) sur l'hôte-joueur (g_effectManager:setDensity) ; sur un client distant, le flux réseau ne transporte que le type et l'état actif : la densité n'est pas réglée (onReadUpdateStream applique setEffectTypeInfo et startEffects, puis gère les sons), donc l'effet y tourne à la densité par défaut de la définition XML (NON VÉRIFIÉ : comportement de EffectManager absent). Autrement dit, la poussière/le fourrage projeté ne part que si de la matière est réellement ramassée ET redéposée, pas à vide. Les effets reçoivent donc le type de remplissage converti (cible), jamais de stade de culture. ARRÊT : onUpdateTick (serveur seulement, l'abonnement est retiré sinon) coupe les effets expirés et lève effectDirtyFlag. MÉTÉO/HUMIDITÉ : aucune donnée lue. RÉSEAU : tableau des types de remplissage par zone (fillTypesDirtyFlag, SEND_NUM_BITS) et booléen d'effet actif par effet (effectDirtyFlag) ; le client applique type + démarrage/arrêt à la réception ; le client ne recalcule pas l'effet. CONDITIONS : active selon le type de zone TEDDER (aucun test d'allumage dans getIsWorkAreaActive : non surchargé ici, la logique d'activation vient d'ailleurs, NON VÉRIFIÉ) ; doCheckSpeedLimit s'applique si allumé et chaîne d'outils abaissée. isWorking = litres déposés dans la passe > 0 (onEndWorkAreaProcessing). Ramassage : tipToGroundAroundLine avec -infini sur chaque type d'entrée ; traitement sauté pour un client éloigné (> Tedder.CLIENT_DM_UPDATE_RADIUS, constante non définie ici, NON VÉRIFIÉ). dt : fenêtres de 250 ms en temps de jeu (g_currentMission.time). À noter : onPostLoad, pour un workAreaIndex invalide, appelle table.insert(spec.effects, i) au lieu de table.remove (Tedder.lua:166), ce qui semble une faute (non vérifié en jeu). La table tedderWorkAreaFillTypes est initialisée avec FruitType.UNKNOWN alors qu'elle contient des types de remplissage. POINTS D'EXTENSION : fonctions registerFunctions (preprocessTedderArea, processTedderArea, processDropArea) ; surcharges loadWorkAreaFromXML (ajoute dropWindrowWorkAreaIndex et les champs d'effet de zone), getDirtMultiplier, getWearMultiplier, doCheckSpeedLimit ; événements onLoad, onPostLoad, flux, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate. Vitesse limite par défaut : 15.
---@class Tedder
Tedder = {}

--- Déclare le type de zone tedder et le schéma XML : effets (vehicle.tedder.effects.effect(?)), animationNodes, converter de types, sons. Non relu clé par clé.
function Tedder.initSpecialization() end

--- Exige WorkArea et TurnOnVehicle.
---@param specializations any
function Tedder.prerequisitesPresent(specializations) end

--- Enregistre preprocessTedderArea, processTedderArea et processDropArea.
---@param vehicleType any
function Tedder.registerFunctions(vehicleType) end

--- Surcharge loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier et doCheckSpeedLimit (liste non relue ligne à ligne).
---@param vehicleType any
function Tedder.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIFieldCourseSettingsInitialized et onDeactivate (liste non relue ligne à ligne).
---@param vehicleType any
function Tedder.registerEventListeners(vehicleType) end

--- Charge le convertisseur de types (avertit s'il manque), les animations et effets (client), initialise litres déposés, multiplicateur d'usure de pierres (type TEDDER) et drapeaux réseau ; déclare à l'IA l'exigence d'un andain d'herbe.
---@param savegame any
function Tedder:onLoad(savegame) end

--- Rattache chaque effet à sa zone (workAreaToEffects) et à l'indice de type de remplissage de la zone ; retire l'abonnement onUpdateTick hors serveur. À noter : insertion au lieu de suppression pour un indice invalide.
---@param savegame any
function Tedder:onPostLoad(savegame) end

--- Libère les effets et les animations.
function Tedder:onDelete() end

--- Lit les types de remplissage par zone puis l'état de chaque effet, et démarre/arrête les effets avec le type de la zone.
---@param streamId any
---@param connection any
function Tedder:onReadStream(streamId, connection) end

--- Écrit les types de remplissage par zone puis l'état envoyé de chaque effet.
---@param streamId any
---@param connection any
function Tedder:onWriteStream(streamId, connection) end

--- Côté client : lit si présents les types par zone et l'état de chaque effet, applique type et démarrage/arrêt puis pilote les sons de travail ; ne règle pas la densité.
---@param streamId any
---@param timestamp any
---@param connection any
function Tedder:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit types (fillTypesDirtyFlag) et états d'effets (effectDirtyFlag).
---@param streamId any
---@param connection any
---@param dirtyMask any
function Tedder:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Serveur : coupe les effets dont la fenêtre de 250 ms a expiré, met à jour isActiveSent et les drapeaux ; sur l'hôte-joueur, appelle stopEffects.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Tedder:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Force le type TEDDER si DEFAULT ; pour une zone TEDDER, lit la zone de dépôt (dropWindrowWorkAreaIndex) et initialise litres à déposer, type du dernier dépôt et drapeaux de particules, et réserve un emplacement dans tedderWorkAreaFillTypes.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Tedder:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Ajoute la salissure de travail pondérée vitesse/limite quand isWorking.
---@param superFunc any
function Tedder:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres.
---@param superFunc any
function Tedder:getWearMultiplier(superFunc) end

--- Applique la limite de vitesse si l'outil est allumé et la chaîne d'outils abaissée.
---@param superFunc any
function Tedder:doCheckSpeedLimit(superFunc) end

--- Remet à zéro litres ramassés et déposés de la zone avant le traitement.
---@param workArea any
function Tedder:preprocessTedderArea(workArea) end

--- Ramasse sur la ligne de la zone chaque type d'entrée du convertisseur, ajoute les litres à déposer, les redépose via processDropArea et, côté serveur à vitesse > 0.5, met à jour type par zone, arme et démarre les effets (avec densité). Lit aussi la présence de pierres si l'outil roule. Renvoie la surface (largeur de ligne * distance parcourue) deux fois.
---@param workArea any
---@param dt any
function Tedder:processTedderArea(workArea, dt) end

--- Dépose les litres convertis sur la ligne de la zone de dépôt (tipToGroundAroundLine) et mémorise le décalage de ligne ; renvoie les litres réellement déposés (0, 0 pour un client éloigné : valeur de retour non homogène).
---@param dropArea any
---@param fillType any
---@param litersToDrop any
function Tedder:processDropArea(dropArea, fillType, litersToDrop) end

--- Remet à zéro spec.lastDroppedLiters avant la passe.
---@param dt any
function Tedder:onStartWorkAreaProcessing(dt) end

--- isWorking devient vrai si des litres ont été déposés pendant la passe.
---@param dt any
---@param hasProcessed any
function Tedder:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Client : démarre les animationNodes.
function Tedder:onTurnedOn() end

--- Client : arrête les animations et coupe tous les effets.
function Tedder:onTurnedOff() end

--- Paramètres de parcours IA : bordures d'abord, segment initial travaillé.
---@param fieldCourseSettings any
function Tedder:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Client : coupe tous les effets.
function Tedder:onDeactivate() end

--- Limite de vitesse par défaut : 15.
function Tedder.getDefaultSpeedLimit() end
