# vehicles/specializations/EnterablePassenger.lua

*[English version](../../../../scripts/vehicles/specializations/EnterablePassenger.md)*

Source: `dataS/scripts/vehicles/specializations/EnterablePassenger.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui ajoute des sièges passager à un véhicule Enterable. Sièges, caméras, points de sortie et personnages optionnels sont configurés sous vehicle.enterable.passengerSeats ou dans une configuration passager ; les sièges sont actifs en multijoueur (ou en solo si allowInSingleplayer est activé). Elle surcharge l'interaction, l'entrée et la sortie, permet éventuellement au passager de piloter le véhicule, et s'appuie sur des événements comme EnterablePassengerLeaveEvent, définis ailleurs (NON VÉRIFIÉ). Le fichier ne déclare pas lui-même la classe : la table EnterablePassenger vient d'ailleurs.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnterablePassenger.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Renvoie true seulement si la spécialisation Enterable est présente. |
| `EnterablePassenger.initSpecialization()` | 32 | ✍ Enregistre le drapeau d'interaction ENTERABLE_PASSENGER et un type de configuration boutique « enterablePassenger », puis enregistre les chemins XML des sièges par défaut et de chaque configuration passager. |
| `EnterablePassenger.registerXMLPaths(basePath: any, schema: any)` | 48 | ✍ Enregistre sous un chemin de base les clés XML allowInSingleplayer, allowPassengerOnly, allowVehicleControl et, par siège, node, exitPoint, outdoorCameraIndex, nicknameOffset, caméras et nœud de personnage. |
| `EnterablePassenger.registerFunctions(vehicleType: any)` | 64 | ✍ Enregistre les fonctions de niveau véhicule pour la recherche de siège, l'entrée et la sortie, la gestion des caméras et celle des personnages passagers. |
| `EnterablePassenger.registerOverwrittenFunctions(vehicleType: any)` | 85 | ✍ Surcharge getInteractionHelp, interact, getDistanceToNode, getIsEnterable, getExitNode, getIsInUse, getDeactivateOnLeave, getIsInteractive, getIsEnteredForInput et getRequiresPower. À noter : getIsInteractive est enregistrée mais aucune fonction correspondante n'est définie dans ce fichier (NON VÉRIFIÉ). |
| `EnterablePassenger.registerEventListeners(vehicleType: any)` | 100 | ✍ S'abonne aux événements de chargement/suppression, de flux, de post-mise à jour, d'affichage d'infos UI, d'état en panne, d'entrée/sortie du véhicule et d'enregistrement des événements d'action. |
| `EnterablePassenger:onLoad(savegame: any)` | 116 | ✍ Charge les réglages des sièges depuis le chemin de base ou la configuration passager choisie : nœuds, points de sortie, caméras (dont une caméra extérieure existante optionnelle), personnages et décalage du pseudo. Définit « available » (sièges requis et multijoueur ou allowInSingleplayer), construit les textes d'interface et s'abonne aux changements de style du joueur. |
| `EnterablePassenger:onDelete()` | 197 | ✍ Fait quitter le joueur local s'il est passager, évince les autres joueurs assis et supprime les caméras et personnages passagers. |
| `EnterablePassenger:onReadStream(streamId: integer, connection: Connection)` | 233 | ✍ Client à la connexion : pour chaque siège, lit s'il est occupé et par quel utilisateur, et signale à ce joueur qu'il est entré comme passager. |
| `EnterablePassenger:onWriteStream(streamId: integer, connection: Connection)` | 250 | ✍ Serveur à la connexion : pour chaque siège, écrit s'il est occupé et, le cas échéant, l'identifiant d'utilisateur. |
| `EnterablePassenger:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Client uniquement, quand les sièges sont disponibles : met à jour la caméra active, les événements d'action et les personnages des sièges, et garde le véhicule actif tant que le joueur local est passager. |
| `EnterablePassenger:onDrawUIInfo()` | 284 | ✍ Client : affiche le pseudo de chaque joueur assis au-dessus de son siège quand aucune interface n'est ouverte, que les noms multijoueur sont activés et que la caméra est assez proche. |
| `EnterablePassenger:onSetBroken()` | 307 | ✍ Fait quitter le véhicule au joueur local s'il est passager quand le véhicule tombe en panne. |
| `EnterablePassenger:onEnterVehicle()` | 316 | ✍ Quand le conducteur entre, efface le dernier utilisateur mémorisé sur tout siège correspondant au nouveau conducteur. En mode debug, affiche aussi le personnage de l'utilisateur sur chaque siège. |
| `EnterablePassenger:onLeaveVehicle()` | 334 | ✍ En mode debug uniquement, retire les personnages de debug de tous les sièges. |
| `EnterablePassenger:getInteractionHelp(superFunc: any) → string` | 346 | ✍ Surcharge : renvoie le texte « entrer comme passager » quand le drapeau d'interaction passager est actif ; sinon le texte du parent. |
| `EnterablePassenger:interact(superFunc: any, player: any)` | 359 | ✍ Surcharge : avec le drapeau passager actif, demande d'entrer comme passager au siège le plus proche du joueur ; sinon délègue au parent. |
| `EnterablePassenger:getIsEnteredForInput(superFunc: any)` | 382 | ✍ Surcharge : renvoie aussi true pour un passager quand le véhicule autorise la commande depuis les sièges passager. |
| `EnterablePassenger:getRequiresPower(superFunc: any)` | 401 | ✍ Surcharge : renvoie aussi true quand la commande passager est autorisée et qu'au moins un siège passager est occupé. |
| `EnterablePassenger:getDistanceToNode(superFunc: integer, node: any) → number` | 425 | ✍ Surcharge : si le véhicule est contrôlé (ou si l'entrée passager seule est permise) et qu'un siège libre est plus proche que la distance d'entrée normale, active le drapeau d'interaction passager et renvoie cette distance. |
| `EnterablePassenger:getIsEnterable(superFunc: any)` | 442 | ✍ Surcharge : avec des sièges passager disponibles, le siège conducteur n'est accessible que si les sièges passager ne sont pas le bon choix (voir getCanUsePassengerSeats) et si le parent l'autorise. |
| `EnterablePassenger:getExitNode(superFunc: any, player: any)` | 453 | ✍ Surcharge : renvoie le point de sortie du siège utilisé en dernier par le joueur donné s'il y en a un ; sinon le nœud de sortie du parent. |
| `EnterablePassenger:getIsInUse(superFunc: any, connection: any)` | 469 | ✍ Surcharge : true tant qu'un siège passager est occupé ; sinon la réponse du parent. |
| `EnterablePassenger:getDeactivateOnLeave(superFunc: any, connection: any)` | 485 | ✍ Surcharge : renvoie false (ne pas désactiver) tant qu'un siège passager est occupé ; sinon la réponse du parent. |
| `EnterablePassenger:onPreRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 501 | ✍ Efface les événements d'action de cette spécialisation avant que Enterable enregistre les siens, pour qu'ils ne soient pas retirés aussitôt. |
| `EnterablePassenger:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 511 | ✍ Enregistre les entrées : comme passager, sortie, changement de caméra, zoom et changement de siège ; comme conducteur, seulement le changement de siège (si actif pour l'entrée). Rafraîchit ensuite l'état des événements d'action. |
| `EnterablePassenger.actionEventLeave(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 552 | ✍ Rappel d'entrée : fait quitter le véhicule au joueur local s'il est passager. |
| `EnterablePassenger.actionEventCameraSwitch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 561 | ✍ Rappel d'entrée : passe à la caméra passager suivante quand le joueur local est passager. |
| `EnterablePassenger.actionEventSwitchSeat(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 570 | ✍ Rappel d'entrée : passe au siège passager libre suivant, sinon au siège conducteur s'il est libre et accessible, sinon (repli) au premier siège passager libre, en recopiant le type de caméra actif à chaque fois. |
| `EnterablePassenger.updateActionEvents(self: any)` | 598 | ✍ Met à jour l'action de changement de siège : définit son texte (siège suivant, conducteur ou passager) et ne l'active que s'il existe une destination. |
| `EnterablePassenger:getClosestSeatIndex(playerNode: any)` | 632 | ✍ Renvoie l'indice et la distance du siège passager libre le plus proche du nœud donné, dans la distance d'entrée minimale (3) ; indice nil si aucun ne convient. |
| `EnterablePassenger:getIsPassengerSeatAvailable(passengerSeat: any)` | 654 | ✍ Renvoie true si l'entrée de siège donnée n'est pas occupée. |
| `EnterablePassenger:getIsPassengerSeatIndexAvailable(seatIndex: any)` | 660 | ✍ Renvoie true si le siège portant cet indice existe et est libre. |
| `EnterablePassenger:getFirstAvailablePassengerSeat(startIndex: any)` | 672 | ✍ Renvoie l'indice du premier siège passager libre à partir de startIndex (1 par défaut), ou nil. |
| `EnterablePassenger:getPlayerNameBySeatIndex(seatIndex: any)` | 686 | ✍ Renvoie le pseudo de l'utilisateur au siège donné, ou une chaîne vide s'il est inconnu. |
| `EnterablePassenger:getCanUsePassengerSeats()` | 701 | ✍ Renvoie true quand un joueur doit utiliser les sièges passager plutôt que celui du conducteur : véhicule non en panne et soit déjà contrôlé, soit inaccessible au joueur. |
| `EnterablePassenger:enterVehiclePassengerSeat(isOwner: any, seatIndex: any, playerStyle: any, userId: any)` | 721 | ✍ Occupe un siège. Pour le propriétaire local : quitte l'ancien siège, active la caméra et le personnage passager, le point de carte et la gestion des entrées. Pour les autres : libère leur ancien siège et définit le personnage. Marque le siège occupé avec identifiant et style, et active le véhicule s'il était inactif. |
| `EnterablePassenger:leaveLocalPassengerSeat(noEventSend: any)` | 787 | ✍ Quitte le siège du joueur local ; sauf si noEventSend vaut true, envoie d'abord un EnterablePassengerLeaveEvent au serveur. |
| `EnterablePassenger:leavePassengerSeat(isOwner: any, seatIndex: any)` | 800 | ✍ Libère un siège. Pour le propriétaire local : désactive la caméra, réinitialise les drapeaux intérieur du son et de l'environnement, masque les rétroviseurs, retire le point de carte et les abonnements d'entrée. Efface les données du siège et désactive le véhicule si plus personne ne reste et qu'il n'est pas contrôlé. |
| `EnterablePassenger:getPassengerSeatIndexByPlayer(userId: any)` | 861 | ✍ Renvoie l'indice du siège occupé par l'identifiant d'utilisateur donné, ou nil. |
| `EnterablePassenger:copyEnterableActiveCameraIndex(seatIndex: any)` | 874 | ✍ Conserve le choix de caméra lors d'un changement de siège : avec un indice de siège, copie la caméra active d'Enterable vers ce siège ; sans, recopie vers les caméras d'Enterable. Cherche la même caméra, sinon la première de même type intérieur/extérieur. |
| `EnterablePassenger:setPassengerActiveCameraIndex(cameraIndex: any, seatIndex: any)` | 933 | ✍ Définit l'indice de caméra d'un siège (donné ou suivant, avec retour à 1) et l'active. |
| `EnterablePassenger:enablePassengerActiveCamera()` | 948 | ✍ Désactive la caméra courante, active la caméra choisie du siège courant, met à jour la visibilité des rétroviseurs et le nœud de référence des zones d'environnement, rafraîchit les personnages et garde le véhicule actif. |
| `EnterablePassenger:setPassengerSeatCharacter(seatIndex: any, playerStyle: any)` | 974 | ✍ Décharge le personnage du siège et, si un style de joueur est donné, charge le personnage correspondant de façon asynchrone (un style nil se contente de le retirer). |
| `EnterablePassenger:updatePassengerSeatCharacter(dt: any)` | 990 | ✍ Pour chaque siège occupé ayant un personnage, met à jour sa visibilité et son animation selon dt. |
| `EnterablePassenger:onPassengerPlayerStyleChanged(style: any, userId: any)` | 1002 | ✍ Gestionnaire de message : recharge le personnage du siège occupé par l'utilisateur dont le style a changé. |
| `EnterablePassenger.vehiclePassengerCharacterLoaded(self: any, loadingState: any, arguments: any)` | 1014 | ✍ Rappel de chargement : quand le personnage est bien chargé, met à jour sa visibilité et ses chaînes IK (et le force visible en mode debug). |
| `EnterablePassenger.consoleCommandDebugPassengerSeat()` | 1030 | ✍ Commande console : bascule le mode debug des sièges passager et affiche ou retire des personnages de debug sur le véhicule courant du joueur local, puis journalise le nouvel état. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getClosestSeatIndex` | 65 |
| registerFunction | `getIsPassengerSeatAvailable` | 66 |
| registerFunction | `getIsPassengerSeatIndexAvailable` | 67 |
| registerFunction | `getFirstAvailablePassengerSeat` | 68 |
| registerFunction | `getPlayerNameBySeatIndex` | 69 |
| registerFunction | `getCanUsePassengerSeats` | 70 |
| registerFunction | `enterVehiclePassengerSeat` | 71 |
| registerFunction | `leaveLocalPassengerSeat` | 72 |
| registerFunction | `leavePassengerSeat` | 73 |
| registerFunction | `getPassengerSeatIndexByPlayer` | 74 |
| registerFunction | `copyEnterableActiveCameraIndex` | 75 |
| registerFunction | `setPassengerActiveCameraIndex` | 76 |
| registerFunction | `enablePassengerActiveCamera` | 77 |
| registerFunction | `setPassengerSeatCharacter` | 78 |
| registerFunction | `updatePassengerSeatCharacter` | 79 |
| registerFunction | `onPassengerPlayerStyleChanged` | 80 |
| registerOverwrittenFunction | `getInteractionHelp` | 86 |
| registerOverwrittenFunction | `interact` | 87 |
| registerOverwrittenFunction | `getDistanceToNode` | 88 |
| registerOverwrittenFunction | `getIsEnterable` | 89 |
| registerOverwrittenFunction | `getExitNode` | 90 |
| registerOverwrittenFunction | `getIsInUse` | 91 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 92 |
| registerOverwrittenFunction | `getIsInteractive` | 93 |
| registerOverwrittenFunction | `getIsEnteredForInput` | 94 |
| registerOverwrittenFunction | `getRequiresPower` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onPostUpdate` | 105 |
| registerEventListener | `onDrawUIInfo` | 106 |
| registerEventListener | `onSetBroken` | 107 |
| registerEventListener | `onEnterVehicle` | 108 |
| registerEventListener | `onLeaveVehicle` | 109 |
| registerEventListener | `onPreRegisterActionEvents` | 110 |
| registerEventListener | `onRegisterActionEvents` | 111 |

## Messages

- s'abonne à `MessageType.PLAYER_STYLE_CHANGED` (l.191)
- s'abonne à `MessageType.INPUT_BINDINGS_CHANGED` (l.742)
