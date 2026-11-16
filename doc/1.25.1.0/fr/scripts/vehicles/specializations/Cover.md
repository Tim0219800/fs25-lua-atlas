# vehicles/specializations/Cover.lua

*[English version](../../../../scripts/vehicles/specializations/Cover.md)*

Source: `dataS/scripts/vehicles/specializations/Cover.lua` — FS25 1.25.1.0

✍ Spécialisation qui ajoute une ou plusieurs bâches animées à un véhicule, liées à des unités de remplissage. Une bâche a un état numéroté (0 = tout fermé, N = bâche N ouverte), basculé par le joueur, ouvert automatiquement lors du basculement de benne ou quand un déclencheur de remplissage est à portée, et synchronisé via SetCoverStateEvent. Nécessite AnimatedVehicle ; charge ses bâches depuis la configuration 'cover', sauvegarde l'état par véhicule et conditionne aussi les changements d'état du tuyau et certains types d'outils.

- **Cover** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Cover.prerequisitesPresent(specializations: any)` | 21 | ✍ Renvoie true seulement si le type de véhicule possède la spécialisation AnimatedVehicle, dont dépendent les animations de bâche. |
| `Cover.initSpecialization()` | 27 | ✍ Enregistre le type de configuration 'cover' et les entrées de schéma XML (animations, indices d'unités de remplissage, types d'outils bloqués, textes, limites de bâche du tuyau), ainsi que la clé de sauvegarde de l'état de la bâche. |
| `Cover.registerFunctions(vehicleType: any)` | 62 | ✍ Enregistre sur le type de véhicule les fonctions de bâche : chargement XML, changement d'état et contrôles d'autorisation, lecture d'animation et recherche d'une bâche par unité de remplissage. |
| `Cover.registerOverwrittenFunctions(vehicleType: any)` | 73 | ✍ Enregistre des surcharges : prise en charge des outils par unité de remplissage, sélection, chargement du tuyau et autorisation de son état, hooks IA de chargement/déchargement et rappel de présence dans un déclencheur. |
| `Cover.registerEventListeners(vehicleType: any)` | 86 | ✍ Abonne la spécialisation aux événements de chargement, post-chargement, lecture/écriture de flux, mise à jour, enregistrement des actions, basculement, porte arrière et déclencheurs de remplissage. |
| `Cover:onLoad(savegame: any)` | 101 | ✍ Lit les bâches de la configuration 'cover' choisie, construit la table unité de remplissage vers bâches, charge options et textes, et retire les écouteurs de mise à jour/réseau/entrée si aucune bâche valide n'existe. |
| `Cover:onPostLoad(savegame: any)` | 165 | ✍ Restaure l'état de la bâche depuis la sauvegarde, ou depuis l'option 'openOnBuy' pour un véhicule neuf, l'applique et avance toutes les animations en attente à leur fin pour un rendu immédiatement correct. |
| `Cover:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 197 | ✍ Écrit l'état courant de la bâche dans la sauvegarde si le véhicule en possède. |
| `Cover:onReadStream(streamId: any, connection: any)` | 207 | ✍ Côté client à la connexion : lit l'état de la bâche dans le flux, l'applique sans envoyer d'événement et termine les animations instantanément. |
| `Cover:onWriteStream(streamId: any, connection: any)` | 224 | ✍ Côté serveur : écrit l'état courant de la bâche dans le flux pour un client qui rejoint. |
| `Cover:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 232 | ✍ Pilote la file d'animations de bâche (remplace une animation répétée, lance la suivante quand la courante se termine). Si 'closeCoverIfNotAllowed' est actif, ferme la bâche quand l'état suivant n'est pas autorisé. |
| `Cover:loadCoverFromXML(xmlFile: any, key: any, cover: any)` | 275 | ✍ Charge une entrée de bâche dans la table fournie (animations, temps de début/fin, ouverture à l'achat, comportement au basculement et aux déclencheurs, unités de remplissage, types d'outils bloqués). Renvoie false avec un avertissement si l'animation d'ouverture ou les indices manquent. |
| `Cover:setCoverState(state: any, noEventSend: any)` | 314 | ✍ Change l'état de la bâche (0 ferme tout). Envoie SetCoverStateEvent sauf si noEventSend, met en file l'animation de fermeture de l'ancienne bâche et d'ouverture de la nouvelle, puis met à jour le texte d'action. Ignoré si l'état est invalide ou inchangé. |
| `Cover:playCoverAnimation(animation: any)` | 357 | ✍ Joue une entrée d'animation de bâche en file : saute éventuellement à son temps de début, définit le temps d'arrêt et la joue en avant ou en arrière selon la position actuelle de l'animation. |
| `Cover:getCoverByFillUnitIndex(fillUnitIndex: any)` | 369 | ✍ Renvoie la première bâche associée à l'indice d'unité de remplissage donné, ou nil s'il n'y en a pas. |
| `Cover:getIsNextCoverStateAllowed(nextState: any)` | 380 | ✍ Contrôle d'autorisation par défaut : un changement d'état est permis sauf si plus d'une animation est déjà en file. Prévu pour être surchargé par d'autres spécialisations. |
| `Cover:getIsNextCoverStateAllowedWarning(nextState: any)` | 391 | ✍ Renvoie le texte d'avertissement à afficher quand un changement d'état est refusé ; par défaut nil (aucun avertissement). Point d'extension pour les surcharges. |
| `Cover:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 397 | ✍ Renvoie false pour un type d'outil listé dans les types bloqués de la bâche tant que la bâche de cette unité n'est pas ouverte ; sinon délègue à l'implémentation parente. |
| `Cover:getCanBeSelected(superFunc: any)` | 425 | ✍ Renvoie toujours true : un véhicule avec cette spécialisation peut être sélectionné. |
| `Cover:loadPipeNodes(superFunc: any, pipeNodes: any, xmlFile: any, baseKey: any)` | 431 | ✍ Après le chargement parent des noeuds de tuyau, lit l'état de bâche min et max autorisé pour les changements du tuyau depuis 'vehicle.pipe' (max par défaut : nombre de bâches) et les stocke dans la spec du tuyau. |
| `Cover:getIsPipeStateChangeAllowed(superFunc: any, nextPipeState: any, ...: any)` | 441 | ✍ Refuse un changement d'état du tuyau quand l'état courant de la bâche est hors de la plage min/max configurée, en plus des contrôles du parent. |
| `Cover:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 457 | ✍ Client uniquement : enregistre l'entrée TOGGLE_COVER (repli sur IMPLEMENT_EXTRA4 si indisponible) quand le véhicule est actif pour les entrées, et définit son texte. |
| `Cover:onStartTipping(tipSide: any)` | 476 | ✍ Si 'openCoverWhileTipping' est actif, ouvre la bâche de l'unité de remplissage du noeud de déversement du côté de basculement, sans envoyer d'événement. |
| `Cover:onOpenBackDoor(tipSide: any)` | 492 | ✍ Si 'openCoverWhileTipping' est actif, ouvre la bâche correspondant à l'unité de remplissage du déversement à l'ouverture de la porte arrière. Même logique que onStartTipping. |
| `Cover:finishedAIDischarge(superFunc: any)` | 508 | ✍ Ferme toutes les bâches à la fin d'un déchargement par l'IA, puis appelle le parent. |
| `Cover:aiPrepareLoading(superFunc: any, fillUnitIndex: any, task: any)` | 519 | ✍ Ouvre la bâche de l'unité de remplissage que l'IA s'apprête à charger, puis appelle le parent. |
| `Cover:aiFinishLoading(superFunc: any, fillUnitIndex: any, task: any)` | 530 | ✍ Ferme toutes les bâches quand le chargement par l'IA est terminé, puis appelle le parent. |
| `Cover:setFillUnitInTriggerRange(superFunc: any, fillUnitIndex: any, isInRange: any)` | 541 | ✍ Après le parent, ouvre automatiquement la bâche de l'unité à l'entrée d'un déclencheur (si 'autoReactToTrigger' et changement autorisé), et la referme à la sortie si elle avait été ouverte automatiquement. |
| `Cover:onFillUnitTriggerChanged(fillTrigger: any, fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 570 | ✍ Quand un déclencheur de remplissage change pour une unité avec bâches, ouvre sa bâche automatiquement si la réaction auto est active et le changement autorisé, en mémorisant l'ouverture automatique. |
| `Cover:onRemovedFillUnitTrigger(numTriggers: any)` | 589 | ✍ Quand le dernier déclencheur de remplissage est retiré, ferme la bâche si elle avait été ouverte automatiquement et si la réaction auto est active. |
| `Cover.updateActionText(self: any)` | 602 | ✍ Met à jour le libellé de l'action : texte d'ouverture à l'état 0, de fermeture au dernier état, 'bâche suivante' entre les deux. Sans effet si aucune action n'est enregistrée. |
| `Cover.actionEventToggleCover(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 621 | ✍ Rappel d'entrée : passe à l'état suivant (retour à 0 en fin de cycle) si autorisé et efface le drapeau automatique ; sinon affiche l'avertissement clignotant fourni par getIsNextCoverStateAllowedWarning, le cas échéant. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCoverFromXML` | 63 |
| registerFunction | `getIsNextCoverStateAllowed` | 64 |
| registerFunction | `getIsNextCoverStateAllowedWarning` | 65 |
| registerFunction | `setCoverState` | 66 |
| registerFunction | `playCoverAnimation` | 67 |
| registerFunction | `getCoverByFillUnitIndex` | 68 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 74 |
| registerOverwrittenFunction | `getCanBeSelected` | 75 |
| registerOverwrittenFunction | `loadPipeNodes` | 76 |
| registerOverwrittenFunction | `getIsPipeStateChangeAllowed` | 77 |
| registerOverwrittenFunction | `aiPrepareLoading` | 78 |
| registerOverwrittenFunction | `aiFinishLoading` | 79 |
| registerOverwrittenFunction | `finishedAIDischarge` | 80 |
| registerOverwrittenFunction | `setFillUnitInTriggerRange` | 81 |
| registerEventListener | `onLoad` | 87 |
| registerEventListener | `onPostLoad` | 88 |
| registerEventListener | `onReadStream` | 89 |
| registerEventListener | `onWriteStream` | 90 |
| registerEventListener | `onUpdate` | 91 |
| registerEventListener | `onRegisterActionEvents` | 92 |
| registerEventListener | `onStartTipping` | 93 |
| registerEventListener | `onOpenBackDoor` | 94 |
| registerEventListener | `onFillUnitTriggerChanged` | 95 |
| registerEventListener | `onRemovedFillUnitTrigger` | 96 |
