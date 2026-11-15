---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Combine.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des moissonneuses-batteuses (et ensileuses à tampon) : reçoit les récoltes calculées par les Cutter attachés (addCutterArea), les stocke dans la fill unit, gère un tampon d'entrée (processing.inputBuffer, en créneaux temporisés) qui alimente la paille/le déchiquetage, et pilote les effets visuels côté client. EFFETS (tous via g_effectManager:loadEffect, EffectManager absent du dump : rendu interne NON VÉRIFIÉ) : « chopperEffect » (déchiquetage, clé vehicle.combine.chopperEffect), « strawEffect » (dépôt d'andain), « fillEffect » (remplissage/éjection) et « effect » (effets généraux allumés à l'allumage), plus animationNodes, chopperAnimationNodes, strawDropAnimationNodes et fillingAnimationNodes. Conditions : chopper et paille sont activés par des minuteries serveur (isChopperEffectEnabled / isStrawEffectEnabled, mises à 500 ms quand processCombineChopperArea ou processCombineSwathArea travaille réellement, puis décrémentées dans onUpdateTick) ; le fillEffect suit isFilling (délai spec.processing.toggleTime après les dernières surfaces coupées, fillTimeThreshold sans coupe). Le type de remplissage (setEffectTypeInfo) est getCombineLastValidFillType ; la densité d'effet (g_effectManager:setDensity) vaut cutterLoad x strawRatio x 0.8 + 0.2 (calculée dans addCutterArea, valeur par défaut 0.2). Aucun vent, aucune poussière dédiée n'est piloté ici : la poussière de coupe visible vient des effets XML (cutter.effect et effets ci-dessus) et reste un effet binaire + densité. DONNÉES MÉTÉO : une seule lecture, getIsThreshingDuringRain, qui interroge weather:getRainFallScale() et weather:getTimeSinceLastRain() (seuils : pluie >= 0.1, ou >= 0.02 en mode « alerte précoce », et temps depuis la dernière pluie < 20 ; unités de Weather NON VÉRIFIÉES). Si vrai (et hors mission sur la position, et allowThreshingDuringRain faux), le rendement ajouté dans addCutterArea est multiplié par (1 - Combine.RAIN_YIELD_REDUCTION) (constante non définie dans le dump : NON VÉRIFIÉE) et onDraw affiche l'avertissement « la pluie réduit le rendement ». Pas d'effet visuel lié à la pluie ici. RÉSEAU : le serveur calcule ; les états isFilling, chopperPSenabled, strawPSenabled, effectDensity (5 bits), type de remplissage et fruit sont envoyés via effectDirtyFlag dans onWriteUpdateStream et appliqués côté client par setChopperPSEnabled / setStrawPSEnabled / setCombineIsFilling ; le dirtyFlag sépare le fruit et les hectares travaillés ; onWriteStream/onReadStream envoient l'état complet à la connexion (densité fixée à 1) ; setIsSwathActive passe par CombineStrawEnableEvent. Sur un client, processCombineChopperArea et processCombineSwathArea ne travaillent que si currentUpdateDistance <= Combine.CLIENT_DM_UPDATE_RADIUS (valeur NON VÉRIFIÉE). Points d'extension : événements enregistrés onStartThreshing et onStopThreshing (registerEvents) ; fonctions enregistrées setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling, setIsSwathActive, getIsThreshingDuringRain, getCombineLastValidFillType, getCombineLoadPercentage, addCutterArea, verifyCombine, processCombineChopperArea/SwathArea, loadCombineEffects ; surcharges (getCanBeTurnedOn, getIsFoldAllowed, getDirtMultiplier, getWearMultiplier, getIsTurnedOnAnimationActive...). Les setters d'effets sont les points d'accroche les plus propres pour observer ou compléter les émissions sans toucher à la logique de récolte. Sauvegarde : isSwathActive, workedHectars, numAttachedCutters.
---@class Combine
Combine = {}

--- Enregistre dans le schéma XML toutes les clés de vehicle.combine (avertissements, tampon, andain/swath, déchiquetage, échelle, échelle d'échelle repliable, additifs, inclinaison automatique, repli, effets chopperEffect / strawEffect / fillEffect / effect, animationNodes, sons, tableaux de bord) et les attributs de sauvegarde isSwathActive, workedHectars et numAttachedCutters. Non relu clé par clé.
function Combine.initSpecialization() end

--- Exige WorkArea, FillUnit, AnimatedVehicle, TurnOnVehicle et (Drivable ou Attachable).
---@param specializations any
function Combine.prerequisitesPresent(specializations) end

--- Déclare les événements onStartThreshing et onStopThreshing.
---@param vehicleType any
function Combine.registerEvents(vehicleType) end

--- Expose au type de véhicule les fonctions de chargement (loadCombineSetup, loadCombineEffects, loadCombineRotationNodes, loadCombineSamples), de gestion d'effets (setChopperPSEnabled, setStrawPSEnabled, setCombineIsFilling), de traitement (processCombineChopperArea, processCombineSwathArea, setIsSwathActive, startThreshing, stopThreshing, addCutterArea, addCutterToCombine, removeCutterFromCombine, setWorkedHectars) et d'interrogation (getIsThreshingDuringRain, verifyCombine, getFillLevelDependentSpeed, getIsCutterCompatible, getCombineLastValidFillType, getCombineFillLevelPercentage, getCombineLoadPercentage).
---@param vehicleType any
function Combine.registerFunctions(vehicleType) end

--- Surcharge getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getAreControlledActionsAllowed, getIsFoldAllowed, getCanBeSelected, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, loadTurnedOnAnimationFromXML, getIsTurnedOnAnimationActive, loadRandomlyMovingPartFromXML, getIsRandomlyMovingPartActive, getDischargeFillType et getImplementAllowAutomaticSteering.
---@param vehicleType any
function Combine.registerOverwrittenFunctions(vehicleType) end

--- Écoute notamment onLoad, onPostLoad, onDelete, les événements de flux réseau, onUpdate, onUpdateTick, onDraw, onRegisterActionEvents, onStart/EndWorkAreaProcessing, onChangedFillType, onDeactivate, attache/détache d'implément, onTurnedOn/Off, onEnter/LeaveVehicle, onFoldStateChanged et onFillUnitFillLevelChanged.
---@param vehicleType any
function Combine.registerEventListeners(vehicleType) end

--- Charge la configuration (loadCombineSetup, effets, nœuds de rotation, sons) et initialise l'état : cutters attachés, textes d'avertissement (dont « la pluie réduit le rendement »), dernier type de fruit/remplissage, threshingScale (1 par défaut), paramètres de zone de travail (effectDensity 0.2, minuteries d'effets à 0) et deux dirty flags (dirtyFlag, effectDirtyFlag).
---@param savegame any
function Combine:onLoad(savegame) end

--- Après chargement : restaure l'état d'andain (isSwathActive) et les hectares travaillés depuis la sauvegarde, détecte une moissonneuse à tampon (capacité infinie), lie les fill units pour l'HUD, positionne l'échelle selon le repli et émet des avertissements XML sur une capacité nulle.
---@param savegame table
function Combine:onPostLoad(savegame) end

--- Déclare les valeurs de tableau de bord de la moissonneuse (hectares travaillés, session, etc.). Détail non relu.
function Combine:onRegisterDashboardValueTypes() end

--- Supprime les effets (généraux, remplissage, paille, déchiquetage), animations et sons.
function Combine:onDelete() end

--- Sauvegarde isSwathActive (si disponible), workedHectars et numAttachedCutters.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Combine:saveToXMLFile(xmlFile, key, usedModNames) end

--- Côté client à la connexion : lit fruit, états isFilling / chopper / paille, type de remplissage, andain et hectares, puis applique les effets (densité 1).
---@param streamId integer
---@param connection Connection
function Combine:onReadStream(streamId, connection) end

--- Côté serveur à la connexion : écrit le fruit valide, isFilling, chopperPSenabled, strawPSenabled, le type de remplissage valide, isSwathActive et workedHectars.
---@param streamId integer
---@param connection Connection
function Combine:onWriteStream(streamId, connection) end

--- Côté client : lit, selon deux indicateurs, (1) le fruit valide et les hectares travaillés, (2) isFilling, états chopper/paille, densité d'effet sur 5 bits et type de remplissage ; applique setCombineIsFilling, setChopperPSEnabled et setStrawPSEnabled en mode synchronisé.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Combine:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit le premier bloc si dirtyFlag est levé et le second si effectDirtyFlag est levé (états d'effets, densité x 31, type de remplissage).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Combine:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Par frame : côté serveur, désactive l'andain si le fruit n'a pas d'andain ou le réactive (et vide le tampon d'entrée) si possible, met à jour lastDischargeTime quand la cuve est vide, et pilote l'inclinaison automatique de la table de coupe d'après le Cutter (rotation de nœuds, animation dépendante, repositionnement de l'attelage).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Par tick, côté serveur : fait avancer le tampon d'entrée par créneaux, active/désactive isFilling après les délais toggleTime, décrémente les minuteries d'effets, appelle setChopperPSEnabled et setStrawPSEnabled avec la densité courante (et raiseActive tant qu'ils sont actifs), compte le temps de battage (statistiques), vide le tampon intermédiaire, gère les créneaux de chargement différé et lève effectDirtyFlag quand l'état ou la densité (écart > 0.05) a changé.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Affiche une fois par épisode l'avertissement de rendement réduit si l'outil est allumé et getIsThreshingDuringRain(false) est vrai ; affiche l'avertissement de remorque si showTrailerWarning.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Combine:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Lit la configuration de base de vehicle.combine : allowThreshingDuringRain (false par défaut), fill units, tampon, délais, andain (swath), déchiquetage (chopper), échelle, additifs, inclinaison automatique, repli, durées de basculement, animation de démarrage. Détail non relu ligne à ligne.
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineSetup(xmlFile, baseKey, entry) end

--- Côté client, charge les groupes d'effets chopperEffect, strawEffect, fillEffect et effect, et initialise leurs états (désactivés, type inconnu).
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineEffects(xmlFile, baseKey, entry) end

--- Charge les animationNodes de la moissonneuse (général, déchiquetage, dépôt de paille, remplissage) avec le paramètre d'inversion selon le niveau de remplissage.
---@param xmlFile any
---@param baseKey any
---@param entry any
function Combine:loadCombineRotationNodes(xmlFile, baseKey, entry) end

--- Charge les échantillons sonores de la moissonneuse (démarrage, arrêt, travail, déchiquetage, paille, remplissage...).
---@param xmlFile any
---@param key any
---@param entry any
function Combine:loadCombineSamples(xmlFile, key, entry) end

--- Bascule entre dépôt d'andain et déchiquetage : envoie CombineStrawEnableEvent, joue l'animation du déflecteur, vide les créneaux d'écoulement, et, si allumée côté client, bascule animations et sons correspondants.
---@param isSwathActive boolean
---@param noEventSend boolean
---@param force boolean
function Combine:setIsSwathActive(isSwathActive, noEventSend, force) end

--- Zone de travail de déchiquetage (andain inactif) : si de la paille est à déposer (litersToDrop > 0) et strawRatio > 0.5, écrit dans les cartes de densité (haulm de culture ou type de sol de paille via setGroundTypeLayerArea, effacement des traces de pneus, niveau de chaume haché), puis arme isChopperEffectEnabled à 500 ms. Ignoré au-delà de CLIENT_DM_UPDATE_RADIUS sur un client.
---@param workArea any
function Combine:processCombineChopperArea(workArea) end

--- Zone de travail d'andain : dépose un andain de paille sur une ligne (DensityMapHeightUtil.tipToGroundAroundLine) avec le type d'andain du fruit ; si des litres sont déposés, arme isStrawEffectEnabled à 500 ms ; le surplus non déposable est perdu plutôt que mis en tampon.
---@param workArea any
function Combine:processCombineSwathArea(workArea) end

--- Active/désactive l'effet de déchiquetage (g_effectManager start/stop avec le type de remplissage) et le son chopStraw ; applique la densité reçue. En serveur synchronisé, mémorise l'état envoyé. Côté client seulement pour les effets.
---@param chopperPSenabled boolean
---@param fruitTypeChanged boolean
---@param density number
---@param isSynchronized boolean
function Combine:setChopperPSEnabled(chopperPSenabled, fruitTypeChanged, density, isSynchronized) end

--- Même principe pour l'effet de dépôt de paille et le son dropStraw ; remet strawToDrop à 0 à l'arrêt.
---@param strawPSenabled boolean
---@param fruitTypeChanged boolean
---@param density number
---@param isSynchronized boolean
function Combine:setStrawPSEnabled(strawPSenabled, fruitTypeChanged, density, isSynchronized) end

--- Active/désactive l'état de remplissage : animations de remplissage, type de remplissage des effets généraux, fillEffect (start/stop) et son de remplissage. Côté client.
---@param isFilling boolean
---@param fruitTypeChanged boolean
---@param isSynchronized boolean
function Combine:setCombineIsFilling(isFilling, fruitTypeChanged, isSynchronized) end

--- Si des cutters sont attachés : les allume, joue l'animation de démarrage et les sons, lève onStartThreshing.
function Combine:startThreshing() end

--- Joue le son d'arrêt, coupe isFilling, si la cuve est pleine coupe le régulateur de vitesse et relève/replie les cutters, éteint les cutters et lève onStopThreshing.
function Combine:stopThreshing() end

--- Met à jour les hectares travaillés, synchronise via dirtyFlag si l'écart dépasse 0.01 (serveur) et rafraîchit le tableau de bord (client).
---@param hectars number
---@param isInitial any
function Combine:setWorkedHectars(hectars, isInitial) end

--- Enregistre un cutter attaché et déplie l'échelle si configurée.
---@param cutter any
function Combine:addCutterToCombine(cutter) end

--- Retire un cutter : si c'était le dernier, éteint la machine et vide le tampon invisible d'une moissonneuse à tampon ; replie l'échelle ; relance les actions contrôlées si l'AVC est actif.
---@param cutter any
function Combine:removeCutterFromCombine(cutter) end

--- Point d'entrée de la récolte : reçoit surface, litres, fruit d'entrée, type de sortie, rapport de paille et charge du cutter. Applique threshingScale, la réduction de rendement par la pluie (si getIsThreshingDuringRain et hors mission) et celle des dégâts, alimente le tampon d'entrée avec la paille (type de sol de chaume ou haulm, effectDensity = charge x ratio x 0.8 + 0.2), programme isFilling, consomme les additifs (+5 % de rendement), met à jour les hectares et ajoute les litres à la cuve (avec tampon, délai de chargement). Renvoie les litres appliqués.
---@param area any
---@param liters any
---@param inputFruitType any
---@param outputFillType any
---@param strawRatio any
---@param farmId any
---@param cutterLoad any
function Combine:addCutterArea(area, liters, inputFruitType, outputFillType, strawRatio, farmId, cutterLoad) end

--- Vrai si le battage pendant la pluie est interdit pour ce modèle et que getRainFallScale() atteint 0.1 (0.02 en alerte précoce) alors que getTimeSinceLastRain() est inférieur à 20. Seule dépendance météo du fichier.
---@param earlyWarning boolean
---@return boolean
function Combine:getIsThreshingDuringRain(earlyWarning) end

--- Vérifie que la moissonneuse peut recevoir un fruit/type de sortie : refuse si un autre type remplit déjà la cuve au-delà du seuil (ou vide le tampon d'une moissonneuse à tampon) et si la capacité libre est insuffisante ; renvoie la moissonneuse ou nil et une alternative.
---@param fruitType any
---@param outputFillType any
function Combine:verifyCombine(fruitType, outputFillType) end

--- Renvoie -1 si le niveau de remplissage dépasse le seuil d'inversion des animationNodes, sinon 1.
function Combine:getFillLevelDependentSpeed() end

--- Vrai si l'un des types de remplissage de sortie du cutter est accepté par la fill unit.
---@param fillTypes table
---@return boolean
function Combine:getIsCutterCompatible(fillTypes) end

--- Dernier type de remplissage valide : tampon, cuve, créneaux de chargement différé, puis dernier type d'entrée.
---@return integer
function Combine:getCombineLastValidFillType() end

--- Pourcentage de remplissage réel (borné à 1), y compris les créneaux de chargement différé.
---@return number
function Combine:getCombineFillLevelPercentage() end

--- Moyenne des charges (getCutterLoad) des cutters attachés.
function Combine:getCombineLoadPercentage() end

--- Refuse l'allumage sans cutter attaché ou si un cutter refuse d'être allumé.
---@param superFunc any
---@return boolean
function Combine:getCanBeTurnedOn(superFunc) end

--- Retourne l'avertissement approprié (aucun cutter, ou celui d'un cutter).
---@param superFunc any
---@return string
function Combine:getTurnedOnNotAllowedWarning(superFunc) end

--- Refuse les actions contrôlées sans cutter attaché.
---@param superFunc any
---@return boolean
---@return string
function Combine:getAreControlledActionsAllowed(superFunc) end

--- Interdit le repli pendant le battage (selon allowFoldWhileThreshing) ou cuve remplie au-delà du seuil.
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
---@return boolean
function Combine:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Renvoie toujours true.
---@param superFunc any
function Combine:getCanBeSelected(superFunc) end

--- Charge une zone de travail et lit les paramètres propres au déchiquetage/andain (suite non relue en détail).
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Combine:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Ajoute le multiplicateur de salissure de travail x (vitesse / limite du cutter) si un cutter attaché travaille.
---@param superFunc any
function Combine:getDirtMultiplier(superFunc) end

--- Même principe pour l'usure, multipliée par le facteur de pierres du cutter.
---@param superFunc any
function Combine:getWearMultiplier(superFunc) end

--- Ajoute les options activeChopper, activeStrawDrop (true par défaut) et waitForStraw aux animations d'allumage.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Combine:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

--- Désactive l'animation selon le mode andain/déchiquetage ; avec waitForStraw, reste active tant que l'effet de déchiquetage est armé.
---@param superFunc any
---@param turnedOnAnimation any
function Combine:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

--- Ajoute l'option moveOnlyIfCut aux pièces à mouvement aléatoire.
---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function Combine:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

--- Avec moveOnlyIfCut, n'active la pièce que si un cutter a coupé durant les 150 dernières ms.
---@param superFunc any
---@param part any
function Combine:getIsRandomlyMovingPartActive(superFunc, part) end

--- Si la fill unit est vide, utilise le type de remplissage des créneaux de chargement différé pour la décharge.
---@param superFunc any
---@param dischargeNode any
function Combine:getDischargeFillType(superFunc, dischargeNode) end

--- Renvoie toujours true.
---@param superFunc any
function Combine:getImplementAllowAutomaticSteering(superFunc) end

--- Côté client, enregistre l'action TOGGLE_CHOPPER (andain/déchiquetage) si les deux modes existent.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Combine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Avant les zones de travail : prépare litersToDrop (créneau courant du tampon), minLitersToDrop, strawRatio, type de sol de chaume, effectDensity et dropFillType.
---@param dt any
function Combine:onStartWorkAreaProcessing(dt) end

--- Après les zones : retire du créneau les litres effectivement déposés.
---@param dt any
---@param hasProcessed any
function Combine:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Quand le type de remplissage change, relance les effets actifs (déchiquetage, paille, remplissage) avec le nouveau type.
---@param fillUnitIndex any
---@param fillTypeIndex any
function Combine:onChangedFillType(fillUnitIndex, fillTypeIndex) end

--- Coupe les effets de déchiquetage, de paille et de remplissage et annule les minuteries.
function Combine:onDeactivate() end

--- Si l'implément attaché est de type cutter, l'ajoute à la moissonneuse.
---@param attachable table
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function Combine:onPostAttachImplement(attachable, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- Si l'implément détaché est de type cutter, le retire.
---@param implementIndex integer
function Combine:onPostDetachImplement(implementIndex) end

--- Lance le battage (startThreshing), les animations adaptées (andain ou déchiquetage), les sons et les effets généraux avec le type de remplissage (côté client) ; côté serveur, éteint si turnOffWhenFull et cuve pleine.
function Combine:onTurnedOn() end

--- Arrête le battage, animations, effets généraux et son de déchiquetage (côté client).
function Combine:onTurnedOff() end

--- Replie l'échelle à l'entrée dans le véhicule, sauf conditions de repli ou cutter attaché.
function Combine:onEnterVehicle() end

--- Déplie l'échelle à la sortie du véhicule, sous les mêmes conditions.
function Combine:onLeaveVehicle() end

--- Joue l'animation d'échelle selon la direction de repli.
---@param direction any
---@param moveToMiddle any
function Combine:onFoldStateChanged(direction, moveToMiddle) end

--- Mémorise l'heure de la dernière décharge quand le niveau baisse ; côté serveur, éteint la machine si turnOffWhenFull et cuve pleine.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Combine:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Rappel de l'action TOGGLE_CHOPPER : bascule l'andain si le fruit a un andain, sinon affiche l'avertissement « impossible de basculer ».
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Combine.actionEventToggleChopper(self, actionName, inputValue, callbackState, isAnalog) end

--- Met à jour le texte de l'action selon que l'andain est actif ou non.
---@param self any
function Combine.updateToggleStrawText(self) end
