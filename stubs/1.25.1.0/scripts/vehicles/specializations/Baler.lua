---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Baler.lua (generated stub, FS25 Lua Atlas)

--- Spécialisation des presses (balles rondes ou carrées, avec ou sans ramasseur, avec tampon de chargement continu nonStopBaling, plateforme, éjection par animation). Prérequis : FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle, Consumable. LOGIQUE DE BALES (résumé, non relu en détail) : le ramassage remplit une unité de remplissage ; la balle est finie quand elle est pleine, créée (createBale, BalerCreateBaleEvent), déplacée sur la courbe d'animation (moveBales/setBaleTime) et déposée (dropBale) ; une balle factice (dummyBale) visualise la balle en formation. EFFETS (client) : fillEffects (vehicle.baler.fillEffect : fourrage entrant dans le ramasseur), additiveEffects (additif liquide), buffer.overloadingEffects (déchargement du tampon), plus animationNodes et unloadAnimationNodes. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT du fillEffect (onUpdateTick, client, uniquement si la presse est allumée) : tant que le serveur signale du ramassage (lastAreaBiggerZero) ET qu'un type de matière est connu (fillEffectType), un compteur de 500 ms est réarmé ; l'effet reste actif tant que ce compteur est > 0, puis s'arrête (décompte en dt réel). Pendant qu'il est actif : setEffectTypeInfo(effets, fillEffectType) puis startEffects puis setDensity(effets, max(charge, 0.40)) où charge = litres ramassés sur 1 s (ValueBuffer de 750 ms de capacité) / maxPickupLitersPerSecond (500 par défaut) : l'intensité visuelle suit donc le débit de matière ramassée, plancher 40 %. Le type d'entrée est le dernier type de matière trouvé par processBalerArea (fillEffectType, serveur) ; aucune culture ni stade. Additifs : jouent un effet LIQUIDFERTILIZER 250 ms à chaque ramassage additivé (serveur : consomme l'additif et augmente de 5 % les litres, pondéré par la disponibilité). RÉSEAU : dirtyFlag unique pour lastAreaBiggerZero, fillEffectTypeSent (SEND_NUM_BITS), alerte de limite de balles, état de déchargement du tampon et état des additifs ; lu dans onReadUpdateStream (client) ; flux initial sur plusieurs champs (non relu entièrement). Le client ne recalcule pas le ramassage. CONDITIONS : zone active si : nombre de balles sous la limite du slotSystem (quand allumé), unité de remplissage non pleine, ramasseur autorisé (allowPickingUp de Pickup, non relu), consommables de filet/film disponibles (rond ET carré), et pour les presses à ouverture, pas de balles en attente ni déchargement. Allumage requis pour que l'effet s'active (onUpdateTick), mais pas testé dans getIsWorkAreaActive de ce fichier. Traitement de zone sauté pour un client éloigné (> Baler.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). TERRAIN : ramassage dans la carte de hauteur (DensityMapHeightUtil.tipToGroundAroundLine avec -infini), types de remplissage de pickupFillTypes ; aucune modification de carte de culture. MÉTÉO/HUMIDITÉ : aucune lecture dans ce fichier. dt : compteurs d'effet et de nettoyage des noeuds en ms de temps de jeu. POINTS D'EXTENSION : fonctions registerFunctions (setBaleTypeIndex, isUnloadingAllowed, handleUnloadingBaleEvent, dropBaleFromPlatform, getBalerBaleOwnerFarmId, setIsUnloadingBale, getIsBaleUnloading, getTimeFromLevel, moveBales, moveBale, setBaleTime, finishBale, createBale, dropBale, dummy bales, getCanUnloadUnfinishedBale, setBalerAutomaticDrop, processBalerArea) ; surcharges doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics, getAlarmTriggerIsActive ; événements onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onConsumableVariationChanged. Événements enregistrés par registerEvents (liste non relue). Vitesse limite par défaut : 25 ; une vitesse variable (variableSpeedLimit) peut moduler la limite d'après les litres ramassés par seconde (serveur, dans onUpdate).
---@class Baler
Baler = {}

--- Déclare la configuration baler, la stratégie IA AIDriveStrategyBaler, le type de zone baler et le schéma XML (effets, animations, types de balles, tampon, additifs, plateforme, débit maximal...). Non relu clé par clé.
function Baler.initSpecialization() end

--- Enregistre les clés XML de vehicle.baler (et configurations) : fillEffect, additiveEffects, animationNodes, unloadAnimationNodes, buffer.overloadingEffect, #maxPickupLitersPerSecond, animations de nouage et compactage, types de balles... Non relu clé par clé.
---@param schema any
---@param basePath any
function Baler.registerBalerXMLPaths(schema, basePath) end

--- Exige FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle et Consumable.
---@param specializations any
function Baler.prerequisitesPresent(specializations) end

--- Déclare les événements propres à la presse (liste non relue).
---@param vehicleType any
function Baler.registerEvents(vehicleType) end

--- Enregistre les fonctions de gestion de balles, de déchargement, de plateforme et processBalerArea.
---@param vehicleType any
function Baler.registerFunctions(vehicleType) end

--- Surcharge doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics et autres (liste non relue ligne à ligne).
---@param vehicleType any
function Baler.registerOverwrittenFunctions(vehicleType) end

--- S'abonne à onLoad, onPostLoad, onLoadFinished, onDelete, flux, onUpdate, onUpdateTick, onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onRegisterActionEvents et onConsumableVariationChanged (liste non relue ligne à ligne).
---@param vehicleType any
function Baler.registerEventListeners(vehicleType) end

--- Charge types de balles, animations, effets (fillEffect, additifs, tampon), son, paramètres du tampon, plateforme, vitesse variable et débit maximal de ramassage (500 l/s par défaut, tampon de 750 ms) ; initialise états de déchargement, listes de balles et drapeau réseau. Lecture détaillée non relue.
---@param savegame any
function Baler:onLoad(savegame) end

--- Restaure depuis la sauvegarde les balles en cours et l'état de la presse (non relu en détail).
---@param savegame any
function Baler:onPostLoad(savegame) end

--- Étape de finalisation de chargement (balle factice, configuration de balle ; non relu en détail).
---@param savegame any
function Baler:onLoadFinished(savegame) end

--- Libère sons, effets (fill, additifs, tampon), animations, balles factices et balles en cours.
function Baler:onDelete() end

--- Sauvegarde les balles en formation, l'état de déchargement et les options (non relu en détail).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Baler:saveToXMLFile(xmlFile, key, usedModNames) end

--- Lit à la connexion l'état de ramassage, le type d'effet, les balles et l'état de déchargement (non relu en détail ; lastAreaBiggerZero lu à la ligne 865).
---@param streamId any
---@param connection any
function Baler:onReadStream(streamId, connection) end

--- Écrit l'état correspondant au flux initial.
---@param streamId any
---@param connection any
function Baler:onWriteStream(streamId, connection) end

--- Côté client : lit lastAreaBiggerZero, fillEffectType, alerte de limite de balles, état de déchargement du tampon (démarre/arrête effets, sons, animations de débordement) et état des additifs (démarre/arrête additiveEffects).
---@param streamId any
---@param timestamp any
---@param connection any
function Baler:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : écrit ces valeurs quand dirtyFlag est levé.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Baler:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Anime les balles, applique les coupes de visibilité de détail, et, côté serveur, finalise la balle au frame suivant (finishBale) et ajuste la limite de vitesse variable selon les litres ramassés par seconde (spec.variableSpeedLimit).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Baler:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Pilote les effets d'entrée (voir module : compteur de 500 ms, densité = charge de ramassage, plancher 0.40), le nettoyage de nouage sonore, le compactage, le déchargement du tampon et la logique de déchargement automatique ; serveur : alimente le tampon de litres ramassés, gère le minuteur des additifs (250 ms) et l'alerte de limite de balles.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Baler:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Interdit le pliage si des balles sont chargées, la presse allumée ou la plateforme occupée (avec avertissement).
---@param superFunc any
---@param direction any
---@param onAiTurnOn any
function Baler:getIsFoldAllowed(superFunc, direction, onAiTurnOn) end

--- Recalcule le fichier XML et l'indice de balle à partir du type de matière courant et du type de balle (balle factice comprise).
---@param fillUnitIndex any
---@param fillTypeIndex any
---@param oldFillTypeIndex any
function Baler:onChangedFillType(fillUnitIndex, fillTypeIndex, oldFillTypeIndex) end

--- Met à jour la balle factice et l'animation de remplissage selon le niveau ; serveur : déclenche la fin de balle quand l'unité est pleine (non relu en détail).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Baler:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

--- Retient la variation de balle (bale_variation) fournie par le consommable.
---@param variationIndex any
---@param metaData any
function Baler:onConsumableVariationChanged(variationIndex, metaData) end

--- Plie la presse en position d'allumage si repliable, lance animations et son de travail.
function Baler:onTurnedOn() end

--- Client : coupe fillEffects, additiveEffects, effets du tampon, animations et sons.
function Baler:onTurnedOff() end

--- Enregistre/met à jour l'action « baleUnload » de l'actionController.
---@param rootVehicle table
function Baler:onRootVehicleChanged(rootVehicle) end

--- Callback d'actionController : déclenche le déchargement quand direction < 0 si permis.
---@param direction any
function Baler:actionControllerBaleUnloadEvent(direction) end

--- Applique la limite de vitesse si l'outil est allumé et abaissé.
---@param superFunc any
function Baler:doCheckSpeedLimit(superFunc) end

--- Choisit le type de balle (immédiatement si vide ou forcé, sinon mémorisé) ; non relu en détail.
---@param baleTypeIndex any
---@param force any
---@param noEventSend any
function Baler:setBaleTypeIndex(baleTypeIndex, force, noEventSend) end

--- Dit si le déchargement manuel est permis (plateforme, allumage, déchargement en cours ; en cas de presse-enrubanneuse, selon allowsGrabbingBale).
function Baler:isUnloadingAllowed() end

--- Ouvre ou ferme le déchargement selon l'état, si permis.
function Baler:handleUnloadingBaleEvent() end

--- Lance l'animation de chute de la plateforme et démonte les objets montés dynamiquement (serveur).
---@param waitForNextBale any
---@param noEventSend any
function Baler:dropBaleFromPlatform(waitForNextBale, noEventSend) end

--- Détermine la ferme propriétaire de la balle (propriétaire du terrain ou dernière ferme touchée, repli sur le propriétaire de la presse).
---@param x any
---@param z any
function Baler:getBalerBaleOwnerFarmId(x, z) end

--- Démarre/arrête l'ouverture de la presse (avec balle inachevée si permis) et propage l'état.
---@param isUnloadingBale any
---@param noEventSend any
function Baler:setIsUnloadingBale(isUnloadingBale, noEventSend) end

--- Renvoie vrai pendant le déchargement.
function Baler:getIsBaleUnloading() end

--- Convertit une quantité de matière en avance de temps sur la courbe d'animation de balle.
---@param level any
function Baler:getTimeFromLevel(level) end

--- Avance toutes les balles du temps donné.
---@param dt any
function Baler:moveBales(dt) end

--- Avance une balle du temps donné.
---@param i any
---@param dt any
---@param noEventSend any
function Baler:moveBale(i, dt, noEventSend) end

--- Place une balle sur la courbe d'animation (noeud et joint côté serveur) et traite la fin de course (temps >= 1).
---@param i any
---@param baleTime any
---@param noEventSend any
function Baler:setBaleTime(i, baleTime, noEventSend) end

--- Termine la balle : vide l'unité de remplissage, remet à zéro les compteurs de matière, crée la balle et diffuse BalerCreateBaleEvent (serveur).
function Baler:finishBale() end

--- Crée l'objet balle, son joint physique et sa position initiale (anime le nouage).
---@param baleFillType any
---@param fillLevel any
---@param baleServerId any
---@param baleTime any
---@param xmlFilename any
---@param ownerFarmId any
---@param variationId any
---@param loadFromSavegame any
function Baler:createBale(baleFillType, fillLevel, baleServerId, baleTime, xmlFilename, ownerFarmId, variationId, loadFromSavegame) end

--- Dépose la balle de la liste : notifie la mission, retire le joint et libère l'objet (serveur).
---@param baleIndex any
function Baler:dropBale(baleIndex) end

--- Crée/met à l'échelle/supprime la balle factice selon niveau et capacité ; renvoie vrai si une nouvelle a été créée.
---@param dummyBaleData any
---@param fillTypeIndex any
---@param fillLevel any
---@param capacity any
function Baler:updateDummyBale(dummyBaleData, fillTypeIndex, fillLevel, capacity) end

--- Supprime la balle factice et libère sa demande de chargement partagée.
---@param dummyBaleData any
function Baler:deleteDummyBale(dummyBaleData) end

--- Charge la balle factice depuis le XML de balle courant et la lie au noeud de balle.
---@param dummyBaleData any
---@param fillTypeIndex any
function Baler:createDummyBale(dummyBaleData, fillTypeIndex) end

--- Vrai si l'éjection d'une balle inachevée est configurée et que le niveau dépasse le seuil.
function Baler:getCanUnloadUnfinishedBale() end

--- Active/désactive la chute automatique (plateforme ou classique) et rafraîchit les actions.
---@param state any
---@param noEventSend any
function Baler:setBalerAutomaticDrop(state, noEventSend) end

--- Refuse l'allumage pendant un déchargement de balle.
---@param superFunc any
function Baler:getCanBeTurnedOn(superFunc) end

--- Lit l'option rotateOnlyIfFillLevelIncreased d'une pièce tournante.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Baler:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Ne fait tourner une pièce marquée que tant que le compteur de ramassage lastAreaBiggerZeroTime est > 0.
---@param superFunc any
---@param speedRotatingPart any
function Baler:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Limite de vitesse par défaut : 25.
function Baler.getDefaultSpeedLimit() end

--- Inactive si la limite de balles est atteinte (allumé), si l'unité est pleine, si le ramasseur n'autorise pas, si un consommable manque, ou si une balle attend/est en déchargement (presses à ouverture sans tampon).
---@param superFunc any
---@param workArea any
function Baler:getIsWorkAreaActive(superFunc, workArea) end

--- Ajoute la charge de ramassage (litres sur 1 s / débit maximal) à la charge consommée.
---@param superFunc any
function Baler:getConsumingLoad(superFunc) end

--- Vrai si le tampon doit se vider, si le déchargement est en cours ou si la presse est allumée.
---@param superFunc any
function Baler:getRequiresPower(superFunc) end

--- Renvoie vrai : l'outil est sélectionnable.
---@param superFunc any
function Baler:getCanBeSelected(superFunc) end

--- Considère aussi les balles montées comme attachées à la presse.
---@param superFunc any
---@param vehicle any
function Baler:getIsAttachedTo(superFunc, vehicle) end

--- Renvoie faux.
---@param superFunc any
function Baler:getAllowDynamicMountFillLevelInfo(superFunc) end

--- Désactive une alarme marquée needsBaleLoaded tant qu'aucune balle n'est chargée.
---@param superFunc any
---@param alarmTrigger any
function Baler:getAlarmTriggerIsActive(superFunc, alarmTrigger) end

--- Lit l'option needsBaleLoaded d'une alarme.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param alarmTrigger any
---@param fillUnit any
function Baler:loadAlarmTrigger(superFunc, xmlFile, key, alarmTrigger, fillUnit) end

--- N'affiche l'avertissement de consommable vide (filet/film) que si la presse est allumée.
---@param superFunc any
---@param typeName any
function Baler:getShowConsumableEmptyWarning(superFunc, typeName) end

--- Remet les balles et leurs joints physiques dans la simulation.
---@param superFunc any
---@return boolean
function Baler:addToPhysics(superFunc) end

--- Retire balles et joints de la simulation.
---@param superFunc any
---@return boolean
function Baler:removeFromPhysics(superFunc) end

--- Ramasse le fourrage sous la zone (aspiration par type de pickupFillTypes), mémorise fillEffectType (serveur, type de la matière trouvée), applique l'additif (serveur), cumule les litres de la passe et renvoie litres ramassés (deux fois) ; client lointain ignoré.
---@param workArea any
---@param dt any
function Baler:processBalerArea(workArea, dt) end

--- Enregistre les actions de déchargement, de basculement de taille et de chute automatique.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Baler:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Relie les déclencheurs externes balerDrop, balerAutomaticDrop et balerBaleSize aux actions correspondantes.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Baler:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Serveur : remet lastAreaBiggerZero et les litres ramassés à zéro avant la passe.
---@param dt any
function Baler:onStartWorkAreaProcessing(dt) end

--- Serveur : choisit le type de matière dominant, met lastAreaBiggerZero à vrai si du ramassage a eu lieu, ajoute les litres à l'unité (ou au tampon), anime les balles, met à jour la vitesse variable et lève dirtyFlag si lastAreaBiggerZero ou fillEffectType ont changé.
---@param dt any
---@param hasProcessed any
function Baler:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Callback d'entrée : lance le déchargement ou la chute de plateforme.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventUnloading(self, actionName, inputValue, callbackState, isAnalog) end

--- Callback d'entrée : change le type de balle (non relu en détail).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventToggleSize(self, actionName, inputValue, callbackState, isAnalog) end

--- Callback d'entrée : bascule la chute automatique.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Baler.actionEventToggleAutomaticDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Met à jour textes et activations des actions de la presse.
---@param self any
function Baler.updateActionEvents(self) end

--- Enregistre l'action externe de déchargement (déclencheur de zone).
---@param data any
---@param vehicle any
function Baler.externalActionEventUnloadRegister(data, vehicle) end

--- Met à jour l'action externe de déchargement.
---@param data any
---@param vehicle any
function Baler.externalActionEventUnloadUpdate(data, vehicle) end

--- Enregistre l'action externe de chute automatique.
---@param data any
---@param vehicle any
function Baler.externalActionEventAutomaticUnloadRegister(data, vehicle) end

--- Met à jour l'action externe de chute automatique.
---@param data any
---@param vehicle any
function Baler.externalActionEventAutomaticUnloadUpdate(data, vehicle) end

--- Enregistre l'action externe de choix du type de balle.
---@param data any
---@param vehicle any
function Baler.externalActionEventBaleTypeRegister(data, vehicle) end

--- Met à jour l'action externe de choix du type de balle.
---@param data any
---@param vehicle any
function Baler.externalActionEventBaleTypeUpdate(data, vehicle) end

--- Lit pour la boutique les dimensions de balles (non relu en détail).
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSize(xmlFile, customEnvironment, baseDir) end

--- Formate pour la boutique les dimensions de balles.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@param roundBale any
function Baler.getSpecValueBaleSize(storeItem, realItem, configurations, saleItem, returnValues, returnRange, roundBale) end

--- Lit pour la boutique les diamètres de balles rondes.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSizeRound(xmlFile, customEnvironment, baseDir) end

--- Lit pour la boutique les dimensions de balles carrées.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Baler.loadSpecValueBaleSizeSquare(xmlFile, customEnvironment, baseDir) end

--- Formate pour la boutique les tailles de balles rondes.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Baler.getSpecValueBaleSizeRound(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Formate pour la boutique les tailles de balles carrées.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Baler.getSpecValueBaleSizeSquare(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
