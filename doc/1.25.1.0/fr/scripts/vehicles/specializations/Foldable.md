# vehicles/specializations/Foldable.lua

*[English version](../../../../scripts/vehicles/specializations/Foldable.md)*

Source: `dataS/scripts/vehicles/specializations/Foldable.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules et outils dotés d'un mouvement de pliage défini par un ou plusieurs foldingPart animés (clip d'animation ou animation AnimatedVehicle), avec éventuellement une position intermédiaire servant à l'abaissement. Elle suit foldAnimTime (0 à 1), synchronise la direction sur le réseau via FoldableSetFoldDirectionEvent et surcharge de nombreuses fonctions d'autres spécialisations pour que zones de travail, outils mobiles, types de pulvérisation, attaches, etc. ne soient actifs que dans les limites de pliage définies en XML. Elle gère aussi les entrées, le comportement de l'IA, le contrôleur d'actions et la sauvegarde. Aucun prérequis sur d'autres spécialisations.

- **Foldable** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Foldable.prerequisitesPresent(specializations: any)` | 17 | ✍ Renvoie toujours true : la spécialisation n'exige aucune autre spécialisation. |
| `Foldable.initSpecialization()` | 23 | ✍ Enregistre le type de configuration « folding » et déclare de nombreux chemins XML : le schéma foldingConfigurations et les attributs de limites de pliage ajoutés aux zones de travail, outils mobiles, roues, unités de remplissage, pulvérisateurs, attaches, etc. Déclare aussi les deux clés de sauvegarde foldAnimTime et isAllowed. |
| `Foldable.registerFoldingXMLPaths(schema: any, basePath: any)` | 157 | ✍ Déclare les attributs XML d'une configuration de pliage sous le chemin de base donné : textes, état initial, limites de pliage par action, indicateurs de comportement et enfants foldingPart (animation, joint, abaissement différé). Partagé pour être réutilisé par d'autres schémas. |
| `Foldable.registerEvents(vehicleType: any)` | 227 | ✍ Enregistre les événements de véhicule onFoldStateChanged (direction, moveToMiddle) et onFoldTimeChanged (temps d'animation), déclenchés par cette spécialisation. |
| `Foldable.registerFunctions(vehicleType: any)` | 234 | ✍ Enregistre l'API publique de pliage sur le type de véhicule : setFoldState, setFoldDirection, setFoldMiddleState, getIsUnfolded, getFoldAnimTime, les contrôles d'autorisation et les aides de direction inversée. |
| `Foldable.registerOverwrittenFunctions(vehicleType: any)` | 251 | ✍ Enregistre des surcharges de fonctions d'autres spécialisations (zones de travail, outils mobiles, types de pulvérisation, attaches, unités de remplissage, abaissement, contrôles IA, direction crabe, etc.) pour qu'elles respectent l'état de pliage. |
| `Foldable.registerEventListeners(vehicleType: any)` | 330 | ✍ Abonne la spécialisation aux événements de chargement, flux réseau, mise à jour, enregistrement des entrées, attache/détache, abaissement et changement de véhicule racine. |
| `Foldable:onLoad(savegame: any)` | 352 | ✍ Lit la configuration de pliage active : textes, temps d'animation initial, actions d'entrée, toutes les limites et indicateurs, puis charge chaque foldingPart. Restaure foldAnimTime et isAllowed depuis la sauvegarde ou applique les paramètres de chargement foldableInvertFoldState / foldableFoldingTime. |
| `Foldable:onPostLoad(savegame: any)` | 488 | ✍ Applique le temps d'animation chargé au modèle. Sans foldingPart ou avec l'état de pliage du parent, retire les écouteurs de flux, mise à jour et entrées pour économiser du travail. |
| `Foldable:onRegistered()` | 509 | ✍ Si le contrôle pendant le pliage est interdit, enregistre getIsVehicleControlAllowed comme contrôle de conduite du joueur lorsque cette fonction existe sur le véhicule. |
| `Foldable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 520 | ✍ Écrit foldAnimTime et isAllowed dans la sauvegarde, uniquement si le véhicule a des foldingPart. |
| `Foldable:onReadStream(streamId: any, connection: any)` | 530 | ✍ Connexion d'un client : lit direction (2 bits), moveToMiddle et temps d'animation dans le flux, applique le temps sans déplacer les composants puis appelle setFoldState sans envoyer d'événement. |
| `Foldable:onWriteStream(streamId: any, connection: any)` | 540 | ✍ Écrit la direction de pliage courante (2 bits), l'indicateur moveToMiddle et le temps d'animation pour un client qui rejoint ; pendant de onReadStream. |
| `Foldable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 551 | ✍ Tant qu'une direction de pliage est active, lit l'avancement des animations des foldingPart, met à jour foldAnimTime (en déclenchant onFoldTimeChanged), s'arrête à la cible (fin ou milieu), réaligne les joints de composants côté serveur et synchronise les sous-véhicules. Gère aussi l'abaissement différé par distance et le freinage si le contrôle est bloqué pendant le pliage. |
| `Foldable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 675 | ✍ Client : actualise les textes des actions de pliage et de pliage intermédiaire. Serveur : avec ignoreFoldMiddleWhileFolded, quand l'outil atteint la position intermédiaire, le replie si l'attache est abaissée pour garder les deux états cohérents. |
| `Foldable:loadFoldingPartFromXML(xmlFile: table, baseKey: string, foldingPart: table) → boolean` | 710 | ✍ Charge un foldingPart : échelle de vitesse, joint de composants optionnel, et animation soit par clip sur un nœud racine soit par animationName d'AnimatedVehicle, plus réglages optionnels de délai par distance. Renvoie false (avec avertissement XML) si invalide. |
| `Foldable:setFoldDirection(direction: any, noEventSend: any)` | 810 | ✍ Lance le pliage dans la direction donnée (-1, 0 ou 1) sans viser la position intermédiaire ; raccourci vers setFoldState avec moveToMiddle à false. |
| `Foldable:setFoldState(direction: any, moveToMiddle: any, noEventSend: any)` | 816 | ✍ Définit la direction de pliage et l'arrêt éventuel au temps intermédiaire, envoie FoldableSetFoldDirectionEvent sauf si noEventSend vaut true, démarre ou arrête l'animation de chaque partie (ou la retarde par distance) et déclenche onFoldStateChanged. Décale foldAnimTime de 0,0001 pour que les limites puissent s'activer. |
| `Foldable:setFoldMiddleState(doLowering: any)` | 921 | ✍ Lève ou abaisse l'outil via la position de pliage intermédiaire si elle est définie et autorisée : l'abaissement part dans la direction opposée à la direction de relevage IA, le relevage va jusqu'au milieu. Sans effet sans foldMiddleAnimTime. |
| `Foldable:getIsUnfolded()` | 936 | ✍ Renvoie true si l'outil est en position de travail (déplié), jugé selon turnOnFoldDirection et le temps d'animation final ou intermédiaire ; toujours true sans foldingPart. |
| `Foldable:getFoldAnimTime()` | 962 | ✍ Renvoie le temps d'animation de pliage (0 à 1), en privilégiant la valeur chargée de la sauvegarde tant qu'elle est en attente. |
| `Foldable:setIsFoldActionAllowed(isAllowed: boolean)` | 970 | ✍ Active ou désactive l'action de pliage, par exemple pour qu'un script bloque le pliage par le joueur. |
| `Foldable:getIsFoldActionAllowed() → boolean` | 977 | ✍ Renvoie si l'action de pliage est actuellement autorisée (indicateur isAllowed). |
| `Foldable:getIsFoldAllowed(direction: integer, onAiTurnOn: boolean) → boolean, string` | 987 | ✍ Renvoie l'autorisation et un avertissement optionnel (toujours nil ici). Refusé si l'indicateur est désactivé, si les limites de l'attache d'entrée active sont violées, ou si un pliage en cours est hors des limites de bascule. Les paramètres direction et onAiTurnOn ne sont pas utilisés dans ce corps. |
| `Foldable:getIsFoldMiddleAllowed()` | 1014 | ✍ Renvoie true si le pliage est autorisé et qu'un temps d'animation intermédiaire est défini. |
| `Foldable:getToggledFoldDirection()` | 1026 | ✍ Calcule la direction qu'un appui sur le bouton de pliage prendrait : l'inverse du mouvement en cours, ou vers l'extrémité la plus proche à l'arrêt, avec un traitement particulier de la position intermédiaire et de la plage abaissée. |
| `Foldable:getToggledFoldMiddleDirection()` | 1071 | ✍ Calcule la direction qu'un appui sur le bouton d'abaissement prendrait pour l'état intermédiaire ; renvoie 0 si aucun temps intermédiaire n'est défini. |
| `Foldable.getIsVehicleControlAllowed(self: any)` | 1098 | ✍ Contrôle enregistré quand allowControlWhileFolding vaut false : renvoie false pendant un mouvement de pliage, true sinon. |
| `Foldable:allowLoadMovingToolStates(superFunc: any)` | 1109 | ✍ Surcharge qui interdit de charger les états sauvegardés des outils mobiles quand le temps de pliage est hors des limites configurées ; sinon délègue au parent. |
| `Foldable:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 1121 | ✍ Surcharge qui, après le succès du parent, lit foldLimitedOuterRange et foldMinLimit/foldMaxLimit d'une pièce rotative à vitesse (défauts 0 et 1, ou 0,5 et 0,5 avec la plage extérieure). |
| `Foldable:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 1141 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'une pièce rotative à vitesse ; sinon délègue au parent. |
| `Foldable:loadSlopeCompensationNodeFromXML(superFunc: any, compensationNode: any, xmlFile: any, key: any)` | 1159 | ✍ Surcharge qui lit foldAngleScale et invertFoldAngleScale d'un nœud de compensation de pente avant d'appeler le parent. |
| `Foldable:getSlopeCompensationAngleScale(superFunc: any, compensationNode: any)` | 1168 | ✍ Surcharge qui met à l'échelle l'angle de compensation de pente du parent par une interpolation entre foldAngleScale et 1 selon le temps de pliage, en tenant compte du temps intermédiaire. |
| `Foldable:loadWheelFromXML(superFunc: any, wheel: any)` | 1190 | ✍ Surcharge qui lit versatileFoldMinLimit et versatileFoldMaxLimit d'une roue (défauts 0 et 1) avant l'appel parent. |
| `Foldable:getIsVersatileYRotActive(superFunc: any, wheel: any)` | 1199 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites de pliage versatiles de la roue ; sinon délègue au parent. |
| `Foldable:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1211 | ✍ Surcharge qui lit foldLimitedOuterRange et folding#minLimit / folding#maxLimit d'une zone de travail (avec vérification des anciens noms d'attributs) avant d'appeler le parent. |
| `Foldable:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1231 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'une zone de travail ; sinon délègue au parent. C'est ainsi qu'un outil replié cesse de travailler avec ses sections extérieures. |
| `Foldable:loadGroundReferenceNode(superFunc: any, xmlFile: any, key: any, groundReferenceNode: any)` | 1249 | ✍ Surcharge qui, quand le parent charge le nœud de référence au sol, lit aussi ses folding#minLimit et folding#maxLimit. |
| `Foldable:updateGroundReferenceNode(superFunc: any, groundReferenceNode: any)` | 1262 | ✍ Surcharge qui exécute la mise à jour parente puis force isActive à false sur le nœud de référence au sol quand le temps de pliage est hors de ses limites. |
| `Foldable:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 1273 | ✍ Surcharge qui appelle le chargeur parent pour un nœud de niveleur (lit aussi foldLimitedOuterRange), puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 1289 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud de niveleur ; sinon délègue au parent. |
| `Foldable:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1307 | ✍ Surcharge qui, après le succès du parent, lit les limites de pliage d'un outil mobile et compare foldingConfigurationIndex / foldingConfigurationIndices à la configuration de pliage du véhicule, en stockant hasRequiredFoldingConfiguration. |
| `Foldable:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1340 | ✍ Surcharge renvoyant false si l'outil mobile exige une autre configuration de pliage ou si le temps de pliage est hors de ses limites ; sinon délègue au parent. |
| `Foldable:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1355 | ✍ Surcharge qui appelle le chargeur parent pour une pièce mobile, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1368 | ✍ Surcharge renvoyant false si la pièce mobile a des limites non par défaut et que le temps de pliage est hors de celles-ci ; sinon délègue au parent. |
| `Foldable:getCanBeTurnedOn(superFunc: any)` | 1381 | ✍ Surcharge qui empêche d'allumer l'outil quand le temps de pliage est hors des limites d'activation. |
| `Foldable:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1392 | ✍ Surcharge qui, une fois le parent d'accord, exige aussi que le temps de pliage soit dans les limites de bascule du couvercle. |
| `Foldable:getIsNextCoverStateAllowedWarning(superFunc: any, nextState: any)` | 1407 | ✍ Surcharge renvoyant le texte d'avertissement de dépliage quand la bascule du couvercle est bloquée par le temps de pliage ; sinon délègue à l'avertissement parent. |
| `Foldable:getIsInWorkPosition(superFunc: any)` | 1418 | ✍ Surcharge renvoyant false sauf si l'outil est complètement à l'extrémité de travail du pliage (ou sans foldingPart) ; sinon délègue au parent. |
| `Foldable:getTurnedOnNotAllowedWarning(superFunc: any)` | 1430 | ✍ Surcharge renvoyant l'avertissement de dépliage quand le temps de pliage empêche l'allumage ; sinon délègue au parent. |
| `Foldable:isDetachAllowed(superFunc: any) → boolean, string` | 1444 | ✍ Surcharge renvoyant false avec un avertissement si le temps de pliage est hors des limites de détache, ou si l'outil est en cours de pliage et que le détachement pendant le pliage n'est pas permis. Sinon délègue au parent. |
| `Foldable:isAttachAllowed(superFunc: integer, farmId: integer, attacherVehicle: table) → boolean, string` | 1466 | ✍ Surcharge renvoyant false avec l'avertissement de dépliage quand le temps de pliage est hors des limites d'attache ; sinon délègue au parent. |
| `Foldable:getAllowsLowering(superFunc: any) → boolean, string` | 1480 | ✍ Surcharge renvoyant false avec l'avertissement de dépliage quand le temps de pliage est hors des limites d'abaissement ; sinon délègue au parent. |
| `Foldable:getIsLowered(superFunc: any, default: any)` | 1492 | ✍ Surcharge qui, avec une position intermédiaire de pliage, déduit l'état abaissé de l'animation et de la direction de pliage (en tenant compte de ignoreFoldMiddleWhileFolded) ; sinon délègue au parent. |
| `Foldable:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1535 | ✍ Surcharge qui, pour les outils avec position intermédiaire, enregistre l'entrée de pliage intermédiaire comme action d'abaissement (avec ou sans alimentation). Retourne tôt si cette entrée est celle demandée. À noter : l'appel parent final ne transmet pas ignoreCollisions. |
| `Foldable:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1563 | ✍ Surcharge qui renvoie vers la surcharge de registerLoweringActionEvent avec les mêmes arguments. |
| `Foldable:loadGroundAdjustedNodeFromXML(superFunc: any, xmlFile: any, key: any, adjustedNode: any)` | 1569 | ✍ Surcharge qui, après le succès du parent, lit foldable#minLimit et foldable#maxLimit d'un nœud ajusté au sol (avec vérification des anciens attributs). |
| `Foldable:getIsGroundAdjustedNodeActive(superFunc: any, adjustedNode: any, ignoreAttachState: any)` | 1585 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud ajusté au sol ; sinon délègue au parent. |
| `Foldable:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 1598 | ✍ Surcharge qui lit les limites de pliage optionnelles et les indices de configuration de pliage requis d'un type de pulvérisation, stocke hasRequiredFoldingConfiguration, puis délègue au parent. |
| `Foldable:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 1627 | ✍ Surcharge renvoyant false si le type de pulvérisation a des limites de pliage violées par le temps courant, ou s'il exige une autre configuration de pliage ; sinon délègue au parent. |
| `Foldable:getCanBeSelected(superFunc: any)` | 1646 | ✍ Surcharge qui renvoie toujours true, sans appeler le parent : un véhicule pliable peut toujours être sélectionné. |
| `Foldable:loadInputAttacherJoint(superFunc: any, xmlFile: any, key: any, inputAttacherJoint: any, index: any)` | 1652 | ✍ Surcharge qui lit foldMinLimit et foldMaxLimit optionnels d'une attache d'entrée (nil si absents) avant l'appel parent. |
| `Foldable:getIsInputAttacherActive(superFunc: table, inputAttacherJoint: table) → boolean` | 1663 | ✍ Surcharge renvoyant false quand l'attache a des limites de pliage et que le temps est hors de celles-ci, donc inutilisable pour atteler ; sinon délègue au parent. |
| `Foldable:loadAdditionalCharacterFromXML(superFunc: any, xmlFile: any)` | 1676 | ✍ Surcharge qui lit foldMinLimit et foldMaxLimit de vehicle.enterable.additionalCharacter et les stocke dans le spec Enterable avant l'appel parent. |
| `Foldable:getIsAdditionalCharacterActive(superFunc: any)` | 1687 | ✍ Surcharge renvoyant true quand le temps de pliage est dans les limites du personnage additionnel ; sinon délègue au parent. |
| `Foldable:getAllowDynamicMountObjects(superFunc: any)` | 1701 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites de montage dynamique ; sinon délègue au parent. |
| `Foldable:loadSupportAnimationFromXML(superFunc: table, supportAnimation: integer, xmlFile: integer, key: string)` | 1716 | ✍ Surcharge qui lit folding#minLimit et folding#maxLimit d'une animation de support (avec vérification des anciens noms) avant l'appel parent. |
| `Foldable:getIsSupportAnimationAllowed(superFunc: any, supportAnimation: any)` | 1728 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'une animation de support ; sinon délègue au parent. |
| `Foldable:loadSteeringAxleFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 1739 | ✍ Surcharge qui lit folding#minLimit et folding#maxLimit de l'essieu directeur dans le spec passé (vérification des anciens noms comprise) avant l'appel parent. |
| `Foldable:getIsSteeringAxleAllowed(superFunc: any)` | 1751 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites de pliage de l'essieu directeur Attachable ; sinon délègue au parent. |
| `Foldable:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 1763 | ✍ Surcharge qui appelle le chargeur parent pour une unité de remplissage, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 1772 | ✍ Surcharge qui refuse tout type d'outil défini sur une unité de remplissage dont les limites de pliage sont violées par le temps courant ; ToolType.UNDEFINED est toujours transmis au parent. |
| `Foldable:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1791 | ✍ Surcharge qui appelle le chargeur parent pour une animation d'allumage, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1801 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'une animation d'allumage ; sinon délègue au parent. |
| `Foldable:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 1812 | ✍ Surcharge qui appelle le chargeur parent pour un nœud de hauteur d'attache, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 1821 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud de hauteur d'attache ; sinon délègue au parent. |
| `Foldable:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1832 | ✍ Surcharge qui appelle le chargeur parent pour un pickup, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1841 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites du pickup, qui ne peut alors pas être levé ni abaissé ; sinon délègue au parent. |
| `Foldable:loadCutterTiltFromXML(superFunc: table, xmlFile: table, key: string, target: any) → boolean` | 1855 | ✍ Surcharge qui appelle le chargeur parent pour une inclinaison automatique de barre de coupe (renvoie false si le parent échoue), puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getCutterTiltIsActive(superFunc: any, automaticTilt: any) → boolean, boolean` | 1870 | ✍ Surcharge qui renvoie l'indicateur actif du parent, mais, s'il est actif et que le temps de pliage est hors des limites, renvoie false avec doReset à true pour ramener l'inclinaison à sa position initiale. |
| `Foldable:loadPreprunerNodeFromXML(superFunc: any, xmlFile: any, key: any, prunerNode: any)` | 1886 | ✍ Surcharge qui appelle le chargeur parent pour un nœud de prétailleur de vigne, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsPreprunerNodeActive(superFunc: any, prunerNode: any)` | 1899 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud de prétailleur ; sinon délègue au parent. |
| `Foldable:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 1910 | ✍ Surcharge qui appelle le chargeur parent pour un nœud de godet (renvoie toujours true), puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 1921 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud de godet ; sinon délègue au parent. |
| `Foldable:loadSteeringAngleNodeFromXML(superFunc: any, entry: any, xmlFile: any, key: any)` | 1933 | ✍ Surcharge qui appelle le chargeur parent pour un nœud d'angle de braquage, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:updateSteeringAngleNode(superFunc: any, steeringAngleNode: any, angle: any, dt: any)` | 1946 | ✍ Surcharge qui saute totalement la mise à jour quand le temps de pliage est hors des limites du nœud ; sinon appelle le parent. |
| `Foldable:loadWoodHarvesterHeaderTiltFromXML(superFunc: any, headerTilt: any, xmlFile: any, key: any)` | 1957 | ✍ Surcharge qui appelle le chargeur parent pour une inclinaison de tête d'abatteuse, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsWoodHarvesterTiltStateAllowed(superFunc: any, headerTilt: any)` | 1970 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites d'inclinaison de la tête ; sinon délègue au parent. |
| `Foldable:loadSuspensionNodeFromXML(superFunc: any, xmlFile: any, key: any, suspensionNode: any)` | 1981 | ✍ Surcharge qui appelle le chargeur parent pour un nœud de suspension, puis lit foldMinLimit/foldMaxLimit dans son nœud XML et les stocke sur l'entrée (défauts 0 et 1, donc toujours actif). |
| `Foldable:getIsSuspensionNodeActive(superFunc: any, suspensionNode: any)` | 1994 | ✍ Surcharge qui renvoie false quand le temps d'animation de pliage est hors des limites stockées de d'un nœud de suspension ; sinon délègue au parent. |
| `Foldable:loadCrabSteeringModeFromXML(superFunc: any, xmlFile: any, key: any, mode: any)` | 2005 | ✍ Surcharge qui, après le succès du parent, lit folding#minLimit et folding#maxLimit d'un mode de direction crabe. |
| `Foldable:getCrabSteeringModeAvailable(superFunc: any, mode: any)` | 2018 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites du mode de direction crabe ; sinon délègue au parent. |
| `Foldable:getCanToggleCrabSteering(superFunc: any)` | 2029 | ✍ Surcharge renvoyant false avec l'avertissement de dépliage quand le temps de pliage est hors des limites de direction crabe ; sinon délègue au parent. |
| `Foldable:onLoadWheelChockFromXML(superFunc: any, wheelChock: any, xmlObject: any, key: any)` | 2041 | ✍ Surcharge qui appelle le parent (sans arguments supplémentaires) et lit foldMinLimit et foldMaxLimit d'une cale de roue. Ne renvoie pas le résultat du parent. |
| `Foldable:getIsWheelChockAllowed(superFunc: any, wheelChock: any)` | 2050 | ✍ Surcharge renvoyant false quand le temps de pliage est hors des limites de la cale de roue ; sinon délègue au parent. |
| `Foldable:loadCraneShovelFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 2061 | ✍ Surcharge qui, après le succès du parent, lit foldable#minLimit et foldable#maxLimit d'un godet de grue. |
| `Foldable:getCraneShovelStateChangedAllowed(superFunc: any, spec: any)` | 2074 | ✍ Surcharge renvoyant false avec l'avertissement de dépliage quand le temps de pliage est hors des limites du godet de grue ; sinon délègue au parent. |
| `Foldable:getBrakeForce(superFunc: any)` | 2085 | ✍ Surcharge renvoyant 0 pendant le pliage si releaseBrakesWhileFolding est activé ; sinon délègue au parent. |
| `Foldable:getRequiresPower(superFunc: any)` | 2098 | ✍ Surcharge renvoyant true pendant un mouvement de pliage, sinon la valeur du parent. |
| `Foldable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2104 | ✍ Client : enregistre l'action de pliage (avec ou sans alimentation selon requiresPower) et l'action masquée de pliage global, sauf si le milieu est le seul mouvement. Uniquement quand le véhicule est actif pour les entrées. |
| `Foldable:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 2131 | ✍ Enregistre une action externe (par déclencheur) pour le déclencheur nommé « folding », si le véhicule a des foldingPart. |
| `Foldable:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 2142 | ✍ Surcharge qui empêche l'IA de continuer quand l'outil est en cours de pliage (sauf pendant la remontée vers le milieu), si le dépliage par l'IA est permis. Sinon renvoie les trois valeurs du parent. |
| `Foldable:getIsAIReadyToDrive(superFunc: any)` | 2174 | ✍ Surcharge renvoyant false si le dépliage par l'IA est permis et que l'outil n'est pas complètement à l'extrémité repliée de transport ; sinon délègue au parent. |
| `Foldable:getIsAIPreparingToDrive(superFunc: any)` | 2194 | ✍ Surcharge renvoyant true quand l'outil est à une position de pliage intermédiaire (ni extrémité ni milieu) avec dépliage IA permis ; sinon délègue au parent. |
| `Foldable:onDeactivate()` | 2208 | ✍ Arrête le mouvement de pliage (direction 0, sans événement) à la désactivation du véhicule, sauf si keepFoldingWhileDetached, lowerWhileDetach ou foldWhileDetach est activé. |
| `Foldable:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 2218 | ✍ Gestionnaire de l'événement d'abaissement global : appelle setFoldMiddleState avec l'indicateur d'abaissement. |
| `Foldable:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2224 | ✍ Avec lowerWhileDetach, lorsqu'attaché à une attache relevée et complètement replié, amène l'outil à la position intermédiaire (local, sans événement). |
| `Foldable:onRootVehicleChanged(rootVehicle: table)` | 2241 | ✍ Enregistre ou met à jour les actions de pliage, d'abaissement et de démarrage IA dans le contrôleur d'actions du véhicule racine, avec écouteurs d'événements IA et tests de fin ; les retire s'il n'y a pas de contrôleur. Utilise Platform.gameplay.foldAfterAIFinished. |
| `Foldable:actionControllerFoldEvent(direction: any)` | 2317 | ✍ Rappel du contrôleur d'actions pour le pliage : convertit la direction avec turnOnFoldDirection et appelle setFoldState si le pliage est autorisé. Renvoie true si traité, false si bloqué. |
| `Foldable:actionControllerLowerEvent(direction: any)` | 2348 | ✍ Rappel du contrôleur d'actions pour abaisser ou relever via l'état intermédiaire, en rejoignant la position intermédiaire de part ou d'autre. Renvoie true si une position intermédiaire est permise. |
| `Foldable:actionControllerLowerEventAIStart(direction: any)` | 2381 | ✍ Rappel du contrôleur d'actions utilisé au démarrage du travail de l'IA : amène l'outil à la position intermédiaire sauf s'il l'a déjà dépassée. Renvoie toujours true. |
| `Foldable:onPreDetach(attacherVehicle: table, implement: table)` | 2414 | ✍ Avant le détachement, avec lowerWhileDetach et l'outil en position intermédiaire il le déplie dans l'autre sens, ou avec foldWhileDetach il le replie ; local uniquement (sans événement). |
| `Foldable:onPreAttachImplement(object: table, inputJointDescIndex: table, jointDescIndex: any, loadFromSavegame: any)` | 2430 | ✍ Quand un outil utilisant l'état de pliage du parent est attelé, le suit dans subFoldingStateVehicles et lui copie le temps de pliage courant. |
| `Foldable:onPreDetachImplement(implement: table)` | 2444 | ✍ Retire des subFoldingStateVehicles un outil détaché qui utilisait l'état de pliage du parent. |
| `Foldable:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 2455 | ✍ Arrête tout mouvement de pliage (direction 0, sans événement) quand le véhicule est monté dynamiquement sur quelque chose. |
| `Foldable.setAnimTime(self: any, animTime: any, placeComponents: any, playSounds: any)` | 2463 | ✍ Fixe directement foldAnimTime : positionne l'animation de chaque foldingPart, met à jour l'état initial de Cylindered et, côté serveur (si placeComponents), replace les joints de composants. Se propage aux sous-véhicules et déclenche onFoldTimeChanged. |
| `Foldable.updateActionEventFold(self: any)` | 2520 | ✍ Met à jour le texte de l'action de pliage (plier ou déplier, selon la direction inversée) et son état actif depuis getIsFoldActionAllowed. |
| `Foldable.updateActionEventFoldMiddle(self: any)` | 2538 | ✍ Met à jour le texte de l'action d'abaissement (lever ou abaisser) et son état actif depuis getIsFoldMiddleAllowed, en respectant ignoreFoldMiddleWhileFolded. |
| `Foldable.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2565 | ✍ Rappel d'entrée du pliage : inverse la direction de pliage si permis (visant le milieu si elle correspond à turnOnFoldDirection) et synchronise l'abaissement de l'attache. Sinon affiche un avertissement clignotant pendant 2000 ms. |
| `Foldable.actionEventFoldMiddle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2601 | ✍ Rappel d'entrée de la touche d'abaissement : bascule l'état intermédiaire et aligne l'état d'abaissement de l'attache, ou délègue au gestionnaire d'abaissement du véhicule porteur quand l'état intermédiaire est ignoré. |
| `Foldable.actionEventFoldAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2649 | ✍ Rappel d'entrée qui plie ou déplie cet outil et tous les véhicules pliables du même véhicule racine dont le sens correspond, avec un avertissement clignotant si aucun n'a pu bouger. À noter : les véhicules enfants sont contrôlés avec la direction calculée pour ce véhicule, pas la leur. |
| `Foldable.externalActionEventRegister(data: any, vehicle: any)` | 2700 | ✍ Enregistre l'action de pliage externe (par déclencheur) ; à l'appui, tente de démarrer le moteur puis plie si le véhicule est alimenté ou n'en a pas besoin, sinon affiche l'avertissement d'alimentation. |
| `Foldable.externalActionEventUpdate(data: any, vehicle: any)` | 2727 | ✍ Met à jour le texte de l'action de pliage externe avec le libellé de pliage ou dépliage correspondant à la direction inversée. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onFoldStateChanged` | 228 |
| registerEvent | `onFoldTimeChanged` | 229 |
| registerFunction | `loadFoldingPartFromXML` | 235 |
| registerFunction | `setFoldDirection` | 236 |
| registerFunction | `setFoldState` | 237 |
| registerFunction | `setFoldMiddleState` | 238 |
| registerFunction | `getIsUnfolded` | 239 |
| registerFunction | `getFoldAnimTime` | 240 |
| registerFunction | `setIsFoldActionAllowed` | 241 |
| registerFunction | `getIsFoldActionAllowed` | 242 |
| registerFunction | `getIsFoldAllowed` | 243 |
| registerFunction | `getIsFoldMiddleAllowed` | 244 |
| registerFunction | `getToggledFoldDirection` | 245 |
| registerFunction | `getToggledFoldMiddleDirection` | 246 |
| registerOverwrittenFunction | `allowLoadMovingToolStates` | 252 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 253 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 254 |
| registerOverwrittenFunction | `loadSlopeCompensationNodeFromXML` | 255 |
| registerOverwrittenFunction | `getSlopeCompensationAngleScale` | 256 |
| registerOverwrittenFunction | `loadWheelFromXML` | 257 |
| registerOverwrittenFunction | `getIsVersatileYRotActive` | 258 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 259 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 260 |
| registerOverwrittenFunction | `loadGroundReferenceNode` | 261 |
| registerOverwrittenFunction | `updateGroundReferenceNode` | 262 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 263 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 264 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 265 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 266 |
| registerOverwrittenFunction | `loadMovingPartFromXML` | 267 |
| registerOverwrittenFunction | `getIsMovingPartActive` | 268 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 269 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 270 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowedWarning` | 271 |
| registerOverwrittenFunction | `getIsInWorkPosition` | 272 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 273 |
| registerOverwrittenFunction | `isDetachAllowed` | 274 |
| registerOverwrittenFunction | `isAttachAllowed` | 275 |
| registerOverwrittenFunction | `getAllowsLowering` | 276 |
| registerOverwrittenFunction | `getIsLowered` | 277 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 278 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 279 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 280 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 281 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 282 |
| registerOverwrittenFunction | `loadGroundAdjustedNodeFromXML` | 283 |
| registerOverwrittenFunction | `getIsGroundAdjustedNodeActive` | 284 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 285 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 286 |
| registerOverwrittenFunction | `getCanBeSelected` | 287 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 288 |
| registerOverwrittenFunction | `getIsInputAttacherActive` | 289 |
| registerOverwrittenFunction | `loadAdditionalCharacterFromXML` | 290 |
| registerOverwrittenFunction | `getIsAdditionalCharacterActive` | 291 |
| registerOverwrittenFunction | `getAllowDynamicMountObjects` | 292 |
| registerOverwrittenFunction | `loadSupportAnimationFromXML` | 293 |
| registerOverwrittenFunction | `getIsSupportAnimationAllowed` | 294 |
| registerOverwrittenFunction | `loadSteeringAxleFromXML` | 295 |
| registerOverwrittenFunction | `getIsSteeringAxleAllowed` | 296 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 297 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 298 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 299 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 300 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 301 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 302 |
| registerOverwrittenFunction | `loadPickupFromXML` | 303 |
| registerOverwrittenFunction | `getCanChangePickupState` | 304 |
| registerOverwrittenFunction | `loadCutterTiltFromXML` | 305 |
| registerOverwrittenFunction | `getCutterTiltIsActive` | 306 |
| registerOverwrittenFunction | `loadPreprunerNodeFromXML` | 307 |
| registerOverwrittenFunction | `getIsPreprunerNodeActive` | 308 |
| registerOverwrittenFunction | `loadShovelNode` | 309 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 310 |
| registerOverwrittenFunction | `loadSteeringAngleNodeFromXML` | 311 |
| registerOverwrittenFunction | `updateSteeringAngleNode` | 312 |
| registerOverwrittenFunction | `loadWoodHarvesterHeaderTiltFromXML` | 313 |
| registerOverwrittenFunction | `getIsWoodHarvesterTiltStateAllowed` | 314 |
| registerOverwrittenFunction | `loadSuspensionNodeFromXML` | 315 |
| registerOverwrittenFunction | `getIsSuspensionNodeActive` | 316 |
| registerOverwrittenFunction | `loadCrabSteeringModeFromXML` | 317 |
| registerOverwrittenFunction | `getCrabSteeringModeAvailable` | 318 |
| registerOverwrittenFunction | `getCanToggleCrabSteering` | 319 |
| registerOverwrittenFunction | `onLoadWheelChockFromXML` | 320 |
| registerOverwrittenFunction | `getIsWheelChockAllowed` | 321 |
| registerOverwrittenFunction | `loadCraneShovelFromXML` | 322 |
| registerOverwrittenFunction | `getCraneShovelStateChangedAllowed` | 323 |
| registerOverwrittenFunction | `getBrakeForce` | 324 |
| registerOverwrittenFunction | `getRequiresPower` | 325 |
| registerEventListener | `onLoad` | 331 |
| registerEventListener | `onPostLoad` | 332 |
| registerEventListener | `onRegistered` | 333 |
| registerEventListener | `onReadStream` | 334 |
| registerEventListener | `onWriteStream` | 335 |
| registerEventListener | `onUpdate` | 336 |
| registerEventListener | `onUpdateTick` | 337 |
| registerEventListener | `onRegisterActionEvents` | 338 |
| registerEventListener | `onRegisterExternalActionEvents` | 339 |
| registerEventListener | `onDeactivate` | 340 |
| registerEventListener | `onSetLoweredAll` | 341 |
| registerEventListener | `onPostAttach` | 342 |
| registerEventListener | `onPreDetach` | 343 |
| registerEventListener | `onRootVehicleChanged` | 344 |
| registerEventListener | `onPreAttachImplement` | 345 |
| registerEventListener | `onPreDetachImplement` | 346 |
| registerEventListener | `onDynamicMountTypeChanged` | 347 |
