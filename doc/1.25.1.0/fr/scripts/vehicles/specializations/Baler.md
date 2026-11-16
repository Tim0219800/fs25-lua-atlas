# vehicles/specializations/Baler.lua

*[English version](../../../../scripts/vehicles/specializations/Baler.md)*

Source: `dataS/scripts/vehicles/specializations/Baler.lua` — FS25 1.25.1.0

✍ Spécialisation des presses (balles rondes ou carrées, avec ou sans ramasseur, avec tampon de chargement continu nonStopBaling, plateforme, éjection par animation). Prérequis : FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle, Consumable. LOGIQUE DE BALES (résumé, non relu en détail) : le ramassage remplit une unité de remplissage ; la balle est finie quand elle est pleine, créée (createBale, BalerCreateBaleEvent), déplacée sur la courbe d'animation (moveBales/setBaleTime) et déposée (dropBale) ; une balle factice (dummyBale) visualise la balle en formation. EFFETS (client) : fillEffects (vehicle.baler.fillEffect : fourrage entrant dans le ramasseur), additiveEffects (additif liquide), buffer.overloadingEffects (déchargement du tampon), plus animationNodes et unloadAnimationNodes. Classes d'effets absentes du dump : rendu NON VÉRIFIÉ. DÉCLENCHEMENT du fillEffect (onUpdateTick, client, uniquement si la presse est allumée) : tant que le serveur signale du ramassage (lastAreaBiggerZero) ET qu'un type de matière est connu (fillEffectType), un compteur de 500 ms est réarmé ; l'effet reste actif tant que ce compteur est > 0, puis s'arrête (décompte en dt réel). Pendant qu'il est actif : setEffectTypeInfo(effets, fillEffectType) puis startEffects puis setDensity(effets, max(charge, 0.40)) où charge = litres ramassés sur 1 s (ValueBuffer de 750 ms de capacité) / maxPickupLitersPerSecond (500 par défaut) : l'intensité visuelle suit donc le débit de matière ramassée, plancher 40 %. Le type d'entrée est le dernier type de matière trouvé par processBalerArea (fillEffectType, serveur) ; aucune culture ni stade. Additifs : jouent un effet LIQUIDFERTILIZER 250 ms à chaque ramassage additivé (serveur : consomme l'additif et augmente de 5 % les litres, pondéré par la disponibilité). RÉSEAU : dirtyFlag unique pour lastAreaBiggerZero, fillEffectTypeSent (SEND_NUM_BITS), alerte de limite de balles, état de déchargement du tampon et état des additifs ; lu dans onReadUpdateStream (client) ; flux initial sur plusieurs champs (non relu entièrement). Le client ne recalcule pas le ramassage. CONDITIONS : zone active si : nombre de balles sous la limite du slotSystem (quand allumé), unité de remplissage non pleine, ramasseur autorisé (allowPickingUp de Pickup, non relu), consommables de filet/film disponibles (rond ET carré), et pour les presses à ouverture, pas de balles en attente ni déchargement. Allumage requis pour que l'effet s'active (onUpdateTick), mais pas testé dans getIsWorkAreaActive de ce fichier. Traitement de zone sauté pour un client éloigné (> Baler.CLIENT_DM_UPDATE_RADIUS, constante non définie ici : NON VÉRIFIÉ). TERRAIN : ramassage dans la carte de hauteur (DensityMapHeightUtil.tipToGroundAroundLine avec -infini), types de remplissage de pickupFillTypes ; aucune modification de carte de culture. MÉTÉO/HUMIDITÉ : aucune lecture dans ce fichier. dt : compteurs d'effet et de nettoyage des noeuds en ms de temps de jeu. POINTS D'EXTENSION : fonctions registerFunctions (setBaleTypeIndex, isUnloadingAllowed, handleUnloadingBaleEvent, dropBaleFromPlatform, getBalerBaleOwnerFarmId, setIsUnloadingBale, getIsBaleUnloading, getTimeFromLevel, moveBales, moveBale, setBaleTime, finishBale, createBale, dropBale, dummy bales, getCanUnloadUnfinishedBale, setBalerAutomaticDrop, processBalerArea) ; surcharges doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics, getAlarmTriggerIsActive ; événements onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onConsumableVariationChanged. Événements enregistrés par registerEvents (liste non relue). Vitesse limite par défaut : 25 ; une vitesse variable (variableSpeedLimit) peut moduler la limite d'après les litres ramassés par seconde (serveur, dans onUpdate).

- **Baler** (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Baler.initSpecialization()` | 32 | ✍ Déclare la configuration baler, la stratégie IA AIDriveStrategyBaler, le type de zone baler et le schéma XML (effets, animations, types de balles, tampon, additifs, plateforme, débit maximal...). Non relu clé par clé. |
| `Baler.registerBalerXMLPaths(schema: any, basePath: any)` | 73 | ✍ Enregistre les clés XML de vehicle.baler (et configurations) : fillEffect, additiveEffects, animationNodes, unloadAnimationNodes, buffer.overloadingEffect, #maxPickupLitersPerSecond, animations de nouage et compactage, types de balles... Non relu clé par clé. |
| `Baler.prerequisitesPresent(specializations: any)` | 198 | ✍ Exige FillUnit, WorkArea, TurnOnVehicle, AnimatedVehicle et Consumable. |
| `Baler.registerEvents(vehicleType: any)` | 208 | ✍ Déclare les événements propres à la presse (liste non relue). |
| `Baler.registerFunctions(vehicleType: any)` | 215 | ✍ Enregistre les fonctions de gestion de balles, de déchargement, de plateforme et processBalerArea. |
| `Baler.registerOverwrittenFunctions(vehicleType: any)` | 241 | ✍ Surcharge doCheckSpeedLimit, getIsWorkAreaActive, getConsumingLoad, getRequiresPower, getCanBeTurnedOn, getCanBeSelected, getIsAttachedTo, getIsFoldAllowed, addToPhysics, removeFromPhysics et autres (liste non relue ligne à ligne). |
| `Baler.registerEventListeners(vehicleType: any)` | 262 | ✍ S'abonne à onLoad, onPostLoad, onLoadFinished, onDelete, flux, onUpdate, onUpdateTick, onTurnedOn/Off, onFillUnitFillLevelChanged, onChangedFillType, onRootVehicleChanged, onStart/EndWorkAreaProcessing, onRegisterActionEvents et onConsumableVariationChanged (liste non relue ligne à ligne). |
| `Baler:onLoad(savegame: any)` | 288 | ✍ Charge types de balles, animations, effets (fillEffect, additifs, tampon), son, paramètres du tampon, plateforme, vitesse variable et débit maximal de ramassage (500 l/s par défaut, tampon de 750 ms) ; initialise états de déchargement, listes de balles et drapeau réseau. Lecture détaillée non relue. |
| `Baler:onPostLoad(savegame: any)` | 682 | ✍ Restaure depuis la sauvegarde les balles en cours et l'état de la presse (non relu en détail). |
| `Baler:onLoadFinished(savegame: any)` | 728 | ✍ Étape de finalisation de chargement (balle factice, configuration de balle ; non relu en détail). |
| `Baler:onDelete()` | 750 | ✍ Libère sons, effets (fill, additifs, tampon), animations, balles factices et balles en cours. |
| `Baler:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 792 | ✍ Sauvegarde les balles en formation, l'état de déchargement et les options (non relu en détail). |
| `Baler:onReadStream(streamId: any, connection: any)` | 839 | ✍ Lit à la connexion l'état de ramassage, le type d'effet, les balles et l'état de déchargement (non relu en détail ; lastAreaBiggerZero lu à la ligne 865). |
| `Baler:onWriteStream(streamId: any, connection: any)` | 890 | ✍ Écrit l'état correspondant au flux initial. |
| `Baler:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 929 | ✍ Côté client : lit lastAreaBiggerZero, fillEffectType, alerte de limite de balles, état de déchargement du tampon (démarre/arrête effets, sons, animations de débordement) et état des additifs (démarre/arrête additiveEffects). |
| `Baler:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 979 | ✍ Côté serveur : écrit ces valeurs quand dirtyFlag est levé. |
| `Baler:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 999 | ✍ Anime les balles, applique les coupes de visibilité de détail, et, côté serveur, finalise la balle au frame suivant (finishBale) et ajuste la limite de vitesse variable selon les litres ramassés par seconde (spec.variableSpeedLimit). |
| `Baler:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1096 | ✍ Pilote les effets d'entrée (voir module : compteur de 500 ms, densité = charge de ramassage, plancher 0.40), le nettoyage de nouage sonore, le compactage, le déchargement du tampon et la logique de déchargement automatique ; serveur : alimente le tampon de litres ramassés, gère le minuteur des additifs (250 ms) et l'alerte de limite de balles. |
| `Baler:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1467 | ✍ Interdit le pliage si des balles sont chargées, la presse allumée ou la plateforme occupée (avec avertissement). |
| `Baler:onChangedFillType(fillUnitIndex: any, fillTypeIndex: any, oldFillTypeIndex: any)` | 1493 | ✍ Recalcule le fichier XML et l'indice de balle à partir du type de matière courant et du type de balle (balle factice comprise). |
| `Baler:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1535 | ✍ Met à jour la balle factice et l'animation de remplissage selon le niveau ; serveur : déclenche la fin de balle quand l'unité est pleine (non relu en détail). |
| `Baler:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 1597 | ✍ Retient la variation de balle (bale_variation) fournie par le consommable. |
| `Baler:onTurnedOn()` | 1606 | ✍ Plie la presse en position d'allumage si repliable, lance animations et son de travail. |
| `Baler:onTurnedOff()` | 1623 | ✍ Client : coupe fillEffects, additiveEffects, effets du tampon, animations et sons. |
| `Baler:onRootVehicleChanged(rootVehicle: table)` | 1648 | ✍ Enregistre/met à jour l'action « baleUnload » de l'actionController. |
| `Baler:actionControllerBaleUnloadEvent(direction: any)` | 1670 | ✍ Callback d'actionController : déclenche le déchargement quand direction < 0 si permis. |
| `Baler:doCheckSpeedLimit(superFunc: any)` | 1689 | ✍ Applique la limite de vitesse si l'outil est allumé et abaissé. |
| `Baler:setBaleTypeIndex(baleTypeIndex: any, force: any, noEventSend: any)` | 1695 | ✍ Choisit le type de balle (immédiatement si vide ou forcé, sinon mémorisé) ; non relu en détail. |
| `Baler:isUnloadingAllowed()` | 1710 | ✍ Dit si le déchargement manuel est permis (plateforme, allumage, déchargement en cours ; en cas de presse-enrubanneuse, selon allowsGrabbingBale). |
| `Baler:handleUnloadingBaleEvent()` | 1729 | ✍ Ouvre ou ferme le déchargement selon l'état, si permis. |
| `Baler:dropBaleFromPlatform(waitForNextBale: any, noEventSend: any)` | 1748 | ✍ Lance l'animation de chute de la plateforme et démonte les objets montés dynamiquement (serveur). |
| `Baler:getBalerBaleOwnerFarmId(x: any, z: any)` | 1772 | ✍ Détermine la ferme propriétaire de la balle (propriétaire du terrain ou dernière ferme touchée, repli sur le propriétaire de la presse). |
| `Baler:setIsUnloadingBale(isUnloadingBale: any, noEventSend: any)` | 1796 | ✍ Démarre/arrête l'ouverture de la presse (avec balle inachevée si permis) et propage l'état. |
| `Baler:getIsBaleUnloading()` | 1866 | ✍ Renvoie vrai pendant le déchargement. |
| `Baler:getTimeFromLevel(level: any)` | 1872 | ✍ Convertit une quantité de matière en avance de temps sur la courbe d'animation de balle. |
| `Baler:moveBales(dt: any)` | 1886 | ✍ Avance toutes les balles du temps donné. |
| `Baler:moveBale(i: any, dt: any, noEventSend: any)` | 1896 | ✍ Avance une balle du temps donné. |
| `Baler:setBaleTime(i: any, baleTime: any, noEventSend: any)` | 1905 | ✍ Place une balle sur la courbe d'animation (noeud et joint côté serveur) et traite la fin de course (temps >= 1). |
| `Baler:finishBale()` | 1943 | ✍ Termine la balle : vide l'unité de remplissage, remet à zéro les compteurs de matière, crée la balle et diffuse BalerCreateBaleEvent (serveur). |
| `Baler:createBale(baleFillType: any, fillLevel: any, baleServerId: any, baleTime: any, xmlFilename: any, ownerFarmId: any, variationId: any, loadFromSavegame: any)` | 1982 | ✍ Crée l'objet balle, son joint physique et sa position initiale (anime le nouage). |
| `Baler:dropBale(baleIndex: any)` | 2128 | ✍ Dépose la balle de la liste : notifie la mission, retire le joint et libère l'objet (serveur). |
| `Baler:updateDummyBale(dummyBaleData: any, fillTypeIndex: any, fillLevel: any, capacity: any)` | 2206 | ✍ Crée/met à l'échelle/supprime la balle factice selon niveau et capacité ; renvoie vrai si une nouvelle a été créée. |
| `Baler:deleteDummyBale(dummyBaleData: any)` | 2253 | ✍ Supprime la balle factice et libère sa demande de chargement partagée. |
| `Baler:createDummyBale(dummyBaleData: any, fillTypeIndex: any)` | 2268 | ✍ Charge la balle factice depuis le XML de balle courant et la lie au noeud de balle. |
| `Baler:getCanUnloadUnfinishedBale()` | 2287 | ✍ Vrai si l'éjection d'une balle inachevée est configurée et que le niveau dépasse le seuil. |
| `Baler:setBalerAutomaticDrop(state: any, noEventSend: any)` | 2300 | ✍ Active/désactive la chute automatique (plateforme ou classique) et rafraîchit les actions. |
| `Baler:getCanBeTurnedOn(superFunc: any)` | 2324 | ✍ Refuse l'allumage pendant un déchargement de balle. |
| `Baler:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 2336 | ✍ Lit l'option rotateOnlyIfFillLevelIncreased d'une pièce tournante. |
| `Baler:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 2344 | ✍ Ne fait tourner une pièce marquée que tant que le compteur de ramassage lastAreaBiggerZeroTime est > 0. |
| `Baler.getDefaultSpeedLimit()` | 2358 | ✍ Limite de vitesse par défaut : 25. |
| `Baler:getIsWorkAreaActive(superFunc: any, workArea: any)` | 2364 | ✍ Inactive si la limite de balles est atteinte (allumé), si l'unité est pleine, si le ramasseur n'autorise pas, si un consommable manque, ou si une balle attend/est en déchargement (presses à ouverture sans tampon). |
| `Baler:getConsumingLoad(superFunc: any)` | 2395 | ✍ Ajoute la charge de ramassage (litres sur 1 s / débit maximal) à la charge consommée. |
| `Baler:getRequiresPower(superFunc: any)` | 2406 | ✍ Vrai si le tampon doit se vider, si le déchargement est en cours ou si la presse est allumée. |
| `Baler:getCanBeSelected(superFunc: any)` | 2433 | ✍ Renvoie vrai : l'outil est sélectionnable. |
| `Baler:getIsAttachedTo(superFunc: any, vehicle: any)` | 2439 | ✍ Considère aussi les balles montées comme attachées à la presse. |
| `Baler:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 2456 | ✍ Renvoie faux. |
| `Baler:getAlarmTriggerIsActive(superFunc: any, alarmTrigger: any)` | 2462 | ✍ Désactive une alarme marquée needsBaleLoaded tant qu'aucune balle n'est chargée. |
| `Baler:loadAlarmTrigger(superFunc: any, xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 2478 | ✍ Lit l'option needsBaleLoaded d'une alarme. |
| `Baler:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 2488 | ✍ N'affiche l'avertissement de consommable vide (filet/film) que si la presse est allumée. |
| `Baler:addToPhysics(superFunc: any) → boolean` | 2499 | ✍ Remet les balles et leurs joints physiques dans la simulation. |
| `Baler:removeFromPhysics(superFunc: any) → boolean` | 2541 | ✍ Retire balles et joints de la simulation. |
| `Baler:processBalerArea(workArea: any, dt: any)` | 2565 | ✍ Ramasse le fourrage sous la zone (aspiration par type de pickupFillTypes), mémorise fillEffectType (serveur, type de la matière trouvée), applique l'additif (serveur), cumule les litres de la passe et renvoie litres ramassés (deux fois) ; client lointain ignoré. |
| `Baler:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2633 | ✍ Enregistre les actions de déchargement, de basculement de taille et de chute automatique. |
| `Baler:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 2667 | ✍ Relie les déclencheurs externes balerDrop, balerAutomaticDrop et balerBaleSize aux actions correspondantes. |
| `Baler:onStartWorkAreaProcessing(dt: any)` | 2685 | ✍ Serveur : remet lastAreaBiggerZero et les litres ramassés à zéro avant la passe. |
| `Baler:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 2696 | ✍ Serveur : choisit le type de matière dominant, met lastAreaBiggerZero à vrai si du ramassage a eu lieu, ajoute les litres à l'unité (ou au tampon), anime les balles, met à jour la vitesse variable et lève dirtyFlag si lastAreaBiggerZero ou fillEffectType ont changé. |
| `Baler.actionEventUnloading(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2765 | ✍ Callback d'entrée : lance le déchargement ou la chute de plateforme. |
| `Baler.actionEventToggleSize(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2780 | ✍ Callback d'entrée : change le type de balle (non relu en détail). |
| `Baler.actionEventToggleAutomaticDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2793 | ✍ Callback d'entrée : bascule la chute automatique. |
| `Baler.updateActionEvents(self: any)` | 2799 | ✍ Met à jour textes et activations des actions de la presse. |
| `Baler.externalActionEventUnloadRegister(data: any, vehicle: any)` | 2876 | ✍ Enregistre l'action externe de déchargement (déclencheur de zone). |
| `Baler.externalActionEventUnloadUpdate(data: any, vehicle: any)` | 2890 | ✍ Met à jour l'action externe de déchargement. |
| `Baler.externalActionEventAutomaticUnloadRegister(data: any, vehicle: any)` | 2925 | ✍ Enregistre l'action externe de chute automatique. |
| `Baler.externalActionEventAutomaticUnloadUpdate(data: any, vehicle: any)` | 2937 | ✍ Met à jour l'action externe de chute automatique. |
| `Baler.externalActionEventBaleTypeRegister(data: any, vehicle: any)` | 2949 | ✍ Enregistre l'action externe de choix du type de balle. |
| `Baler.externalActionEventBaleTypeUpdate(data: any, vehicle: any)` | 2961 | ✍ Met à jour l'action externe de choix du type de balle. |
| `Baler.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 2976 | ✍ Lit pour la boutique les dimensions de balles (non relu en détail). |
| `Baler.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBale: any)` | 3003 | ✍ Formate pour la boutique les dimensions de balles. |
| `Baler.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 3039 | ✍ Lit pour la boutique les diamètres de balles rondes. |
| `Baler.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 3050 | ✍ Lit pour la boutique les dimensions de balles carrées. |
| `Baler.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3061 | ✍ Formate pour la boutique les tailles de balles rondes. |
| `Baler.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3073 | ✍ Formate pour la boutique les tailles de balles carrées. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onBalerUnloadingStarted` | 209 |
| registerEvent | `onBalerUnloadingFinished` | 210 |
| registerFunction | `processBalerArea` | 216 |
| registerFunction | `setBaleTypeIndex` | 217 |
| registerFunction | `isUnloadingAllowed` | 218 |
| registerFunction | `getTimeFromLevel` | 219 |
| registerFunction | `moveBales` | 220 |
| registerFunction | `moveBale` | 221 |
| registerFunction | `setIsUnloadingBale` | 222 |
| registerFunction | `getIsBaleUnloading` | 223 |
| registerFunction | `dropBale` | 224 |
| registerFunction | `finishBale` | 225 |
| registerFunction | `createBale` | 226 |
| registerFunction | `setBaleTime` | 227 |
| registerFunction | `getCanUnloadUnfinishedBale` | 228 |
| registerFunction | `setBalerAutomaticDrop` | 229 |
| registerFunction | `updateDummyBale` | 230 |
| registerFunction | `deleteDummyBale` | 231 |
| registerFunction | `createDummyBale` | 232 |
| registerFunction | `handleUnloadingBaleEvent` | 233 |
| registerFunction | `dropBaleFromPlatform` | 234 |
| registerFunction | `getBalerBaleOwnerFarmId` | 235 |
| registerFunction | `getIsRoundBaler` | 236 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 242 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 243 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 244 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 245 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 246 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 247 |
| registerOverwrittenFunction | `getConsumingLoad` | 248 |
| registerOverwrittenFunction | `getRequiresPower` | 249 |
| registerOverwrittenFunction | `getCanBeSelected` | 250 |
| registerOverwrittenFunction | `getIsAttachedTo` | 251 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 252 |
| registerOverwrittenFunction | `getAlarmTriggerIsActive` | 253 |
| registerOverwrittenFunction | `loadAlarmTrigger` | 254 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 255 |
| registerOverwrittenFunction | `addToPhysics` | 256 |
| registerOverwrittenFunction | `removeFromPhysics` | 257 |
| registerEventListener | `onLoad` | 263 |
| registerEventListener | `onPostLoad` | 264 |
| registerEventListener | `onLoadFinished` | 265 |
| registerEventListener | `onDelete` | 266 |
| registerEventListener | `onReadStream` | 267 |
| registerEventListener | `onWriteStream` | 268 |
| registerEventListener | `onReadUpdateStream` | 269 |
| registerEventListener | `onWriteUpdateStream` | 270 |
| registerEventListener | `onUpdate` | 271 |
| registerEventListener | `onUpdateTick` | 272 |
| registerEventListener | `onDraw` | 273 |
| registerEventListener | `onRegisterActionEvents` | 274 |
| registerEventListener | `onRegisterExternalActionEvents` | 275 |
| registerEventListener | `onStartWorkAreaProcessing` | 276 |
| registerEventListener | `onEndWorkAreaProcessing` | 277 |
| registerEventListener | `onTurnedOn` | 278 |
| registerEventListener | `onTurnedOff` | 279 |
| registerEventListener | `onRootVehicleChanged` | 280 |
| registerEventListener | `onChangedFillType` | 281 |
| registerEventListener | `onFillUnitFillLevelChanged` | 282 |
| registerEventListener | `onConsumableVariationChanged` | 283 |
