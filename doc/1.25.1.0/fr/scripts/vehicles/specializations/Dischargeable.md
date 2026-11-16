# vehicles/specializations/Dischargeable.lua

*[English version](../../../../scripts/vehicles/specializations/Dischargeable.md)*

Source: `dataS/scripts/vehicles/specializations/Dischargeable.lua` — FS25 1.25.1.0

✍ Spécialisation de déchargement (spec_dischargeable) : vidage d'une unité de remplissage du véhicule (benne, vis de déchargement de moissonneuse, remorque) soit vers un objet récepteur (autre véhicule, trémie, bâtiment), soit sur le sol via la carte de densité de hauteur. Le véhicule peut avoir plusieurs « discharge nodes » (dischargeNode) dont un seul est courant (setCurrentDischargeNodeIndex).

ÉTATS. spec.currentDischargeState prend les valeurs Dischargeable.DISCHARGE_STATE_OFF, _OBJECT et _GROUND (valeurs numériques NON VÉRIFIÉES : constantes définies dans l'en-tête du fichier, vide dans le dump). Raisons de refus : DISCHARGE_REASON_* (types de remplissage non supporté, outil non supporté, pas d'accès, plus de place, etc.).

DÉTECTION DE CIBLE. Deux voies : (1) un déclencheur physique (dischargeNode.trigger, avec addTrigger) qui liste des objets ayant une unité de remplissage, sélectionne le plus proche d'après la distance au nœud « exactFillRootNode » et choisit l'objet cible ; (2) un lancer de rayon asynchrone (raycastAllAsync) depuis raycast#node vers le bas (ou vers -Y monde si useWorldNegYDirection), sur maxDistance (10 par défaut), avec le masque de collision FILLABLE + VEHICLE + TERRAIN, dont le résultat (finishDischargeRaycast) donne objet, forme, distance, ou terrain. La distance obtenue est la distance de chute utilisée par les effets (voir plus bas).

QUANTITÉS ET dt. Côté serveur seulement, à chaque tick : litres à vider = min(niveau, emptySpeed * facteur * dt) avec dt en ms ; emptySpeed vaut #emptySpeed (litres par seconde, par défaut la capacité de l'unité) divisé par 1000 et multiplié par Platform.gameplay.dischargeSpeedFactor, donc litres par ms. Le déchargement n'a lieu que quand le dernier effet du nœud est entièrement visible (lastEffect:getIsFullyVisible()). Au sol, dischargeToGround verse par DensityMapHeightUtil.tipToGroundAroundLine le long d'un segment (largeur info#width, longueur info#length, hauteur info#yOffset, 2.0 par défaut), avec un plafond de litres accumulés égal à emptySpeed*250 (soit 250 ms) ou, si plus grand, le minimum valide du type de remplissage (g_densityMapHeightManager:getMinValidLiterValue).

EFFETS DE DÉCHARGEMENT (poussière/flux). Les effets sont chargés par g_effectManager:loadEffect depuis dischargeNode.effects (schéma EffectManager.registerEffectXMLPaths) ; les classes d'effets et EffectManager sont ABSENTS du dump : leur rendu est NON VÉRIFIÉ. Le code montre : (a) le type de remplissage est transmis aux effets par g_effectManager:setEffectTypeInfo au démarrage, donc l'apparence (matière/couleur) peut dépendre du produit via la classe d'effet ; (b) la distance de chute est transmise à chaque effet qui expose setDistance(distance, g_terrainNode) (setDischargeEffectDistance), typiquement pour allonger ou couper le flux jusqu'au sol ou à la cible ; (c) l'arrêt est différé : l'effet ne s'éteint qu'effectTurnOffThreshold après la dernière demande (effectTurnOffThreshold, 0.25 par défaut ; type XML TIME : si le défaut n'est pas converti, il serait lu en ms par la comparaison avec g_time ; NON VÉRIFIÉ) ; (d) des animations liées aux effets (effectAnimationNodes) démarrent et s'arrêtent avec eux. Aucune lecture du vent, de l'humidité ni de la poussière n'apparaît dans ce fichier : le flux n'est pas modulé par la météo ici.

RÉSEAU. L'état d'effet est décidé sur le serveur (setDischargeEffectActive dans le bloc isServer d'onUpdateTick) ; il est envoyé aux clients par le flux (drapeau sale dirtyFlag) sous forme : booléen « effet actif », distance quantifiée sur 8 bits (valeur sur maxDistance, 1 à 255) et type de remplissage (FillTypeManager.SEND_NUM_BITS). Les clients appellent alors setDischargeEffectActive(..., force) et setDischargeEffectDistance. L'état de déchargement est transmis par SetDischargeStateEvent. Le son de déchargement est géré côté client (updateDischargeSound) avec le son partagé par type de remplissage (g_fillTypeManager:getSampleByFillType) cloné sur le nœud, plus un son propre #dischargeSound ; arrêt temporisé de 250 ms.

POINTS D'EXTENSION. Événements : onDischargeStateChanged, onDischargeTargetObjectChanged. Fonctions surchargées ici : getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. Fonctions conçues pour être surchargées par d'autres spécialisations (valeur par défaut simple) : getDischargeNodeEmptyFactor (1.0), getIsDischargeNodeActive (spec.isDischargeAllowed), getDischargeNodeAutomaticDischarge, handleDischargeNodeChanged (vide), handleDischarge, handleDischargeRaycast. Persistance : seul #isAllowed est sauvegardé.

- **Dischargeable** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Dischargeable.prerequisitesPresent(specializations: any)` | 41 | ✍ Exige les spécialisations FillUnit et FillVolume. |
| `Dischargeable.initSpecialization()` | 47 | ✍ Déclare le type de configuration « dischargeable », le schéma XML (clés d'un discharge node sous vehicle.dischargeable et sous chaque dischargeableConfiguration, tableaux de bord activeDischargeNode et dischargeState avec #dischargeNodeIndex) et la clé de sauvegarde #isAllowed. |
| `Dischargeable.registerXMLPaths(schema: any, basePath: any)` | 67 | ✍ Enregistre les clés XML d'un discharge node : nœud, unité de remplissage, vitesses, déclencheurs, rayon, info (largeur, longueur, décalages), effets (EffectManager.registerEffectXMLPaths), animations d'effets, sons, objets de changement d'état/distance, convertisseur de type de remplissage, #effectTurnOffThreshold, etc. |
| `Dischargeable.registerFunctions(vehicleType: any)` | 135 | ✍ Enregistre les fonctions publiques de déchargement (état, cible, effets, tests d'autorisation, raycast, nœuds). |
| `Dischargeable.registerOverwrittenFunctions(vehicleType: any)` | 184 | ✍ Surcharge cinq fonctions de base : getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. |
| `Dischargeable.registerEvents(vehicleType: any)` | 194 | ✍ Déclare les événements onDischargeStateChanged et onDischargeTargetObjectChanged. |
| `Dischargeable.registerEventListeners(vehicleType: any)` | 201 | ✍ Abonne la spécialisation au cycle de vie, au réseau, à onUpdate / onUpdateTick, aux actions d'entrée, aux niveaux de remplissage, à la désactivation et au changement d'état du véhicule. |
| `Dischargeable:onLoad(savegame: any)` | 220 | ✍ Charge les options de configuration (#requiresTipOcclusionArea, #consumePower, #stopDischargeOnDeactivate, tous vrais par défaut) et chaque dischargeNode (loadDischargeNode) en refusant les doublons de nœud, de déclencheurs et les unités de remplissage inexistantes ; construit les tables de correspondance, fixe le masque de collision du rayon (FILLABLE + VEHICLE + TERRAIN), sélectionne le nœud 1 et réserve le drapeau sale. Sans aucun nœud valide, retire les écouteurs d'événements de la spécialisation. |
| `Dischargeable:onPostLoad(savegame: any)` | 311 | ✍ Relit l'indicateur sauvegardé « isAllowed » du déchargement (sauf réinitialisation des véhicules). |
| `Dischargeable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 320 | ✍ Sauvegarde #isAllowed. |
| `Dischargeable:onRegisterDashboardValueTypes()` | 327 | ✍ Enregistre les valeurs de tableau de bord activeDischargeNode et dischargeState. |
| `Dischargeable:onDelete()` | 347 | ✍ Supprime les effets (g_effectManager:deleteEffects) et animations d'effets de chaque nœud, retire les déclencheurs de décharge et d'activation et efface leurs objets suivis. |
| `Dischargeable:onReadStream(streamId: any, connection: any)` | 391 | ✍ Côté client à la connexion : pour chaque nœud lit l'état d'effet, la distance (8 bits, proportion de maxDistance) et le type de remplissage, active ou coupe l'effet en conséquence, puis lit l'état de déchargement. |
| `Dischargeable:onWriteStream(streamId: any, connection: any)` | 413 | ✍ Côté serveur à la connexion : écrit pour chaque nœud l'état d'effet envoyé, la distance (bornée à 1..255) et le type de remplissage de déchargement, puis l'état de déchargement. |
| `Dischargeable:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 430 | ✍ Côté client : si le drapeau sale est présent, relit pour chaque nœud l'état d'effet, la distance et le type de remplissage et les applique (forcé). |
| `Dischargeable:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 452 | ✍ Côté serveur : si le drapeau sale est levé, écrit pour chaque nœud l'état d'effet, la distance quantifiée et le type de remplissage. |
| `Dischargeable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 469 | ✍ Maintient le véhicule actif tant qu'un objet est dans le déclencheur d'activation ou qu'un déchargement est en cours (raiseActive). Aucun dt utilisé. |
| `Dischargeable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 482 | ✍ Tick principal. Met à jour les actions d'entrée ; si le nœud est actif, détermine la cible (parcours des objets du déclencheur avec choix du plus proche et raisons de refus priorisées, ou lancer de rayon asynchrone), lève onDischargeTargetObjectChanged, met à jour le son, puis côté serveur : démarre le déchargement automatique si autorisé, ou, en cours de déchargement, calcule les litres (emptySpeed, facteur et dt), pilote l'effet (setDischargeEffectActive / setDischargeEffectDistance), appelle discharge puis handleDischarge, et lève le drapeau sale si la distance a varié de plus de 0.05. Éteint aussi les effets des nœuds inactifs dont la temporisation d'arrêt est écoulée et prolonge l'activité tant que les sons jouent. |
| `Dischargeable:loadDischargeNode(xmlFile: any, key: any, entry: any)` | 722 | ✍ Lit tous les paramètres d'un nœud : #node et #fillUnitIndex (obligatoires), options d'autorisation (sol, objet, véhicule, automatique, partout, mission), #emptySpeed, #effectTurnOffThreshold (0.25), type d'outil, info (largeur, longueur, décalages), déclencheur, rayon, distance max, déclencheur d'activation, convertisseur de remplissage, objets de changement (distance, état, nœud actif), effets, animation, sons et animations d'effets (client). Initialise l'état (effet inactif, dernier effet = dernier de la liste). |
| `Dischargeable:setCurrentDischargeNodeIndex(dischargeNodeIndex: any)` | 875 | ✍ Change de nœud courant : coupe l'effet, le son et les animations de l'ancien nœud, active les changements d'objet du nouveau, et met à jour l'interface côté client. Non relu en détail pour la fin. |
| `Dischargeable:getCurrentDischargeNode()` | 911 | ✍ Renvoie le discharge node courant. |
| `Dischargeable:getCurrentDischargeNodeIndex()` | 918 | ✍ Renvoie l'indice du discharge node courant. |
| `Dischargeable:getDischargeTargetObject(dischargeNode: any)` | 929 | ✍ Renvoie l'objet cible et l'indice de son unité de remplissage pour un nœud. |
| `Dischargeable:getCurrentDischargeObject(dischargeNode: any)` | 935 | ✍ Renvoie l'objet actuellement alimenté par le déchargement. |
| `Dischargeable:getRequiresTipOcclusionArea()` | 941 | ✍ Surcharge : renvoie l'option de configuration #requiresTipOcclusionArea. |
| `Dischargeable:getCanBeSelected(superFunc: any)` | 948 | ✍ Surcharge : toujours vrai. |
| `Dischargeable:getDoConsumePtoPower(superFunc: any)` | 954 | ✍ Surcharge : vrai pendant un déchargement si consumePower, sinon résultat de base. |
| `Dischargeable:getIsPowerTakeOffActive(superFunc: any)` | 960 | ✍ Surcharge : même condition que getDoConsumePtoPower. |
| `Dischargeable:getAllowLoadTriggerActivation(superFunc: any, rootVehicle: any)` | 966 | ✍ Surcharge : autorise l'activation d'un déclencheur de chargement si le résultat de base le permet, ou en déléguant à l'objet touché par le déchargement (avec garde contre la boucle sur le véhicule racine). |
| `Dischargeable:discharge(dischargeNode: any, emptyLiters: any)` | 990 | ✍ Vide emptyLiters vers l'objet cible (état OBJECT) ou vers le terrain (état GROUND) ; renvoie litres vidés et deux booléens de dépôt minimal (utile au sol). |
| `Dischargeable:dischargeToGround(dischargeNode: any, emptyLiters: any)` | 1014 | ✍ Vide au sol : accumule les litres dans litersToDrop (plafonné à emptySpeed*250 ou au minimum valide), verse le long d'une ligne via DensityMapHeightUtil.tipToGroundAroundLine, retire les litres réellement déposés de l'unité de remplissage et gère le cas du reste inférieur au minimum de dépôt. Applique le facteur du convertisseur de type de remplissage. |
| `Dischargeable:dischargeToObject(dischargeNode: any, emptyLiters: any, object: any, targetFillUnitIndex: any)` | 1066 | ✍ Vide vers l'unité de remplissage d'un objet si le type de remplissage est supporté et autorisé, applique le facteur de conversion, puis retire du véhicule la quantité effectivement acceptée. |
| `Dischargeable:setManualDischargeState(state: any, noEventSend: any)` | 1089 | ✍ Changement d'état déclenché par une action du joueur ; délègue à setDischargeState. |
| `Dischargeable:setDischargeState(state: any, noEventSend: any)` | 1095 | ✍ Change l'état de déchargement : diffuse SetDischargeStateEvent, coupe l'effet côté serveur quand l'état passe à OFF, démarre/arrête animations et sons d'état côté client, applique les objets de changement d'état, joue l'animation du nœud (avant ou arrière) et lève onDischargeStateChanged. |
| `Dischargeable:getDischargeState()` | 1144 | ✍ Renvoie l'état courant de déchargement. |
| `Dischargeable:getDischargeFillType(dischargeNode: any)` | 1150 | ✍ Renvoie le type de remplissage déchargé et le facteur de conversion (1 sans convertisseur) ; le convertisseur peut remplacer le type par un autre type de remplissage. |
| `Dischargeable:getCanDischargeToGround(dischargeNode: any)` | 1167 | ✍ Vrai si le déchargement est autorisé, le terrain est touché et, si le réservoir n'est pas vide, si le type de remplissage peut être posé au sol (DensityMapHeightUtil.getCanTipToGround). |
| `Dischargeable:getCanDischargeToLand(dischargeNode: any)` | 1192 | ✍ Vrai si le déchargement partout est autorisé, ou si les deux extrémités de la ligne de dépôt appartiennent à une parcelle accessible à la ferme active (ou à une mission de la ferme si canDischargeToMissionGround). |
| `Dischargeable:getCanDischargeAtPosition(dischargeNode: any)` | 1232 | ✍ Vérifie, si le réservoir n'est pas vide et que l'état est OFF ou GROUND, qu'il reste de la place pour déposer au minimum valide autour de la ligne de dépôt (DensityMapHeightUtil.getCanTipToGroundAroundLine). |
| `Dischargeable:getCanDischargeToObject(dischargeNode: any)` | 1270 | ✍ Vrai si un objet cible existe, supporte et autorise le type de remplissage, a de la place, accepte la ferme active et, pour un objet monté dynamiquement, si la ferme du porteur a accès. |
| `Dischargeable:getDischargeNotAllowedWarning(dischargeNode: any)` | 1320 | ✍ Construit le texte d'avertissement selon la raison du refus (ou un texte personnalisé de l'objet) avec le titre du type de remplissage. |
| `Dischargeable:getCanToggleDischargeToObject()` | 1333 | ✍ Vrai si le nœud courant autorise le déchargement vers un objet. |
| `Dischargeable:getCanToggleDischargeToGround()` | 1342 | ✍ Vrai si le nœud courant autorise le déchargement au sol et ne le démarre pas automatiquement. |
| `Dischargeable:getIsDischargeNodeActive(dischargeNode: any)` | 1361 | ✍ Renvoie spec.isDischargeAllowed (point de surcharge pour d'autres spécialisations). |
| `Dischargeable:getDischargeNodeEmptyFactor(dischargeNode: any)` | 1371 | ✍ Renvoie 1.0 : facteur de vitesse de vidage, point de surcharge (par exemple pour moduler le débit). |
| `Dischargeable:getDischargeNodeAutomaticDischarge(dischargeNode: any)` | 1377 | ✍ Renvoie l'option canStartDischargeAutomatically du nœud. |
| `Dischargeable:getDischargeNodeByNode(node: any)` | 1383 | ✍ Renvoie le discharge node associé à un nœud I3D. |
| `Dischargeable:updateRaycast(dischargeNode: any)` | 1389 | ✍ Lance le lancer de rayon asynchrone du nœud (vers le bas local ou vers -Y monde, sur maxDistance) après avoir réinitialisé les résultats ; marque le raycast comme actif. |
| `Dischargeable:updateDischargeInfo(dischargeNode: any, x: any, y: any, z: any)` | 1431 | ✍ Si info#useRaycastHitPosition est actif, place le nœud d'information sur le point d'impact du rayon. |
| `Dischargeable:raycastCallbackDischargeNode(hitActorId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, hitShapeId: any, isLast: any)` | 1439 | ✍ Rappel du lancer de rayon : analyse chaque impact (objet avec unité de remplissage, terrain ou autre), retient le plus proche et ses raisons de refus, puis conclut au dernier impact par finishDischargeRaycast. Non relu en détail. |
| `Dischargeable:finishDischargeRaycast()` | 1577 | ✍ Copie les résultats du rayon dans l'état du nœud, appelle handleDischargeRaycast, libère le drapeau asynchrone et lève onDischargeTargetObjectChanged si la cible a changé. |
| `Dischargeable:getDischargeNodeByIndex(index: any)` | 1603 | ✍ Renvoie le discharge node d'indice donné. |
| `Dischargeable:handleDischargeOnEmpty(dischargeNode: any)` | 1610 | ✍ Arrête le déchargement (état OFF sans événement diffusé) si le nœud courant a stopDischargeOnEmpty. |
| `Dischargeable:handleDischargeNodeChanged()` | 1619 | ✍ Point d'extension vide appelé au changement de nœud. |
| `Dischargeable:handleDischarge(dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 1624 | ✍ Après un vidage : si stopDischargeIfNotPossible et que rien n'a été vidé (au sol : et aucun dépôt minimal n'est en attente), repasse l'état à OFF. |
| `Dischargeable:handleDischargeRaycast(dischargeNode: any, object: any, shape: any, distance: any, illUnitIndex: any, hitTerrain: any)` | 1646 | ✍ Côté serveur : coupe le déchargement vers un objet si le rayon ne le touche plus et lance le déchargement automatique au sol si autorisé ; applique les changements d'objet selon la distance (seuil distanceObjectChangeThreshold, 0.5 par défaut). |
| `Dischargeable:handleFoundDischargeObject(dischargeNode: any)` | 1669 | ✍ Quand une cible est trouvée et que le déchargement automatique est permis, passe en état OBJECT. |
| `Dischargeable:setDischargeEffectDistance(dischargeNode: any, distance: any)` | 1677 | ✍ Si l'effet du nœud est actif et la distance finie, appelle effect:setDistance(distance, g_terrainNode) sur chaque effet qui l'expose. Le sens exact côté effet est NON VÉRIFIÉ (classes d'effets absentes). |
| `Dischargeable:setDischargeEffectActive(dischargeNode: any, isActive: any, force: any, fillTypeIndex: any)` | 1691 | ✍ Démarre ou arrête les effets et animations d'effets d'un nœud. Au démarrage : renseigne le type de remplissage (g_effectManager:setEffectTypeInfo) puis g_effectManager:startEffects. À l'arrêt non forcé : programme l'arrêt à g_time + effectTurnOffThreshold ; forcé : arrête immédiatement (stopEffects). Côté serveur lève le drapeau sale quand l'état change (pour les clients). |
| `Dischargeable:updateDischargeSound(dischargeNode: any, dt: any)` | 1732 | ✍ Client : joue le son partagé du type de remplissage (cloné sur le nœud, remplacé quand le type change) et le son propre du nœud tant que l'effet est actif ou que le dernier effet reste visible ; temporise l'arrêt de 250 ms décompté avec dt. |
| `Dischargeable:dischargeTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1795 | ✍ Rappel du déclencheur de décharge : suit les objets (avec unité de remplissage) entrant ou sortant, en mémorisant forme et indice d'unité, et s'abonne à leur suppression. Non relu en détail. |
| `Dischargeable:onDeleteDischargeTriggerObject(object: any)` | 1845 | ✍ Retire un objet supprimé de la liste du déclencheur de décharge. |
| `Dischargeable:dischargeActivationTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1867 | ✍ Rappel du déclencheur d'activation : suit les objets présents pour garder le véhicule actif. Non relu en détail. |
| `Dischargeable:onDeleteActivationTriggerObject(object: any)` | 1905 | ✍ Retire un objet supprimé de la liste du déclencheur d'activation. |
| `Dischargeable:setForcedFillTypeIndex(fillTypeIndex: any)` | 1919 | ✍ Impose un type de remplissage pour le test de compatibilité avec les cibles (spec.forcedFillTypeIndex). |
| `Dischargeable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1925 | ✍ Enregistre les actions TOGGLE_TIPSTATE_GROUND et TOGGLE_TIPSTATE (avec priorités) si le nœud courant les autorise. |
| `Dischargeable:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1947 | ✍ Si l'unité de remplissage d'un nœud est vide, appelle handleDischargeOnEmpty. |
| `Dischargeable:onDeactivate()` | 1961 | ✍ Arrête le déchargement si stopDischargeOnDeactivate. |
| `Dischargeable:onStateChange(state: any, data: any)` | 1972 | ✍ À l'arrêt moteur sans alimentation (VehicleStateChange.MOTOR_TURN_OFF et véhicule non alimenté), arrête le déchargement si stopDischargeOnDeactivate. |
| `Dischargeable:updateDebugValues(values: any)` | 1987 | ✍ Ajoute des valeurs de débogage (par exemple effet actif, prêt au déchargement) à l'affichage de debug du véhicule. |
| `Dischargeable.actionEventToggleDischargeToGround(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2024 | ✍ Rappel d'entrée : démarre ou arrête le vidage au sol, en vérifiant la possibilité, l'accès au terrain et l'emplacement, sinon affiche un avertissement. |
| `Dischargeable.actionEventToggleDischarging(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2048 | ✍ Rappel d'entrée : démarre ou arrête le vidage vers un objet, avec avertissement si la cible refuse. |
| `Dischargeable.updateActionEvents(self: any)` | 2070 | ✍ Met à jour le texte et la visibilité des actions de déchargement (démarrer le transfert, vider au sol, arrêter). |
| `Dischargeable.dashboardDischargeAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 2113 | ✍ Lit l'attribut de tableau de bord #dischargeNodeIndex pour la valeur activeDischargeNode. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadDischargeNode` | 136 |
| registerFunction | `setCurrentDischargeNodeIndex` | 137 |
| registerFunction | `getCurrentDischargeNode` | 138 |
| registerFunction | `getCurrentDischargeNodeIndex` | 139 |
| registerFunction | `getDischargeTargetObject` | 140 |
| registerFunction | `getCurrentDischargeObject` | 141 |
| registerFunction | `discharge` | 142 |
| registerFunction | `dischargeToGround` | 143 |
| registerFunction | `dischargeToObject` | 144 |
| registerFunction | `setManualDischargeState` | 145 |
| registerFunction | `setDischargeState` | 146 |
| registerFunction | `getDischargeState` | 147 |
| registerFunction | `getDischargeFillType` | 148 |
| registerFunction | `getCanDischargeToGround` | 149 |
| registerFunction | `getCanDischargeAtPosition` | 150 |
| registerFunction | `getCanDischargeToLand` | 151 |
| registerFunction | `getCanDischargeToObject` | 152 |
| registerFunction | `getDischargeNotAllowedWarning` | 153 |
| registerFunction | `getCanToggleDischargeToObject` | 154 |
| registerFunction | `getCanToggleDischargeToGround` | 155 |
| registerFunction | `getIsPossibleToDischargeToObject` | 156 |
| registerFunction | `getIsDischargeNodeActive` | 157 |
| registerFunction | `setIsDischargeAllowed` | 158 |
| registerFunction | `getDischargeNodeEmptyFactor` | 159 |
| registerFunction | `getDischargeNodeAutomaticDischarge` | 160 |
| registerFunction | `getDischargeNodeByNode` | 161 |
| registerFunction | `updateRaycast` | 162 |
| registerFunction | `updateDischargeInfo` | 163 |
| registerFunction | `raycastCallbackDischargeNode` | 164 |
| registerFunction | `finishDischargeRaycast` | 165 |
| registerFunction | `getDischargeNodeByIndex` | 166 |
| registerFunction | `handleDischargeOnEmpty` | 167 |
| registerFunction | `handleDischargeNodeChanged` | 168 |
| registerFunction | `handleDischarge` | 169 |
| registerFunction | `handleDischargeRaycast` | 170 |
| registerFunction | `handleFoundDischargeObject` | 171 |
| registerFunction | `setDischargeEffectDistance` | 172 |
| registerFunction | `setDischargeEffectActive` | 173 |
| registerFunction | `updateDischargeSound` | 174 |
| registerFunction | `dischargeTriggerCallback` | 175 |
| registerFunction | `onDeleteDischargeTriggerObject` | 176 |
| registerFunction | `dischargeActivationTriggerCallback` | 177 |
| registerFunction | `onDeleteActivationTriggerObject` | 178 |
| registerFunction | `setForcedFillTypeIndex` | 179 |
| registerOverwrittenFunction | `getRequiresTipOcclusionArea` | 185 |
| registerOverwrittenFunction | `getCanBeSelected` | 186 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 187 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 188 |
| registerOverwrittenFunction | `getAllowLoadTriggerActivation` | 189 |
| registerEvent | `onDischargeStateChanged` | 195 |
| registerEvent | `onDischargeTargetObjectChanged` | 196 |
| registerEventListener | `onLoad` | 202 |
| registerEventListener | `onPostLoad` | 203 |
| registerEventListener | `onRegisterDashboardValueTypes` | 204 |
| registerEventListener | `onDelete` | 205 |
| registerEventListener | `onReadStream` | 206 |
| registerEventListener | `onWriteStream` | 207 |
| registerEventListener | `onReadUpdateStream` | 208 |
| registerEventListener | `onWriteUpdateStream` | 209 |
| registerEventListener | `onUpdate` | 210 |
| registerEventListener | `onUpdateTick` | 211 |
| registerEventListener | `onRegisterActionEvents` | 212 |
| registerEventListener | `onFillUnitFillLevelChanged` | 213 |
| registerEventListener | `onDeactivate` | 214 |
| registerEventListener | `onStateChange` | 215 |
