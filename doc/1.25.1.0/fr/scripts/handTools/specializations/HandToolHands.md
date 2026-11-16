# handTools/specializations/HandToolHands.lua

*[English version](../../../../scripts/handTools/specializations/HandToolHands.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHands.lua` — FS25 1.25.1.0

✍ Spécialisation d'outil à main pour les mains nues du joueur, qui ne peuvent pas être lâchées. Elle permet au joueur propriétaire de ramasser des objets physiques dynamiques jusqu'à une masse maximale via un joint attaché à un nœud cinématique auxiliaire, de les tourner, les mettre à plat et les lancer avec une force chargée, et de frapper ou passer un Football. Ramassages et lancers sont synchronisés par événements (HandsPickUpObjectEvent, HandsThrowObjectEvent, HandsPickUpFailedEvent) ; la pose de l'auxiliaire est envoyée au serveur. À noter : `getHeldItem` et `throwHeldItemWithForceVector` sont enregistrées ou appelées mais leur corps est absent de ce dump (NON VÉRIFIÉ).

- **HandToolHands** (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHands.registerXMLPaths(xmlSchema: any)` | 49 | ✍ Ouvre et ferme le type XML de la spécialisation sans enregistrer de clé : les mains n'ont ici aucune configuration XML. |
| `HandToolHands.registerFunctions(handToolType: any)` | 56 | ✍ Enregistre sur le type d'outil à main les fonctions d'objet tenu, de joint, de ramassage, de lâcher, de lancer, de rotation, de mise à plat, de football et de commande console de super force (dont `getHeldItem` et `throwHeldItemWithForceVector`, dont les corps ne sont pas dans ce fichier). |
| `HandToolHands.registerOverwrittenFunctions(vehicleType: any)` | 89 | ✍ Surcharge `getCanBeDropped`. |
| `HandToolHands.registerEventListeners(handToolType: any)` | 95 | ✍ Abonne la spécialisation au chargement, suppression, mise à jour, affichage, lecture/écriture du flux de mise à jour, actions, changement de joueur porteur, début/fin de prise en main et debug. |
| `HandToolHands.prerequisitesPresent(specializations: any)` | 111 | ✍ Renvoie toujours true : aucun prérequis. |
| `HandToolHands:onLoad(xmlFile: any, baseDirectory: any)` | 117 | ✍ Initialise la masse et la distance de ramassage, l'état de lancer et de football, les textes d'action et l'indicateur de modification ; lance le chargement asynchrone de l'i3d partagé de l'auxiliaire cinématique ; crée trois réticules sur les clients. |
| `HandToolHands:onKinematicHelperLoaded(kinematicNode: any, failedReason: any)` | 178 | ✍ Rappel asynchrone : prend le premier enfant de l'auxiliaire comme nœud cinématique, le relie à la racine et l'ajoute à la physique, et crée sous lui un nœud d'aide à la rotation. Journalise une erreur en cas d'échec. |
| `HandToolHands:onDelete()` | 202 | ✍ Lâche l'objet tenu sans événement, libère l'i3d et le nœud auxiliaires, retire la commande console de super force pour le propriétaire et libère les réticules. |
| `HandToolHands:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 241 | ✍ Client vers serveur, quand l'indicateur de modification est actif : écrit la position monde compressée du nœud cinématique, sa direction horizontale et les angles du nœud de rotation. |
| `HandToolHands:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 271 | ✍ Côté serveur : lit ces valeurs, applique les transformations des nœuds cinématique et de rotation et, si un joint existe, met à jour son repère. |
| `HandToolHands:onUpdate(dt: any)` | 304 | ✍ Crée le joint une fois l'image physique attendue simulée (serveur), met à jour le nœud cinématique et, pour le propriétaire, détecte les cibles ramassables et les ballons, change les textes d'action, termine un lancer chargé au relâchement de l'entrée et fait dribbler un ballon proche. |
| `HandToolHands:onDraw()` | 398 | ✍ En première personne pour le propriétaire, affiche le réticule de lancer à l'échelle de la charge, le réticule de ramassage en tenant ou visant un objet ramassable, ou le réticule par défaut. |
| `HandToolHands:onRegisterActionEvents()` | 424 | ✍ Enregistre les actions d'entrée de ramassage/dépôt, lancer, tangage, lacet et mise à plat avec textes et priorité. Ignoré si l'outil n'est pas actif pour les entrées. |
| `HandToolHands:onHeldStart()` | 459 | ✍ Pour le propriétaire, ajoute le type de cible de ramassage au ciblage du joueur avec la distance de ramassage courante. |
| `HandToolHands:onHeldEnd()` | 473 | ✍ Pour le propriétaire, retire le type de cible et lâche tout objet tenu. |
| `HandToolHands:onCarryingPlayerChanged(player: any, lastPlayer: any)` | 488 | ✍ Ajoute la commande console `gsPlayerSuperStrengthToggle` quand le joueur propriétaire reçoit les mains, et la retire quand il les perd. |
| `HandToolHands:getCanBeDropped(superFunc: any)` | 500 | ✍ Fonction surchargée : renvoie toujours false, les mains ne peuvent pas être lâchées. |
| `HandToolHands:updateKinematicNode()` | 506 | ✍ Pour le propriétaire pendant la prise en main, place le nœud cinématique le long du rayon de visée à la distance de tenue, à l'horizontale, et signale une mise à jour réseau. Ne fait rien sans nœud ou rayon. |
| `HandToolHands:getKinematicNode() → integer?, integer?` | 545 | ✍ Renvoie le nœud cinématique et son nœud de rotation (nil tant qu'ils ne sont pas chargés). |
| `HandToolHands:getIsHoldingItem() → boolean` | 552 | ✍ Renvoie true si un objet est tenu, même si aucun joint n'existe encore. |
| `HandToolHands:getIsThrowingItem() → boolean` | 559 | ✍ Renvoie true pendant la charge d'un lancer. |
| `HandToolHands:getIsAwaitingJointCreation() → boolean` | 566 | ✍ Renvoie true si un objet a été ramassé et que le joint attend encore une image physique. |
| `HandToolHands:getHasJoint() → boolean` | 573 | ✍ Renvoie true si un joint relie le nœud cinématique et l'objet tenu. |
| `HandToolHands:getCanPickUpNode(node: integer) → boolean` | 587 | ✍ Teste si un nœud peut être ramassé : il existe, n'est pas déjà tenu, sur le serveur c'est un corps dynamique pas plus lourd que la masse autorisée, et son objet n'est pas monté et autorise le ramassage (sauf super force). |
| `HandToolHands:onPickUpAction(_: any, inputValue: any)` | 633 | ✍ Entrée du propriétaire : fait une passe si un ballon est ciblé, sinon lâche l'objet tenu ou ramasse celui visé. |
| `HandToolHands:onThrowAction(_: any, inputValue: any)` | 663 | ✍ Entrée du propriétaire : tire dans un ballon s'il y en a un (angle de 30 degrés). Sinon, en tenant un objet, mémorise l'indice de mise à jour et cumule le temps de charge avec le delta de l'image. |
| `HandToolHands:onPitchAction(_: any, inputDelta: any)` | 698 | ✍ Rappel d'entrée : fait pivoter l'objet tenu autour de l'axe horizontal relatif au joueur. |
| `HandToolHands:onYawAction(_: any, inputDelta: any)` | 710 | ✍ Rappel d'entrée : fait pivoter l'objet tenu autour de l'axe vertical. |
| `HandToolHands:onLevelAction(_: any, inputValue: any)` | 721 | ✍ Rappel d'entrée : met l'objet tenu à plat. |
| `HandToolHands:rotateHeldItem(inputDelta: number, directionX: number, directionY: number, directionZ: number)` | 731 | ✍ Fait pivoter le nœud de rotation autour d'un axe local d'un quart de tour par seconde, pondéré par l'entrée et le dt physique ; sur le serveur met à jour le repère du joint. |
| `HandToolHands:levelHeldItem()` | 749 | ✍ Remet à zéro tangage et roulis du nœud de rotation en conservant le lacet de l'objet, et met à jour le repère du joint sur le serveur. Prévue pour palettes et balles carrées. |
| `HandToolHands:dropHeldItem(noEventSend: boolean?)` | 774 | ✍ Si un objet est tenu, envoie un HandsThrowObjectEvent de force nulle (sauf `noEventSend`) et relâche l'objet via `onHeldItemJointBroken`. |
| `HandToolHands:throwHeldItemWithForceScalar(throwForceScalar: number, noEventSend: boolean)` | 788 | ✍ Lance l'objet tenu le long du dernier rayon de visée du joueur avec le coefficient de force donné (0 à 1) via `throwHeldItemWithForceVector`. Journalise une erreur sans ciblage. |
| `HandToolHands:pickUpTarget(target: table, noEventSend: boolean) → boolean` | 881 | ✍ Valide la cible, envoie HandsPickUpObjectEvent, mémorise le nœud tenu, désactive la collision de la capsule avec lui, fixe la distance de tenue et active les actions associées. Le serveur attend ensuite une image physique avant le joint, les clients orientent le nœud de rotation. Renvoie true en cas de succès. |
| `HandToolHands:pickupFailed()` | 952 | ✍ Nettoie après un ramassage échoué : désactive les actions réservées à la tenue pour le propriétaire, restaure le texte de ramassage et la collision de la capsule, et efface le nœud tenu. |
| `HandToolHands:orientRotationNodeToItem(targetItemNode: any)` | 991 | ✍ Place le nœud de rotation au centre de masse de l'objet avec la rotation monde de l'objet. |
| `HandToolHands:createItemJoint()` | 1005 | ✍ Serveur uniquement. Abandonne et lâche si l'objet a disparu ou n'est plus dynamique ; sinon construit un joint verrouillé entre le nœud cinématique et l'objet, avec ressorts et amortisseurs proportionnels à la masse, cassable au-delà d'une force liée à la masse sauf super force, et enregistre un rapport de rupture. |
| `HandToolHands:onHeldItemJointBroken(jointIndex: integer?, breakingImpulse: number?, noEventSend: boolean?)` | 1106 | ✍ Appelée à la rupture du joint ou lors d'un lâcher : réinitialise les actions du propriétaire, restaure la collision de la capsule et efface le nœud tenu. Sur le serveur, envoie un événement de lancer (force nulle) aux clients, supprime le joint ou annule celui en attente. |
| `HandToolHands:findFootballCallback(transformId: any)` | 1167 | ✍ Rappel de recouvrement : mémorise le premier objet Football trouvé parmi les formes et arrête la recherche. |
| `HandToolHands:shootBall(football: any, dirX: any, dirZ: any, angleDeg: any, velocity: any, shotType: any)` | 1184 | ✍ Enregistre l'instant du tir, remet `canShoot` à false et appelle `football:shoot` avec direction, angle, vitesse et type de tir. |
| `HandToolHands.calculateItemMass(itemNode: integer) → number?` | 1195 | ✍ Renvoie la masse totale de l'objet s'il fournit `getTotalMass`, sinon la masse du nœud ; nil si le nœud n'existe pas. |
| `HandToolHands.calculateItemJointBreakForceFactor(itemNode: integer) → number` | 1219 | ✍ Renvoie le résultat de `getHandsJointBreakForceFactor` de l'objet pour rendre la prise plus solide, ou 1 s'il ne la définit pas. |
| `HandToolHands:onDebugDraw()` | 1231 | ✍ Dessine des repères de debug pour les nœuds cinématique et de rotation et, en tenant un objet, pour l'objet avec une ligne indiquant la distance en mètres. |
| `HandToolHands:consoleCommandToggleSuperStrength()` | 1254 | ✍ Commande console : bascule la super force, qui augmente la masse maximale et la distance de ramassage (10) et supprime la limite de rupture du joint et le test `getCanBePickedUp`. Rafraîchit le type de cible pour le propriétaire et renvoie un texte d'état. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateKinematicNode` | 57 |
| registerFunction | `getKinematicNode` | 59 |
| registerFunction | `getIsHoldingItem` | 60 |
| registerFunction | `getIsThrowingItem` | 61 |
| registerFunction | `getIsAwaitingJointCreation` | 62 |
| registerFunction | `getHasJoint` | 63 |
| registerFunction | `getHeldItem` | 64 |
| registerFunction | `getCanPickUpNode` | 65 |
| registerFunction | `orientRotationNodeToItem` | 67 |
| registerFunction | `createItemJoint` | 68 |
| registerFunction | `pickUpTarget` | 70 |
| registerFunction | `pickupFailed` | 71 |
| registerFunction | `dropHeldItem` | 72 |
| registerFunction | `throwHeldItemWithForceScalar` | 73 |
| registerFunction | `throwHeldItemWithForceVector` | 74 |
| registerFunction | `rotateHeldItem` | 76 |
| registerFunction | `levelHeldItem` | 77 |
| registerFunction | `onHeldItemJointBroken` | 79 |
| registerFunction | `findFootballCallback` | 81 |
| registerFunction | `shootBall` | 82 |
| registerFunction | `consoleCommandToggleSuperStrength` | 84 |
| registerOverwrittenFunction | `getCanBeDropped` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onDelete` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onDraw` | 99 |
| registerEventListener | `onWriteUpdateStream` | 100 |
| registerEventListener | `onReadUpdateStream` | 101 |
| registerEventListener | `onRegisterActionEvents` | 102 |
| registerEventListener | `onCarryingPlayerChanged` | 103 |
| registerEventListener | `onHeldStart` | 104 |
| registerEventListener | `onHeldEnd` | 105 |
| registerEventListener | `onDebugDraw` | 106 |
