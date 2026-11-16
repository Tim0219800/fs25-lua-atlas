# player/Player.lua

*[English version](../../../scripts/player/Player.md)*

Source: `dataS/scripts/player/Player.lua` — FS25 1.25.1.0

✍ `Object` réseau représentant un personnage joueur, local ou répliqué, composé d'un contrôleur à capsule, d'un mover, d'un composant graphique, d'une machine à états, d'un composant d'entrée, d'une caméra, d'un targeter, d'un HUD updater et d'un composant réseau choisi selon le rôle (serveur, propriétaire local, distant). Il gère la création, la synchronisation, le port d'outils à main, les positions d'apparition, l'affichage/masquage (état contrôlé) et l'affichage de debug. Plusieurs méthodes utilisées ici (ex. `setStyleAsync`, `teleportTo`, `getPosition`, `hide`, `getCurrentVehicle`) sont définies ailleurs dans le fichier ou dans du code mélangé (NON VÉRIFIÉ).

- **Player** hérite de `Object` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Player.createServerInstance(isClient: boolean, isOwner: boolean, connection: Connection, userId: integer, farmId: integer, userManager: UserManager) → Player` | 209 | ✍ Fabrique côté serveur : crée un joueur pour un utilisateur et une ferme, définit son id unique, appelle `initialise` et `load` avec les données sauvegardées, applique le style sauvegardé ou le dernier utilisé (style par défaut sinon) et enregistre l'objet sur le réseau. |
| `Player.new(isServer: boolean, isClient: boolean) → Player` | 271 | ✍ Constructeur, normalement appelé via `Object.new` : initialise les champs et crée les composants (CCT, mover, machine à états, graphismes, HUD updater, hotspot) sans encore construire de noeud de scène. |
| `Player:initialise(connection: Connection, isOwner: boolean)` | 392 | ✍ Crée le noeud racine, construit la capsule, enregistre le joueur comme objet de noeud et met en place les éléments propres au rôle : entrée, caméra et targeter pour le propriétaire, interpolateur de position pour les autres, et le composant réseau adapté (serveur, local ou distant). S'abonne aussi aux messages de mission et de ferme. |
| `Player:load(playerData: table?)` | 504 | ✍ Enregistre les commandes console et, sur le serveur, restaure les données d'apparition et les ids d'outils depuis les données du joueur, puis charge de façon asynchrone les mains, la lampe torche et les outils de départ et téléporte au point d'apparition. Reconstruit la capsule, termine la configuration propriétaire ou distante et ajoute le joueur à `playerSystem`. |
| `Player:delete()` | 586 | ✍ Nettoie le joueur : quitte tout véhicule ou siège passager, le retire du système de joueurs, annule les chargements d'outils en attente, retire obstacles, abonnements, commandes console et hotspot, supprime les composants, rend les outils portés et supprime le noeud racine avant d'appeler le delete parent. |
| `Player:writeStream(streamId: integer, connection: Connection)` | 700 | ✍ Synchronisation initiale du serveur vers un client qui rejoint : indicateur de propriétaire, position des pieds, état contrôlé, id de ferme, id utilisateur, style s'il n'est pas celui par défaut, et objet mains s'il existe. |
| `Player:readStream(streamId: integer, connection: Connection, objectId: integer)` | 731 | ✍ Pendant client de `writeStream` : lit ces valeurs, appelle `initialise` et `load`, applique le style, téléporte le joueur à la position reçue et l'affiche ou le masque selon l'état contrôlé. |
| `Player:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 776 | ✍ Délègue l'écriture du flux de mise à jour (masque dirty) au composant réseau, s'il existe. |
| `Player:readUpdateStream(streamId: integer, timestamp: integer, connection: Connection)` | 789 | ✍ Délègue la lecture du flux de mise à jour entrant au composant réseau, s'il existe. |
| `Player:update(dt: number)` | 818 | ✍ Mise à jour par image : résout les mains et outils sauvegardés en attente par id, maintient le joueur actif tant qu'il est contrôlé, met à jour le HUD updater du propriétaire avec position et yaw, puis la machine à états. |
| `Player:updateTick(dt: number)` | 860 | ✍ Mise à jour au tick réseau : transmet à `updateTick` de l'état courant si celui-ci en définit un. |
| `Player:getUniqueUserId() → string?` | 1015 | ✍ Retourne l'id utilisateur unique persistant de ce joueur. |
| `Player:setUniqueUserId(uniqueUserId: string)` | 1026 | ✍ Définit l'id utilisateur unique une seule fois ; tenter de changer un id existant différent consigne une erreur et est ignoré. |
| `Player:onPickupHandTool(handTool: any)` | 1098 | ✍ Ajoute l'outil à la liste des outils portés et lui indique quel joueur le porte. Retourne false pour un outil nil, true sinon. |
| `Player:onDropHandTool(handTool: any)` | 1111 | ✍ Retire l'outil de la liste portée, en le déséquipant d'abord s'il est tenu, rafraîchit l'état de la lampe torche et efface son joueur porteur ; consigne une erreur et la pile d'appels s'il n'était pas porté. À noter : la ligne de log lit l'outil avant le test nil. |
| `Player:getCanPickupHandTool(handTool: any)` | 1136 | ✍ Retourne true si l'outil n'est pas nil, si le joueur y a accès via l'access handler de la mission, et si la limite de charge (`getReachedHandToolLimit`) n'est pas atteinte. |
| `Player:getIsHoldingHandTool() → boolean` | 1311 | ✍ Indique si un outil est actuellement tenu, d'après `getHeldHandTool`. |
| `Player:getIsCarryingHandTool(handTool: HandTool) → boolean` | 1335 | ✍ Indique si l'outil donné est dans la liste portée (en main ou dans le sac). |
| `Player:getCarriedHandToolMass() → number` | 1342 | ✍ Retourne la somme de `mass` de tous les outils portés. |
| `Player:getMapPositionAndLookYaw() → number, number, number` | 1357 | ✍ Retourne la position x et z du joueur ainsi que le yaw de la direction de vue de la caméra courante, pour l'affichage sur la carte. |
| `Player:updateControlledState(isControlled: boolean, skipModel: any, skipMover: any)` | 1857 | ✍ Appelle `show` ou `hide` selon l'état demandé ; ne fait rien si l'état est inchangé. |
| `Player:findSpawnPositionAndYaw() → number, number, number, number` | 1889 | ✍ Choisit la position et le yaw d'apparition dans l'ordre : apparition sauvegardée du joueur, paramètres d'auto-chargement (hauteur de terrain plus 0,2), point d'apparition de la ferme (ou point de départ de mission pour une sauvegarde invalide), sinon 0,0,0 avec un log d'erreur. |
| `Player:findEmptyAreaAroundPosition(x: number, y: number, z: number) → number, number, number` | 1933 | ✍ Espace réservé : retourne la position donnée sans changement ; la recherche d'une zone libre est signalée comme non implémentée. |
| `Player:getHasSpawnPosition() → boolean` | 1970 | ✍ Retourne true si les trois composantes de la position d'apparition sont définies. |
| `Player:getSpawnPosition() → number?, number?, number?` | 1979 | ✍ Retourne les x, y et z d'apparition stockés, nil s'ils ne sont pas définis. |
| `Player:getHasSpawnYaw() → boolean` | 1998 | ✍ Retourne true si un yaw d'apparition est stocké. |
| `Player:getSpawnYaw() → number?` | 2005 | ✍ Retourne le yaw d'apparition stocké, ou nil. |
| `Player:setSpawnYaw(spawnYaw: number?)` | 2012 | ✍ Stocke le yaw d'apparition (nombre ou nil). |
| `Player:getMovementYaw() → number` | 2047 | ✍ Retourne le yaw de déplacement du joueur tel que fourni par son mover. |
| `Player:show(skipShowingModel: any, skipEnablingMover: any, ignoreLocalCheck: any)` | 2154 | ✍ Rend le joueur contrôlé et visible : le rend actif, définit la connexion propriétaire et le dirty flag sur le serveur, publie `OWN_PLAYER_ENTERED`, pour le propriétaire active la caméra et l'entrée, et règle la visibilité du modèle. Ajoute aussi les obstacles d'eau peu profonde et d'IA, le hotspot de carte, l'entrée du système de trafic, et réinitialise l'outil en main. Ignoré si supprimé ou si un indicateur de contrôle local est défini (sauf forçage). |
| `Player:debugDraw(x: number, y: number, textSize: number) → number` | 2665 | ✍ Affiche des surcouches de debug : la liste des drapeaux actifs pour le propriétaire, le noeud racine, puis des sections de texte pour l'état, le mouvement, l'entrée, les graphismes, les outils et le réseau selon `Player.currentDebugFlag` ; retourne la position y suivante. |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.407)
- publie `MessageType.OWN_PLAYER_ENTERED` (l.2189)
