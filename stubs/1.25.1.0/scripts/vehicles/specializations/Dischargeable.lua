---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Dischargeable.lua (stub généré, atlas Lua FS25)

--- Spécialisation de déchargement (spec_dischargeable) : vidage d'une unité de remplissage du véhicule (benne, vis de déchargement de moissonneuse, remorque) soit vers un objet récepteur (autre véhicule, trémie, bâtiment), soit sur le sol via la carte de densité de hauteur. Le véhicule peut avoir plusieurs « discharge nodes » (dischargeNode) dont un seul est courant (setCurrentDischargeNodeIndex).
--- 
--- ÉTATS. spec.currentDischargeState prend les valeurs Dischargeable.DISCHARGE_STATE_OFF, _OBJECT et _GROUND (valeurs numériques NON VÉRIFIÉES : constantes définies dans l'en-tête du fichier, vide dans le dump). Raisons de refus : DISCHARGE_REASON_* (types de remplissage non supporté, outil non supporté, pas d'accès, plus de place, etc.).
--- 
--- DÉTECTION DE CIBLE. Deux voies : (1) un déclencheur physique (dischargeNode.trigger, avec addTrigger) qui liste des objets ayant une unité de remplissage, sélectionne le plus proche d'après la distance au nœud « exactFillRootNode » et choisit l'objet cible ; (2) un lancer de rayon asynchrone (raycastAllAsync) depuis raycast#node vers le bas (ou vers -Y monde si useWorldNegYDirection), sur maxDistance (10 par défaut), avec le masque de collision FILLABLE + VEHICLE + TERRAIN, dont le résultat (finishDischargeRaycast) donne objet, forme, distance, ou terrain. La distance obtenue est la distance de chute utilisée par les effets (voir plus bas).
--- 
--- QUANTITÉS ET dt. Côté serveur seulement, à chaque tick : litres à vider = min(niveau, emptySpeed * facteur * dt) avec dt en ms ; emptySpeed vaut #emptySpeed (litres par seconde, par défaut la capacité de l'unité) divisé par 1000 et multiplié par Platform.gameplay.dischargeSpeedFactor, donc litres par ms. Le déchargement n'a lieu que quand le dernier effet du nœud est entièrement visible (lastEffect:getIsFullyVisible()). Au sol, dischargeToGround verse par DensityMapHeightUtil.tipToGroundAroundLine le long d'un segment (largeur info#width, longueur info#length, hauteur info#yOffset, 2.0 par défaut), avec un plafond de litres accumulés égal à emptySpeed*250 (soit 250 ms) ou, si plus grand, le minimum valide du type de remplissage (g_densityMapHeightManager:getMinValidLiterValue).
--- 
--- EFFETS DE DÉCHARGEMENT (poussière/flux). Les effets sont chargés par g_effectManager:loadEffect depuis dischargeNode.effects (schéma EffectManager.registerEffectXMLPaths) ; les classes d'effets et EffectManager sont ABSENTS du dump : leur rendu est NON VÉRIFIÉ. Le code montre : (a) le type de remplissage est transmis aux effets par g_effectManager:setEffectTypeInfo au démarrage, donc l'apparence (matière/couleur) peut dépendre du produit via la classe d'effet ; (b) la distance de chute est transmise à chaque effet qui expose setDistance(distance, g_terrainNode) (setDischargeEffectDistance), typiquement pour allonger ou couper le flux jusqu'au sol ou à la cible ; (c) l'arrêt est différé : l'effet ne s'éteint qu'effectTurnOffThreshold après la dernière demande (effectTurnOffThreshold, 0.25 par défaut ; type XML TIME : si le défaut n'est pas converti, il serait lu en ms par la comparaison avec g_time ; NON VÉRIFIÉ) ; (d) des animations liées aux effets (effectAnimationNodes) démarrent et s'arrêtent avec eux. Aucune lecture du vent, de l'humidité ni de la poussière n'apparaît dans ce fichier : le flux n'est pas modulé par la météo ici.
--- 
--- RÉSEAU. L'état d'effet est décidé sur le serveur (setDischargeEffectActive dans le bloc isServer d'onUpdateTick) ; il est envoyé aux clients par le flux (drapeau sale dirtyFlag) sous forme : booléen « effet actif », distance quantifiée sur 8 bits (valeur sur maxDistance, 1 à 255) et type de remplissage (FillTypeManager.SEND_NUM_BITS). Les clients appellent alors setDischargeEffectActive(..., force) et setDischargeEffectDistance. L'état de déchargement est transmis par SetDischargeStateEvent. Le son de déchargement est géré côté client (updateDischargeSound) avec le son partagé par type de remplissage (g_fillTypeManager:getSampleByFillType) cloné sur le nœud, plus un son propre #dischargeSound ; arrêt temporisé de 250 ms.
--- 
--- POINTS D'EXTENSION. Événements : onDischargeStateChanged, onDischargeTargetObjectChanged. Fonctions surchargées ici : getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation. Fonctions conçues pour être surchargées par d'autres spécialisations (valeur par défaut simple) : getDischargeNodeEmptyFactor (1.0), getIsDischargeNodeActive (spec.isDischargeAllowed), getDischargeNodeAutomaticDischarge, handleDischargeNodeChanged (vide), handleDischarge, handleDischargeRaycast. Persistance : seul #isAllowed est sauvegardé.
---@class Dischargeable
Dischargeable = {}

--- Exige les spécialisations FillUnit et FillVolume.
---@param specializations any
function Dischargeable.prerequisitesPresent(specializations) end

--- Déclare le type de configuration « dischargeable », le schéma XML (clés d'un discharge node sous vehicle.dischargeable et sous chaque dischargeableConfiguration, tableaux de bord activeDischargeNode et dischargeState avec #dischargeNodeIndex) et la clé de sauvegarde #isAllowed.
function Dischargeable.initSpecialization() end

--- Enregistre les clés XML d'un discharge node : nœud, unité de remplissage, vitesses, déclencheurs, rayon, info (largeur, longueur, décalages), effets (EffectManager.registerEffectXMLPaths), animations d'effets, sons, objets de changement d'état/distance, convertisseur de type de remplissage, #effectTurnOffThreshold, etc.
---@param schema any
---@param basePath any
function Dischargeable.registerXMLPaths(schema, basePath) end

--- Enregistre les fonctions publiques de déchargement (état, cible, effets, tests d'autorisation, raycast, nœuds).
---@param vehicleType any
function Dischargeable.registerFunctions(vehicleType) end

--- Surcharge cinq fonctions de base : getRequiresTipOcclusionArea, getCanBeSelected, getDoConsumePtoPower, getIsPowerTakeOffActive, getAllowLoadTriggerActivation.
---@param vehicleType any
function Dischargeable.registerOverwrittenFunctions(vehicleType) end

--- Déclare les événements onDischargeStateChanged et onDischargeTargetObjectChanged.
---@param vehicleType any
function Dischargeable.registerEvents(vehicleType) end

--- Abonne la spécialisation au cycle de vie, au réseau, à onUpdate / onUpdateTick, aux actions d'entrée, aux niveaux de remplissage, à la désactivation et au changement d'état du véhicule.
---@param vehicleType any
function Dischargeable.registerEventListeners(vehicleType) end

--- Charge les options de configuration (#requiresTipOcclusionArea, #consumePower, #stopDischargeOnDeactivate, tous vrais par défaut) et chaque dischargeNode (loadDischargeNode) en refusant les doublons de nœud, de déclencheurs et les unités de remplissage inexistantes ; construit les tables de correspondance, fixe le masque de collision du rayon (FILLABLE + VEHICLE + TERRAIN), sélectionne le nœud 1 et réserve le drapeau sale. Sans aucun nœud valide, retire les écouteurs d'événements de la spécialisation.
---@param savegame any
function Dischargeable:onLoad(savegame) end

--- Relit l'indicateur sauvegardé « isAllowed » du déchargement (sauf réinitialisation des véhicules).
---@param savegame any
function Dischargeable:onPostLoad(savegame) end

--- Sauvegarde #isAllowed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Dischargeable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Enregistre les valeurs de tableau de bord activeDischargeNode et dischargeState.
function Dischargeable:onRegisterDashboardValueTypes() end

--- Supprime les effets (g_effectManager:deleteEffects) et animations d'effets de chaque nœud, retire les déclencheurs de décharge et d'activation et efface leurs objets suivis.
function Dischargeable:onDelete() end

--- Côté client à la connexion : pour chaque nœud lit l'état d'effet, la distance (8 bits, proportion de maxDistance) et le type de remplissage, active ou coupe l'effet en conséquence, puis lit l'état de déchargement.
---@param streamId any
---@param connection any
function Dischargeable:onReadStream(streamId, connection) end

--- Côté serveur à la connexion : écrit pour chaque nœud l'état d'effet envoyé, la distance (bornée à 1..255) et le type de remplissage de déchargement, puis l'état de déchargement.
---@param streamId any
---@param connection any
function Dischargeable:onWriteStream(streamId, connection) end

--- Côté client : si le drapeau sale est présent, relit pour chaque nœud l'état d'effet, la distance et le type de remplissage et les applique (forcé).
---@param streamId any
---@param timestamp any
---@param connection any
function Dischargeable:onReadUpdateStream(streamId, timestamp, connection) end

--- Côté serveur : si le drapeau sale est levé, écrit pour chaque nœud l'état d'effet, la distance quantifiée et le type de remplissage.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Dischargeable:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Maintient le véhicule actif tant qu'un objet est dans le déclencheur d'activation ou qu'un déchargement est en cours (raiseActive). Aucun dt utilisé.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dischargeable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Tick principal. Met à jour les actions d'entrée ; si le nœud est actif, détermine la cible (parcours des objets du déclencheur avec choix du plus proche et raisons de refus priorisées, ou lancer de rayon asynchrone), lève onDischargeTargetObjectChanged, met à jour le son, puis côté serveur : démarre le déchargement automatique si autorisé, ou, en cours de déchargement, calcule les litres (emptySpeed, facteur et dt), pilote l'effet (setDischargeEffectActive / setDischargeEffectDistance), appelle discharge puis handleDischarge, et lève le drapeau sale si la distance a varié de plus de 0.05. Éteint aussi les effets des nœuds inactifs dont la temporisation d'arrêt est écoulée et prolonge l'activité tant que les sons jouent.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Dischargeable:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Lit tous les paramètres d'un nœud : #node et #fillUnitIndex (obligatoires), options d'autorisation (sol, objet, véhicule, automatique, partout, mission), #emptySpeed, #effectTurnOffThreshold (0.25), type d'outil, info (largeur, longueur, décalages), déclencheur, rayon, distance max, déclencheur d'activation, convertisseur de remplissage, objets de changement (distance, état, nœud actif), effets, animation, sons et animations d'effets (client). Initialise l'état (effet inactif, dernier effet = dernier de la liste).
---@param xmlFile any
---@param key any
---@param entry any
function Dischargeable:loadDischargeNode(xmlFile, key, entry) end

--- Change de nœud courant : coupe l'effet, le son et les animations de l'ancien nœud, active les changements d'objet du nouveau, et met à jour l'interface côté client. Non relu en détail pour la fin.
---@param dischargeNodeIndex any
function Dischargeable:setCurrentDischargeNodeIndex(dischargeNodeIndex) end

--- Renvoie le discharge node courant.
function Dischargeable:getCurrentDischargeNode() end

--- Renvoie l'indice du discharge node courant.
function Dischargeable:getCurrentDischargeNodeIndex() end

--- Renvoie l'objet cible et l'indice de son unité de remplissage pour un nœud.
---@param dischargeNode any
function Dischargeable:getDischargeTargetObject(dischargeNode) end

--- Renvoie l'objet actuellement alimenté par le déchargement.
---@param dischargeNode any
function Dischargeable:getCurrentDischargeObject(dischargeNode) end

--- Surcharge : renvoie l'option de configuration #requiresTipOcclusionArea.
function Dischargeable:getRequiresTipOcclusionArea() end

--- Surcharge : toujours vrai.
---@param superFunc any
function Dischargeable:getCanBeSelected(superFunc) end

--- Surcharge : vrai pendant un déchargement si consumePower, sinon résultat de base.
---@param superFunc any
function Dischargeable:getDoConsumePtoPower(superFunc) end

--- Surcharge : même condition que getDoConsumePtoPower.
---@param superFunc any
function Dischargeable:getIsPowerTakeOffActive(superFunc) end

--- Surcharge : autorise l'activation d'un déclencheur de chargement si le résultat de base le permet, ou en déléguant à l'objet touché par le déchargement (avec garde contre la boucle sur le véhicule racine).
---@param superFunc any
---@param rootVehicle any
function Dischargeable:getAllowLoadTriggerActivation(superFunc, rootVehicle) end

--- Vide emptyLiters vers l'objet cible (état OBJECT) ou vers le terrain (état GROUND) ; renvoie litres vidés et deux booléens de dépôt minimal (utile au sol).
---@param dischargeNode any
---@param emptyLiters any
function Dischargeable:discharge(dischargeNode, emptyLiters) end

--- Vide au sol : accumule les litres dans litersToDrop (plafonné à emptySpeed*250 ou au minimum valide), verse le long d'une ligne via DensityMapHeightUtil.tipToGroundAroundLine, retire les litres réellement déposés de l'unité de remplissage et gère le cas du reste inférieur au minimum de dépôt. Applique le facteur du convertisseur de type de remplissage.
---@param dischargeNode any
---@param emptyLiters any
function Dischargeable:dischargeToGround(dischargeNode, emptyLiters) end

--- Vide vers l'unité de remplissage d'un objet si le type de remplissage est supporté et autorisé, applique le facteur de conversion, puis retire du véhicule la quantité effectivement acceptée.
---@param dischargeNode any
---@param emptyLiters any
---@param object any
---@param targetFillUnitIndex any
function Dischargeable:dischargeToObject(dischargeNode, emptyLiters, object, targetFillUnitIndex) end

--- Changement d'état déclenché par une action du joueur ; délègue à setDischargeState.
---@param state any
---@param noEventSend any
function Dischargeable:setManualDischargeState(state, noEventSend) end

--- Change l'état de déchargement : diffuse SetDischargeStateEvent, coupe l'effet côté serveur quand l'état passe à OFF, démarre/arrête animations et sons d'état côté client, applique les objets de changement d'état, joue l'animation du nœud (avant ou arrière) et lève onDischargeStateChanged.
---@param state any
---@param noEventSend any
function Dischargeable:setDischargeState(state, noEventSend) end

--- Renvoie l'état courant de déchargement.
function Dischargeable:getDischargeState() end

--- Renvoie le type de remplissage déchargé et le facteur de conversion (1 sans convertisseur) ; le convertisseur peut remplacer le type par un autre type de remplissage.
---@param dischargeNode any
function Dischargeable:getDischargeFillType(dischargeNode) end

--- Vrai si le déchargement est autorisé, le terrain est touché et, si le réservoir n'est pas vide, si le type de remplissage peut être posé au sol (DensityMapHeightUtil.getCanTipToGround).
---@param dischargeNode any
function Dischargeable:getCanDischargeToGround(dischargeNode) end

--- Vrai si le déchargement partout est autorisé, ou si les deux extrémités de la ligne de dépôt appartiennent à une parcelle accessible à la ferme active (ou à une mission de la ferme si canDischargeToMissionGround).
---@param dischargeNode any
function Dischargeable:getCanDischargeToLand(dischargeNode) end

--- Vérifie, si le réservoir n'est pas vide et que l'état est OFF ou GROUND, qu'il reste de la place pour déposer au minimum valide autour de la ligne de dépôt (DensityMapHeightUtil.getCanTipToGroundAroundLine).
---@param dischargeNode any
function Dischargeable:getCanDischargeAtPosition(dischargeNode) end

--- Vrai si un objet cible existe, supporte et autorise le type de remplissage, a de la place, accepte la ferme active et, pour un objet monté dynamiquement, si la ferme du porteur a accès.
---@param dischargeNode any
function Dischargeable:getCanDischargeToObject(dischargeNode) end

--- Construit le texte d'avertissement selon la raison du refus (ou un texte personnalisé de l'objet) avec le titre du type de remplissage.
---@param dischargeNode any
function Dischargeable:getDischargeNotAllowedWarning(dischargeNode) end

--- Vrai si le nœud courant autorise le déchargement vers un objet.
function Dischargeable:getCanToggleDischargeToObject() end

--- Vrai si le nœud courant autorise le déchargement au sol et ne le démarre pas automatiquement.
function Dischargeable:getCanToggleDischargeToGround() end

--- Renvoie spec.isDischargeAllowed (point de surcharge pour d'autres spécialisations).
---@param dischargeNode any
function Dischargeable:getIsDischargeNodeActive(dischargeNode) end

--- Renvoie 1.0 : facteur de vitesse de vidage, point de surcharge (par exemple pour moduler le débit).
---@param dischargeNode any
function Dischargeable:getDischargeNodeEmptyFactor(dischargeNode) end

--- Renvoie l'option canStartDischargeAutomatically du nœud.
---@param dischargeNode any
function Dischargeable:getDischargeNodeAutomaticDischarge(dischargeNode) end

--- Renvoie le discharge node associé à un nœud I3D.
---@param node any
function Dischargeable:getDischargeNodeByNode(node) end

--- Lance le lancer de rayon asynchrone du nœud (vers le bas local ou vers -Y monde, sur maxDistance) après avoir réinitialisé les résultats ; marque le raycast comme actif.
---@param dischargeNode any
function Dischargeable:updateRaycast(dischargeNode) end

--- Si info#useRaycastHitPosition est actif, place le nœud d'information sur le point d'impact du rayon.
---@param dischargeNode any
---@param x any
---@param y any
---@param z any
function Dischargeable:updateDischargeInfo(dischargeNode, x, y, z) end

--- Rappel du lancer de rayon : analyse chaque impact (objet avec unité de remplissage, terrain ou autre), retient le plus proche et ses raisons de refus, puis conclut au dernier impact par finishDischargeRaycast. Non relu en détail.
---@param hitActorId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Dischargeable:raycastCallbackDischargeNode(hitActorId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Copie les résultats du rayon dans l'état du nœud, appelle handleDischargeRaycast, libère le drapeau asynchrone et lève onDischargeTargetObjectChanged si la cible a changé.
function Dischargeable:finishDischargeRaycast() end

--- Renvoie le discharge node d'indice donné.
---@param index any
function Dischargeable:getDischargeNodeByIndex(index) end

--- Arrête le déchargement (état OFF sans événement diffusé) si le nœud courant a stopDischargeOnEmpty.
---@param dischargeNode any
function Dischargeable:handleDischargeOnEmpty(dischargeNode) end

--- Point d'extension vide appelé au changement de nœud.
function Dischargeable:handleDischargeNodeChanged() end

--- Après un vidage : si stopDischargeIfNotPossible et que rien n'a été vidé (au sol : et aucun dépôt minimal n'est en attente), repasse l'état à OFF.
---@param dischargeNode any
---@param dischargedLiters any
---@param minDropReached any
---@param hasMinDropFillLevel any
function Dischargeable:handleDischarge(dischargeNode, dischargedLiters, minDropReached, hasMinDropFillLevel) end

--- Côté serveur : coupe le déchargement vers un objet si le rayon ne le touche plus et lance le déchargement automatique au sol si autorisé ; applique les changements d'objet selon la distance (seuil distanceObjectChangeThreshold, 0.5 par défaut).
---@param dischargeNode any
---@param object any
---@param shape any
---@param distance any
---@param illUnitIndex any
---@param hitTerrain any
function Dischargeable:handleDischargeRaycast(dischargeNode, object, shape, distance, illUnitIndex, hitTerrain) end

--- Quand une cible est trouvée et que le déchargement automatique est permis, passe en état OBJECT.
---@param dischargeNode any
function Dischargeable:handleFoundDischargeObject(dischargeNode) end

--- Si l'effet du nœud est actif et la distance finie, appelle effect:setDistance(distance, g_terrainNode) sur chaque effet qui l'expose. Le sens exact côté effet est NON VÉRIFIÉ (classes d'effets absentes).
---@param dischargeNode any
---@param distance any
function Dischargeable:setDischargeEffectDistance(dischargeNode, distance) end

--- Démarre ou arrête les effets et animations d'effets d'un nœud. Au démarrage : renseigne le type de remplissage (g_effectManager:setEffectTypeInfo) puis g_effectManager:startEffects. À l'arrêt non forcé : programme l'arrêt à g_time + effectTurnOffThreshold ; forcé : arrête immédiatement (stopEffects). Côté serveur lève le drapeau sale quand l'état change (pour les clients).
---@param dischargeNode any
---@param isActive any
---@param force any
---@param fillTypeIndex any
function Dischargeable:setDischargeEffectActive(dischargeNode, isActive, force, fillTypeIndex) end

--- Client : joue le son partagé du type de remplissage (cloné sur le nœud, remplacé quand le type change) et le son propre du nœud tant que l'effet est actif ou que le dernier effet reste visible ; temporise l'arrêt de 250 ms décompté avec dt.
---@param dischargeNode any
---@param dt any
function Dischargeable:updateDischargeSound(dischargeNode, dt) end

--- Rappel du déclencheur de décharge : suit les objets (avec unité de remplissage) entrant ou sortant, en mémorisant forme et indice d'unité, et s'abonne à leur suppression. Non relu en détail.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Dischargeable:dischargeTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Retire un objet supprimé de la liste du déclencheur de décharge.
---@param object any
function Dischargeable:onDeleteDischargeTriggerObject(object) end

--- Rappel du déclencheur d'activation : suit les objets présents pour garder le véhicule actif. Non relu en détail.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function Dischargeable:dischargeActivationTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Retire un objet supprimé de la liste du déclencheur d'activation.
---@param object any
function Dischargeable:onDeleteActivationTriggerObject(object) end

--- Impose un type de remplissage pour le test de compatibilité avec les cibles (spec.forcedFillTypeIndex).
---@param fillTypeIndex any
function Dischargeable:setForcedFillTypeIndex(fillTypeIndex) end

--- Enregistre les actions TOGGLE_TIPSTATE_GROUND et TOGGLE_TIPSTATE (avec priorités) si le nœud courant les autorise.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Dischargeable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Si l'unité de remplissage d'un nœud est vide, appelle handleDischargeOnEmpty.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Dischargeable:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Arrête le déchargement si stopDischargeOnDeactivate.
function Dischargeable:onDeactivate() end

--- À l'arrêt moteur sans alimentation (VehicleStateChange.MOTOR_TURN_OFF et véhicule non alimenté), arrête le déchargement si stopDischargeOnDeactivate.
---@param state any
---@param data any
function Dischargeable:onStateChange(state, data) end

--- Ajoute des valeurs de débogage (par exemple effet actif, prêt au déchargement) à l'affichage de debug du véhicule.
---@param values any
function Dischargeable:updateDebugValues(values) end

--- Rappel d'entrée : démarre ou arrête le vidage au sol, en vérifiant la possibilité, l'accès au terrain et l'emplacement, sinon affiche un avertissement.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Dischargeable.actionEventToggleDischargeToGround(self, actionName, inputValue, callbackState, isAnalog) end

--- Rappel d'entrée : démarre ou arrête le vidage vers un objet, avec avertissement si la cible refuse.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Dischargeable.actionEventToggleDischarging(self, actionName, inputValue, callbackState, isAnalog) end

--- Met à jour le texte et la visibilité des actions de déchargement (démarrer le transfert, vider au sol, arrêter).
---@param self any
function Dischargeable.updateActionEvents(self) end

--- Lit l'attribut de tableau de bord #dischargeNodeIndex pour la valeur activeDischargeNode.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Dischargeable.dashboardDischargeAttributes(self, xmlFile, key, dashboard, isActive) end
