# vehicles/specializations/FoldableSteps.lua

*[English version](../../../../scripts/vehicles/specializations/FoldableSteps.md)*

Source: `dataS/scripts/vehicles/specializations/FoldableSteps.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils à animation de pliage discrète en plusieurs étapes (par exemple une remorque de coupe à plusieurs positions). Elle joue une animation AnimatedVehicle jusqu'au temps d'un état choisi, propose des entrées de pliage complet et d'état suivant/précédent avec textes et contextes par état, et peut restreindre allumage, HUD d'information et remplissage selon l'état. L'état et la cible sont synchronisés par FoldableStepsChangeStateEvent et sauvegardés. Exige AnimatedVehicle et s'appuie sur getIsFoldAllowed de Foldable.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoldableSteps.prerequisitesPresent(specializations: table) → boolean` | 24 | ✍ Exige la spécialisation AnimatedVehicle sur le type de véhicule. |
| `FoldableSteps.initSpecialization()` | 30 | ✍ Déclare les clés XML vehicle.foldableSteps (nom et vitesse d'animation, unité de remplissage, commandes, liste d'états avec textes, contextes et indicateurs) et l'extension de position de verrouillage de DynamicMountAttacher. Déclare aussi les clés de sauvegarde animTime, state et targetState. |
| `FoldableSteps.registerFunctions(vehicleType: table)` | 79 | ✍ Enregistre setFoldableStepsFoldState sur le type de véhicule. |
| `FoldableSteps.registerOverwrittenFunctions(vehicleType: table)` | 86 | ✍ Enregistre des surcharges pour les contrôles d'allumage, le besoin d'alimentation, le déclencheur d'info HUD, les types d'outils des unités de remplissage, la force de freinage et les positions de verrouillage dynamiques. |
| `FoldableSteps.registerEventListeners(vehicleType: table)` | 100 | ✍ Abonne la spécialisation aux événements de chargement, post-chargement, flux réseau, mise à jour, affichage et enregistrement des actions. |
| `FoldableSteps:onLoad(savegame: table)` | 114 | ✍ Lit le nœud foldableSteps : animation, actions d'entrée et textes, puis la liste des états (temps d'animation converti de secondes en temps normalisé, textes, contextes, indicateurs). Restaure animTime, state et targetState depuis la sauvegarde. Sans animationName, retire ses écouteurs. |
| `FoldableSteps:onPostLoad(savegame: table)` | 202 | ✍ Applique à l'animation le temps chargé depuis la sauvegarde, s'il existe. |
| `FoldableSteps:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 211 | ✍ Écrit le temps d'animation, l'indice d'état courant et l'indice d'état cible dans la sauvegarde quand une animation est définie. |
| `FoldableSteps:onReadStream(streamId: any, connection: any)` | 222 | ✍ Connexion d'un client : lit le temps d'animation, l'indice d'état et l'indice cible, fixe le temps d'animation et appelle setFoldableStepsFoldState sans envoi d'événement. |
| `FoldableSteps:onWriteStream(streamId: any, connection: any)` | 235 | ✍ Écrit le temps d'animation, l'indice d'état et l'indice cible pour un client qui rejoint ; pendant de onReadStream. |
| `FoldableSteps:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 248 | ✍ Tant que l'état diffère de la cible, attend l'arrêt de l'animation puis aligne l'état sur la cible et rafraîchit les textes d'action. Maintient le véhicule actif pendant le mouvement. |
| `FoldableSteps:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Affiche à l'écran le texte d'information supplémentaire de l'état cible quand celui-ci en définit un. |
| `FoldableSteps:onRegisterActionEvents(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean)` | 274 | ✍ Client : enregistre l'action de pliage complet (si permise) et les actions optionnelles d'état suivant/précédent comme actions alimentées, puis met à jour leurs textes. |
| `FoldableSteps:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 303 | ✍ Enregistre des actions externes pour les déclencheurs foldableStepsFull, foldableStepsNextPos et foldableStepsNextNeg (les deux derniers seulement si l'action d'entrée correspondante est configurée). |
| `FoldableSteps:setFoldableStepsFoldState(stateTargetIndex: any, noEventSend: any)` | 319 | ✍ Définit l'indice d'état cible (borné à 1..maxState), joue l'animation vers le temps de cet état à la vitesse configurée, rafraîchit les textes d'action et envoie FoldableStepsChangeStateEvent sauf si noEventSend est actif. |
| `FoldableSteps.updateActionEvents(self: any, actionEvents: any)` | 339 | ✍ Met à jour les textes et l'état actif des actions de pliage complet, état suivant et état précédent selon l'état courant et le mouvement de l'animation. |
| `FoldableSteps.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 386 | ✍ Rappel d'entrée de l'action de pliage complet : choisit le premier ou le dernier état selon l'état et le mouvement courants, et l'applique si updateFoldStateChangeAllowed l'autorise. |
| `FoldableSteps.actionEventFoldPos(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 410 | ✍ Rappel d'entrée passant à l'état suivant (cible + 1), avec contrôle de l'autorisation selon le contexte d'entrée courant. |
| `FoldableSteps.actionEventFoldNeg(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 420 | ✍ Rappel d'entrée passant à l'état précédent (cible - 1), avec contrôle de l'autorisation selon le contexte d'entrée courant. |
| `FoldableSteps.updateFoldStateChangeAllowed(self: any, stateTargetIndex: any, context: any)` | 430 | ✍ Vérifie qu'un changement d'état est permis : getIsFoldAllowed de Foldable, alimentation du véhicule et, si un contexte est fourni, posContext/negContext de l'état ; affiche sinon un avertissement clignotant. À noter : l'opérateur ternaire passé à getIsFoldAllowed renvoie la même valeur dans ses deux branches. |
| `FoldableSteps.externalActionEventFoldRegister(data: any, vehicle: any)` | 465 | ✍ Enregistre l'action externe de pliage complet : à l'appui, tente de démarrer le moteur puis exécute actionEventFold. |
| `FoldableSteps.externalActionEventFoldUpdate(data: any, vehicle: any)` | 480 | ✍ Met à jour le texte et la visibilité de l'action externe de pliage complet selon l'état courant. |
| `FoldableSteps.externalActionEventFoldPosRegister(data: any, vehicle: any)` | 491 | ✍ Enregistre l'action externe d'état suivant : tente de démarrer le moteur puis exécute actionEventFoldPos. |
| `FoldableSteps.externalActionEventFoldPosUpdate(data: any, vehicle: any)` | 506 | ✍ Met à jour le texte de l'action externe d'état suivant, visible seulement quand l'animation est à l'arrêt et que l'état courant a un texte positif. |
| `FoldableSteps.externalActionEventFoldNegRegister(data: any, vehicle: any)` | 524 | ✍ Enregistre l'action externe d'état précédent : tente de démarrer le moteur puis exécute actionEventFoldNeg. |
| `FoldableSteps.externalActionEventFoldNegUpdate(data: any, vehicle: any)` | 539 | ✍ Met à jour le texte de l'action externe d'état précédent, visible seulement quand l'animation est à l'arrêt et que l'état courant a un texte négatif. |
| `FoldableSteps:getCanBeTurnedOn(superFunc: any)` | 557 | ✍ Surcharge renvoyant false pendant un changement d'état ou si l'état courant n'autorise pas l'allumage ; sinon délègue au parent. |
| `FoldableSteps:getTurnedOnNotAllowedWarning(superFunc: any)` | 571 | ✍ Surcharge renvoyant l'avertissement « dépliez d'abord l'outil » dans les mêmes cas que getCanBeTurnedOn ; sinon délègue au parent. |
| `FoldableSteps:getRequiresPower(superFunc: any)` | 585 | ✍ Surcharge renvoyant true pendant un changement d'état, sinon la valeur du parent. |
| `FoldableSteps:getAllowHudInfoTrigger(superFunc: any)` | 598 | ✍ Surcharge renvoyant false quand l'état courant n'autorise pas le HUD d'information ; sinon délègue au parent. |
| `FoldableSteps:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 612 | ✍ Surcharge qui refuse tout type d'outil défini sur l'unité de remplissage configurée quand l'état courant n'autorise pas le remplissage ; sinon délègue au parent. |
| `FoldableSteps:getBrakeForce(superFunc: any)` | 631 | ✍ Surcharge renvoyant 0 pendant un changement d'état si releaseBrakesWhileFolding est actif ; sinon délègue au parent. |
| `FoldableSteps:loadDynamicLockPositionFromXML(superFunc: any, xmlFile: any, key: any, lockPosition: any)` | 646 | ✍ Surcharge qui, après le succès du parent, lit la liste foldableSteps#states d'une position de verrouillage dynamique dans une table de consultation. |
| `FoldableSteps:getIsDynamicLockPositionActive(superFunc: any, lockPosition: any)` | 664 | ✍ Surcharge renvoyant false quand la position de verrouillage est limitée à certains états et que l'état courant n'en fait pas partie ; sinon délègue au parent. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setFoldableStepsFoldState` | 80 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 87 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 88 |
| registerOverwrittenFunction | `getRequiresPower` | 89 |
| registerOverwrittenFunction | `getAllowHudInfoTrigger` | 90 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 91 |
| registerOverwrittenFunction | `getBrakeForce` | 92 |
| registerOverwrittenFunction | `loadDynamicLockPositionFromXML` | 93 |
| registerOverwrittenFunction | `getIsDynamicLockPositionActive` | 94 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onPostLoad` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onUpdateTick` | 105 |
| registerEventListener | `onDraw` | 106 |
| registerEventListener | `onRegisterActionEvents` | 107 |
| registerEventListener | `onRegisterExternalActionEvents` | 108 |
