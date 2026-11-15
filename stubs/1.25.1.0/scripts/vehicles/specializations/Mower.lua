---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mower.lua (stub généré, atlas Lua FS25)

--- Spécialisation des faucheuses (barre de coupe, disques, faucheuse-conditionneuse) : coupe l'herbe/les cultures fourragères de la carte de densité (updateMowerArea, corps absent du dump) et dépose le fourrage soit dans la zone de dépôt (andain), soit dans une unité de remplissage. Prérequis : WorkArea, TurnOnVehicle, FruitExtraObjects. EFFETS (deux familles) : (1) cutterEffects (vehicle.mower.cutterEffects), effet de coupe piloté dans onUpdate ; (2) dropEffects (vehicle.mower.dropEffects.dropEffect(?)), effets de dépôt d'andain, liés à une zone de travail (workAreaIndex) et à une zone de dépôt (dropAreaIndex), fenêtre d'activité 750 ms. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. CUTTER EFFECTS : onUpdate (écouteur retiré s'il n'y a pas d'effet de coupe) ne fait rien tant que l'outil n'est pas allumé ET que getLastSpeed() <= 0.5 ; sinon, côté serveur, il lit la dernière culture coupée (workAreaParameters.lastInputFruitType et stade de croissance) si une coupe réelle a eu lieu dans les 500 derniers ms (g_time), sinon culture inconnue ; l'effet est actif si la culture est connue et que la zone de test n'est pas réinitialisée. Il appelle alors g_effectManager:setEffectTypeInfo(effets, nil, culture, stade) puis setMinMaxWidth avec la largeur courante de la zone de test de la zone n°1 (getTestAreaWidthByWorkAreaIndex(1), bornes inversées en marche avant) et startEffects. Les effets reçoivent donc culture, stade de croissance (défaut 3 si rien de récent) et largeur réellement coupée. L'état est diffusé (effectDirtyFlag : effectsAreRunning, stade sur 4 bits, culture sur FruitTypeManager.SEND_NUM_BITS) ; le client reconstruit les mêmes appels à partir de ces valeurs et de ses propres zones de test (setTestAreaRequirements). Arrêt : onUpdate si plus de coupe, onTurnedOff, ou réception de effectsAreRunning faux. DROP EFFECTS : côté serveur, onEndWorkAreaProcessing active l'effet quand la zone liée a ramassé des litres (pickedUpLiters > 0) sur la zone de dépôt voulue ; si plus de coupe, un minuteur décroissant en dt (750 ms) prolonge l'effet ; onStartWorkAreaProcessing du tick suivant diffuse le changement via dirtyFlag et appelle setDropEffectEnabled (démarrage/arrêt effectif, côté client). Le type transmis est le type de remplissage de la zone de dépôt (dropArea.fillType, issu du fruitTypeConverter : herbe vers andain, etc.). DÉPÔT : processDropArea (fin de passe, serveur ou client proche) dépose les litres accumulés sur une ligne tirée au hasard entre les bords de la zone de dépôt (math.random, y compris dans la physique de dépôt : non déterministe d'une exécution à l'autre ; à noter, le calcul du point d'arrivée mélange coordonnées de largeur et de hauteur, Mower.lua:552-553, forme apparemment inhabituelle, non vérifié en jeu) ; lastDropTime sert à isCutting (500 ms) pour le son de coupe. LITRES : fruitTypeAreaLiters * multiplicateur de récolte (getHarvestScaleMultiplier avec facteurs de pulvérisation, labour, chaux, mauvaises herbes, chaume, rouleau, abeilles : valeurs lues dans la carte) * facteur de conversion. MÉTÉO/HUMIDITÉ : aucune lecture dans ce fichier. RÉSEAU : flux initial (option de dépôt d'andain), flux de mise à jour (types et états des dropEffects, isCutting si pas d'effets de dépôt ; effets de coupe). Traitement de zone sauté pour un client éloigné (> Mower.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). dt : minuteur de dropEffect en ms de temps de jeu, mais avec une logique différente de celle des autres outils (compte à rebours en dt, alors que Tedder/Windrower comparent à g_currentMission.time). POINTS D'EXTENSION : fonctions processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled, setUseMowerWindrowDropAreas ; surcharges doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData, loadWorkAreaFromXML (clés mower#dropWindrow, #dropAreaIndex) ; événements onLoad, onPostLoad, flux, onUpdate, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized ; événement réseau MowerToggleWindrowDropEvent. Vitesse limite par défaut : 20.
---@class Mower
Mower = {}

--- Déclare le type de zone mower et le schéma XML : effets de dépôt et de coupe, convertisseur de cultures, unité de remplissage, bascule d'andain (textes, animation, état initial), sons de coupe, clés dropWindrow/dropAreaIndex des zones. Non relu clé par clé.
function Mower.initSpecialization() end

--- Exige WorkArea, TurnOnVehicle et FruitExtraObjects.
---@param specializations table
---@return boolean
function Mower.prerequisitesPresent(specializations) end

--- Enregistre processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled et setUseMowerWindrowDropAreas.
---@param vehicleType any
function Mower.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData et loadWorkAreaFromXML (liste non relue ligne à ligne).
---@param vehicleType any
function Mower.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onPostLoad, onDelete, aux quatre événements de flux, onUpdate, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing et onAIFieldCourseSettingsInitialized (liste non relue ligne à ligne).
---@param vehicleType any
function Mower.registerEventListeners(vehicleType) end

--- Charge animations et sons, effets de dépôt (valide les indices de zone et de dépôt, fenêtre 750 ms) et effets de coupe, le convertisseur de cultures, l'unité de remplissage, l'état de la bascule d'andain, les paramètres de passe et les exigences IA ; retire onUpdate s'il n'y a pas d'effet de coupe.
---@param savegame table
function Mower:onLoad(savegame) end

--- Mémorise les zones MOWER et attache à chacune ses dropEffects.
---@param savegame table
function Mower:onPostLoad(savegame) end

--- Libère animations, sons, effets de dépôt et de coupe.
function Mower:onDelete() end

--- Lit l'état de l'option d'andain à la connexion (si textes de bascule définis).
---@param streamId integer
---@param connection Connection
function Mower:onReadStream(streamId, connection) end

--- Écrit l'option d'andain.
---@param streamId integer
---@param connection Connection
function Mower:onWriteStream(streamId, connection) end

--- Côté client : lit types et états des dropEffects (ou isCutting), puis l'état des effets de coupe (stade, culture) et coupe les effets si effectsAreRunning est faux ; réinstalle les zones de test de la culture reçue.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Mower:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit types et états des dropEffects (dirtyFlag) et l'état des effets de coupe (effectDirtyFlag : actif, stade sur 4 bits, culture).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Mower:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Pilote les effets de coupe (voir module) : actif seulement si allumé et vitesse > 0.5 ; calcule la largeur coupée depuis la zone de test n°1, détermine culture et stade (serveur) ou les relit (client), appelle setEffectTypeInfo, setMinMaxWidth et startEffects, ou les arrête et lève le drapeau réseau.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Mower:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Pour chaque culture convertible, appelle updateMowerArea (surface changée, facteurs de rendement, stade) ; convertit en litres, les ajoute à la zone de dépôt (jusqu'à 1000 l) ou, sans dépôt, directement à l'unité de remplissage (serveur) ; pour l'herbe fraîche, aspire l'andain de foin sec existant ; mémorise culture, stade et heure de coupe, règle la zone de test. Met isWorking si vitesse > 1 et lit la présence de pierres.
---@param workArea any
---@param dt any
function Mower:processMowerArea(workArea, dt) end

--- Dépose les litres accumulés d'une zone de dépôt sur une ligne choisie au hasard entre ses bords, si le seuil minimal de la carte de hauteur est dépassé ; mémorise lastDropTime et décalage de ligne.
---@param dropArea any
---@param dt any
function Mower:processDropArea(dropArea, dt) end

--- Renvoie la zone auxiliaire (type AUXILIARY) de dépôt liée à une zone de coupe, ou nil si le dépôt d'andain est désactivé ou l'indice invalide (avec avertissement).
---@param workArea any
function Mower:getDropArea(workArea) end

--- Mémorise l'état actif d'un effet de dépôt et, côté client, applique le type de remplissage puis le démarre ou l'arrête.
---@param dropEffect table
---@param isActive boolean
function Mower:setDropEffectEnabled(dropEffect, isActive) end

--- Client : lance ou arrête les sons de coupe.
---@param isActive boolean
function Mower:setCutSoundEnabled(isActive) end

--- Active/désactive le dépôt d'andain : envoie l'événement réseau, mémorise l'option et joue l'animation de bascule.
---@param useMowerWindrowDropAreas boolean
---@param noEventSend boolean
function Mower:setUseMowerWindrowDropAreas(useMowerWindrowDropAreas, noEventSend) end

--- Force le type MOWER si DEFAULT ; pour MOWER lit dropWindrow (vrai) et dropAreaIndex (1) ; pour AUXILIARY enregistre la zone comme zone de dépôt avec litres à déposer à zéro.
---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Mower:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Enregistre, si les textes sont définis, l'action de bascule du dépôt d'andain (IMPLEMENT_EXTRA3).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Mower:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Applique la limite de vitesse si l'outil est allumé et abaissé (ou sans notion d'abaissement).
---@param superFunc any
---@return boolean
function Mower:doCheckSpeedLimit(superFunc) end

--- Renvoie vrai : l'outil est sélectionnable.
---@param superFunc any
function Mower:getCanBeSelected(superFunc) end

--- Ajoute la salissure de travail pondérée vitesse/limite quand isWorking.
---@param superFunc any
function Mower:getDirtMultiplier(superFunc) end

--- Ajoute l'usure de travail pondérée vitesse/limite et par le multiplicateur de pierres.
---@param superFunc any
function Mower:getWearMultiplier(superFunc) end

--- Renvoie la dernière culture coupée pour les objets supplémentaires (FruitExtraObjects).
---@param superFunc any
function Mower:getFruitExtraObjectTypeData(superFunc) end

--- Client : démarre les animationNodes.
function Mower:onTurnedOn() end

--- Client : coupe les effets de dépôt et arrête les animations ; dans tous les cas coupe les effets de coupe et remet effectsAreRunning à faux.
function Mower:onTurnedOff() end

--- Serveur : diffuse et applique les changements d'état des dropEffects puis les remet à inactif ; remet à zéro litres ramassés par zone, surfaces et isWorking.
---@param dt any
function Mower:onStartWorkAreaProcessing(dt) end

--- Dépose les litres (processDropArea sur chaque zone de dépôt), arme les dropEffects selon pickedUpLiters (minuteur 750 ms en dt) ; serveur : statistiques (threshedHectares), état isCutting avec drapeau et son de coupe ; recalcule toutes les 500 ms le pourcentage d'utilisation des zones.
---@param dt any
---@param hasProcessed any
function Mower:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Paramètres de parcours IA : bordures d'abord, segment initial travaillé, découpe de coins autorisée.
---@param fieldCourseSettings any
function Mower:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Renvoie la part de zones ayant coupé durant la dernière fenêtre de 500 ms (0 sans spécialisation).
function Mower:getMowerLoadPercentage() end

--- Limite de vitesse par défaut : 20.
---@return number
function Mower.getDefaultSpeedLimit() end

--- Callback d'entrée : bascule le dépôt d'andain.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Mower.actionEventToggleDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Met à jour le texte de l'action selon l'état du dépôt d'andain.
---@param self any
function Mower.updateActionEventToggleDrop(self) end
