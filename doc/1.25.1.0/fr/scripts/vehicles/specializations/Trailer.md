# vehicles/specializations/Trailer.lua

*[English version](../../../../scripts/vehicles/specializations/Trailer.md)*

Source: `dataS/scripts/vehicles/specializations/Trailer.lua` — FS25 1.25.1.0

✍ Spécialisation des remorques à benne basculante. Elle gère un ou plusieurs « côtés de bennage » (nœud de déchargement, animation de bascule, animation de porte arrière facultative, animation de bennage en boucle), la machine à états de bennage (fermé, ouverture, ouvert, fermeture), le choix du côté et des commandes manuelles de benne/porte. Elle exige FillUnit, Dischargeable et AnimatedVehicle, se configure via le type de configuration `trailer` et lève des événements comme onStartTipping et onEndTipping. La synchronisation réseau passe par les flux et les classes Trailer*Event (définies ailleurs).

- **Trailer** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Trailer.prerequisitesPresent(specializations: any)` | 27 | ✍ Renvoie true seulement si le type de véhicule possède les spécialisations FillUnit, Dischargeable et AnimatedVehicle. |
| `Trailer.initSpecialization()` | 35 | ✍ Enregistre le type de configuration `trailer` et le schéma XML des côtés de bennage (animations, commandes manuelles de benne/porte, limites de remplissage, sons, changements d'objets), ainsi que des clés supplémentaires pour les parties d'animation, le contrôle externe, les ramasseurs et les animations de mise en marche. Déclare aussi les clés de sauvegarde. |
| `Trailer.registerEvents(vehicleType: any)` | 114 | ✍ Enregistre les événements véhicule onStartTipping, onOpenBackDoor, onStopTipping, onCloseBackDoor et onEndTipping. |
| `Trailer.registerFunctions(vehicleType: any)` | 124 | ✍ Enregistre les fonctions publiques de la spécialisation (chargement et choix du côté de bennage, début/arrêt/fin de bennage, état de la porte, état de bennage, redéchargement automatique). |
| `Trailer.registerOverwrittenFunctions(vehicleType: any)` | 143 | ✍ Enregistre des surcharges de fonctions d'autres spécialisations : facteur de vidage, tests de déchargement au sol/vers objet, état de la bâche, sélection, déchargement IA, état du ramasseur, animation de mise en marche, besoin de puissance et état de déchargement manuel. |
| `Trailer.registerEventListeners(vehicleType: any)` | 161 | ✍ Abonne la spécialisation à onLoad, onPostLoad, onLoadFinished, onDelete, la lecture/écriture de flux, onUpdate, les événements d'action, onDischargeStateChanged, onDeactivate, les types de valeurs d'animation, les actions externes et les changements de niveau de remplissage. |
| `Trailer:onLoad(savegame: any)` | 179 | ✍ Lit toutes les entrées `tipSide` de la configuration `trailer` choisie via `loadTipSide`, construit la table nœud de déchargement vers côté de bennage et initialise l'état de bennage (fermé), les données de redéchargement et le drapeau dirty. |
| `Trailer:onPostLoad(savegame: any)` | 234 | ✍ Signale les côtés de bennage qui pointent vers un nœud de déchargement inconnu. Restaure depuis la sauvegarde le côté, l'état de la porte, l'état de bennage et le temps d'animation, ou choisit le côté par défaut pour un véhicule neuf. |
| `Trailer:onLoadFinished(savegame: any)` | 278 | ✍ Avec plusieurs côtés de bennage, demande une mise à jour du choix si le côté préféré n'est pas disponible (niveau de remplissage hors plage). |
| `Trailer:onDelete()` | 289 | ✍ Supprime les nœuds d'animation et l'échantillon sonore de déchargement de chaque côté de bennage. |
| `Trailer:onReadStream(streamId: integer, connection: Connection)` | 303 | ✍ Côté client à la connexion : lit le côté préféré, l'état de bennage, le côté courant, l'état de la porte ainsi que les temps et le sens des animations de benne/porte, puis les applique. |
| `Trailer:onWriteStream(streamId: integer, connection: Connection)` | 358 | ✍ Côté serveur à la connexion : écrit les données attendues par `onReadStream` (côté de bennage, état, porte, temps et sens des animations). |
| `Trailer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 392 | ✍ À chaque image : met à jour les textes des actions de changement de côté et de benne/porte manuelles, applique un changement de côté en attente une fois fermé, fait avancer l'état de bennage selon le temps d'animation, et côté serveur pilote le redéchargement automatique des véhicules non contrôlés. |
| `Trailer:loadTipSide(xmlFile: any, key: any, entry: any)` | 488 | ✍ Charge un côté de bennage depuis le XML (nom, index du nœud de déchargement, commandes manuelles, animations de benne/porte/bennage, plage de remplissage, nœuds d'animation, son, changements d'objets). Renvoie false avec un avertissement si le nom ou une animation manque ou est inconnue. |
| `Trailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 580 | ✍ Sauvegarde le côté préféré (s'il y en a plusieurs), l'état de la porte, le temps de l'animation de benne et l'état de bennage. |
| `Trailer:getCanTogglePreferdTipSide()` | 598 | ✍ Renvoie true si la benne est fermée et qu'au moins un côté existe, donc que le côté préféré peut être changé. |
| `Trailer:getIsTipSideAvailable(sideIndex: any)` | 605 | ✍ Renvoie true si le côté de bennage existe et, s'il a une condition de remplissage, si le pourcentage du fill unit est dans la plage min/max. |
| `Trailer:getNextAvailableTipSide(index: any)` | 624 | ✍ Parcourt les côtés à partir de l'index donné et renvoie l'index du suivant disponible, ou l'index donné si aucun ne l'est. |
| `Trailer:setPreferedTipSide(index: any, noEventSend: any)` | 648 | ✍ Choisit le côté de bennage préféré (borné à la plage valide) et arrête un bennage en cours. Envoie TrailerToggleTipSideEvent sauf si `noEventSend`, applique les changements d'objets, ferme l'ancienne porte si besoin et change le nœud de déchargement courant. |
| `Trailer:setTipSideUpdateDirty()` | 700 | ✍ Indique que le côté de bennage devra être réévalué dès que la remorque sera refermée. |
| `Trailer:startTipping(tipSideIndex: any, noEventSend: any)` | 707 | ✍ Démarre l'animation de benne (ainsi que les animations de porte/bennage, nœuds d'animation et son sur le client), passe l'état à ouverture et lève onStartTipping. Le paramètre `noEventSend` n'est pas utilisé dans le corps. |
| `Trailer:stopTipping(noEventSend: any)` | 746 | ✍ Joue l'animation de benne en sens inverse (ou l'arrête si la vitesse de fermeture est nulle), ferme la porte sauf fermeture différée, arrête les effets, passe l'état à fermeture et lève onStopTipping. `noEventSend` n'est pas utilisé dans le corps. |
| `Trailer:endTipping(noEventSend: any)` | 785 | ✍ Termine la fermeture : applique la fermeture différée de la porte si configurée, remet l'état à fermé, efface le côté courant et lève onEndTipping. |
| `Trailer:setTrailerDoorState(tipSideIndex: any, state: any, noEventSend: any, instantUpdate: any)` | 805 | ✍ Ouvre ou ferme la porte arrière d'un côté de bennage (bascule si `state` est nil), avec saut instantané à la fin en option, lève onOpenBackDoor/onCloseBackDoor pour les portes manuelles et envoie TrailerToggleManualDoorEvent. |
| `Trailer:getAllowTrailerDoorToggle(tipSideIndex: any)` | 836 | ✍ Indique si la porte manuelle peut être actionnée maintenant : refusé si le fill unit est rempli et que ce n'est pas permis, en cas de fermeture pendant le bennage, ou si la règle de réinitialisation pendant le bennage s'applique. |
| `Trailer:getTipState()` | 865 | ✍ Renvoie la constante d'état de bennage courante (fermé, ouverture, ouvert ou fermeture). |
| `Trailer:setTipState(isOpen: any)` | 871 | ✍ Place directement le côté courant en position ouverte ou fermée (utilisé au chargement), en jouant ses animations et en les avançant jusqu'à la fin. |
| `Trailer:updateTrailerAutomaticRedischarge()` | 897 | ✍ Logique serveur qui relance le déchargement vers un objet quand la remorque est restée à moins de 1,5 m de la dernière position, vise le même objet, a encore du contenu et que la cible a assez de place libre. Sinon, la mémoire est réinitialisée. |
| `Trailer:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 945 | ✍ Surcharge : renvoie 0 tant que l'animation de benne ou de porte n'a pas atteint son temps de départ configuré, puis le facteur de vidage courant du côté. Retombe sur la fonction parente pour les nœuds sans côté de bennage. |
| `Trailer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 974 | ✍ Surcharge : après le test parent, interdit le déchargement au sol si le côté actif a `canTip` à false, ou s'il est vide alors que `canTipIfEmpty` est à false. |
| `Trailer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 997 | ✍ Surcharge : après le test parent, interdit le déchargement vers un objet si le côté actif a `canTip` à false. |
| `Trailer:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1015 | ✍ Surcharge : pendant le bennage ou porte manuelle ouverte, seul l'état de bâche correspondant à celle du nœud de déchargement est autorisé ; sinon, délègue au parent. |
| `Trailer:getCanBeSelected(superFunc: any)` | 1048 | ✍ Surcharge qui renvoie toujours true : la remorque peut être sélectionnée. |
| `Trailer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1054 | ✍ Client uniquement : enregistre l'action de changement de côté (s'il y en a plusieurs) et les actions de benne et de porte manuelles du côté préféré. |
| `Trailer:onDischargeStateChanged(dischargeState: any)` | 1083 | ✍ Démarre le bennage quand le déchargement passe au sol ou vers un objet, et l'arrête quand il s'éteint. Mémorise aussi l'objet cible et la position du nœud pour le redéchargement automatique. |
| `Trailer:onDeactivate()` | 1106 | ✍ Arrête un bennage lancé manuellement quand le véhicule est désactivé, si le côté a `stopOnDeactivate` activé. |
| `Trailer:getAIHasFinishedDischarge(superFunc: any, dischargeNode: any)` | 1121 | ✍ Surcharge : renvoie false tant que l'état de bennage n'est pas fermé, sinon délègue au parent. |
| `Trailer:startAIDischarge(superFunc: any, dischargeNode: any, task: any)` | 1131 | ✍ Surcharge : sélectionne le côté de bennage lié au nœud de déchargement de l'IA avant d'appeler la fonction parente. |
| `Trailer:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1143 | ✍ Surcharge : lit en plus l'attribut de ramasseur `allowWhileTipping` (true par défaut) avant d'appeler le parent. |
| `Trailer:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1151 | ✍ Surcharge : refuse un changement d'état du ramasseur pendant le bennage si le ramasseur a `allowWhileTipping` à false. |
| `Trailer:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1165 | ✍ Surcharge : lit en plus l'attribut `playWhileTipping` de l'animation de mise en marche (false par défaut). |
| `Trailer:getRequiresPower(superFunc: any)` | 1173 | ✍ Surcharge : renvoie true pendant l'ouverture ou la fermeture de la benne, sinon la valeur du parent. |
| `Trailer:setManualDischargeState(superFunc: any, state: any, noEventSend: any)` | 1184 | ✍ Surcharge : quand le déchargement est coupé manuellement, efface la cible de redéchargement mémorisée pour éviter un redéchargement automatique, puis appelle le parent. |
| `Trailer:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1198 | ✍ Surcharge : pour les animations marquées `playWhileTipping`, également active pendant le bennage tant que le facteur de vidage est supérieur à 0. |
| `Trailer:onRegisterAnimationValueTypes()` | 1208 | ✍ Enregistre deux types de valeurs d'animation utilisables dans les parties AnimatedVehicle : `tipSideEmptyFactor` (pilote le facteur de vidage d'un côté via un nœud de déchargement) et `doorAnimationMaxTime` (limite et rejoue l'animation de porte). |
| `Trailer:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1299 | ✍ Enregistre l'action externe `trailerDoorToggle` pour les triggers, en mémorisant l'index de côté lu dans le XML (1 par défaut). |
| `Trailer.externalActionEventDoorToggleRegister(data: any, vehicle: any)` | 1308 | ✍ Enregistre l'action d'entrée qui actionne la porte manuelle depuis l'extérieur ; sélectionne d'abord le côté s'il est disponible. Sans effet si le côté n'a pas de porte manuelle. |
| `Trailer.externalActionEventDoorToggleUpdate(data: any, vehicle: any)` | 1330 | ✍ Met à jour le texte affiché de l'action externe de porte (ouvrir ou fermer) selon l'état de l'animation de la porte. |
| `Trailer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1357 | ✍ Resélectionne le côté de bennage quand les côtés dépendant du remplissage deviennent indisponibles (différé si bennage en cours). Côté serveur, ferme une porte manuelle quand le fill unit reçoit du produit et que l'ouverture en charge est interdite. |
| `Trailer.actionEventToggleTipSide(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1387 | ✍ Callback d'entrée : passe au côté de bennage disponible suivant quand le changement est autorisé. |
| `Trailer.actionEventManualToggleTip(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1397 | ✍ Callback d'entrée : démarre le bennage si fermé ou en fermeture, sinon l'arrête, et envoie TrailerToggleManualTipEvent. |
| `Trailer.actionEventManualToggleDoor(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1410 | ✍ Callback d'entrée : actionne la porte manuelle si c'est permis, sinon affiche pendant 5 secondes l'avertissement clignotant « action non autorisée ». |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartTipping` | 115 |
| registerEvent | `onOpenBackDoor` | 116 |
| registerEvent | `onStopTipping` | 117 |
| registerEvent | `onCloseBackDoor` | 118 |
| registerEvent | `onEndTipping` | 119 |
| registerFunction | `loadTipSide` | 125 |
| registerFunction | `getCanTogglePreferdTipSide` | 126 |
| registerFunction | `getIsTipSideAvailable` | 127 |
| registerFunction | `getNextAvailableTipSide` | 128 |
| registerFunction | `setPreferedTipSide` | 129 |
| registerFunction | `setTipSideUpdateDirty` | 130 |
| registerFunction | `startTipping` | 131 |
| registerFunction | `stopTipping` | 132 |
| registerFunction | `endTipping` | 133 |
| registerFunction | `setTrailerDoorState` | 134 |
| registerFunction | `getAllowTrailerDoorToggle` | 135 |
| registerFunction | `getTipState` | 136 |
| registerFunction | `setTipState` | 137 |
| registerFunction | `updateTrailerAutomaticRedischarge` | 138 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 144 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 145 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 146 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 147 |
| registerOverwrittenFunction | `getCanBeSelected` | 148 |
| registerOverwrittenFunction | `getAIHasFinishedDischarge` | 149 |
| registerOverwrittenFunction | `startAIDischarge` | 150 |
| registerOverwrittenFunction | `loadPickupFromXML` | 151 |
| registerOverwrittenFunction | `getCanChangePickupState` | 152 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 153 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 154 |
| registerOverwrittenFunction | `getRequiresPower` | 155 |
| registerOverwrittenFunction | `setManualDischargeState` | 156 |
| registerEventListener | `onLoad` | 162 |
| registerEventListener | `onPostLoad` | 163 |
| registerEventListener | `onLoadFinished` | 164 |
| registerEventListener | `onDelete` | 165 |
| registerEventListener | `onReadStream` | 166 |
| registerEventListener | `onWriteStream` | 167 |
| registerEventListener | `onUpdate` | 168 |
| registerEventListener | `onRegisterActionEvents` | 169 |
| registerEventListener | `onDischargeStateChanged` | 170 |
| registerEventListener | `onDeactivate` | 171 |
| registerEventListener | `onRegisterAnimationValueTypes` | 172 |
| registerEventListener | `onRegisterExternalActionEvents` | 173 |
| registerEventListener | `onFillUnitFillLevelChanged` | 174 |
