# player/PlayerMover.lua

*[English version](../../../scripts/player/PlayerMover.md)*

Source: `dataS/scripts/player/PlayerMover.lua` — FS25 1.25.1.0

✍ Transforme les demandes de déplacement en mouvement réel du joueur à pied : accumule les forces, les applique via le contrôleur capsule (CCT) du joueur, et suit la vitesse, la vélocité, les chronomètres au sol/en l'air/en chute, l'immersion dans l'eau (nage) et un mode vol de debug. Il expose une liste d'écouteurs `onPositionTeleport` et lève le dirty flag du joueur pour que les changements soient synchronisés. Des aides comme `getPosition`, `updateDeltas`, `updateRotation`, `updateFlightCollision`, `getIsPhysicsEnabled` et `calculateWadeScalar` ne figurent pas dans ce dump (NON VÉRIFIÉ).

- **PlayerMover** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerMover.new(player: Player) → PlayerMover` | 59 | ✍ Crée le mover d'un joueur avec forces, vélocité et chronomètres à zéro, réserve un dirty flag auprès du joueur et crée la liste d'écouteurs `onPositionTeleport`. Un TODO du code sur le dirty flag reste non résolu. |
| `PlayerMover:initialise()` | 148 | ✍ Appelée au premier chargement du joueur : crée dans la racine de la scène un groupe de transformation qui marque la direction du mouvement. |
| `PlayerMover:calculateSmoothSpeed(moveScalar: number, doWading: boolean, minimumSpeed: number, maximumSpeed: number) → number` | 191 | ✍ Renvoie une vitesse interpolée entre le minimum et le maximum selon le scalaire de mouvement. Avec le pataugeage activé, renvoie 0 pour un scalaire nul, prend la vitesse de nage comme minimum en cas de forte immersion et ralentit le scalaire selon la profondeur. |
| `PlayerMover:toggleFlightActive()` | 216 | ✍ Inverse le mode vol via `setFlightActive`. Sans effet si la commande de vol n'est pas activée. |
| `PlayerMover:setFlightActive(isFlightActive: boolean, isForced: boolean?)` | 224 | ✍ Active ou désactive le vol puis rafraîchit la collision du joueur. Sauf si `isForced` est vrai, l'appel est ignoré quand la commande de vol du joueur est absente ou à false. |
| `PlayerMover:getIsFlightCollisionDisabled() → boolean` | 241 | ✍ Renvoie si la collision du joueur est configurée pour être désactivée pendant le vol. |
| `PlayerMover:setIsFlightCollisionDisabled(isFlightCollisionDisabled: boolean)` | 248 | ✍ Définit si la collision est désactivée pendant le vol et rafraîchit immédiatement l'état de collision via `updateFlightCollision`. |
| `PlayerMover:getMovementYaw() → number` | 313 | ✍ Renvoie le lacet de la direction de mouvement dans l'espace monde ; le modèle visuel le suit en douceur. |
| `PlayerMover:setPosition(x: number, y: number, z: number, setNodeTranslation: boolean?)` | 368 | ✍ Déplace le contrôleur capsule du joueur à la position donnée (en réglant aussi éventuellement la translation du noeud) et lève le dirty flag par défaut. |
| `PlayerMover:getSpeed() → number` | 412 | ✍ Renvoie la vitesse horizontale enregistrée du joueur (m/s). |
| `PlayerMover:teleportTo(x: number, y: number, z: number, setNodeTranslation: boolean?, noEventSend: boolean?)` | 477 | ✍ Publie `PLAYER_PRE_TELEPORT`, prévient le serveur par un `PlayerTeleportEvent` quand l'appel vient d'un client propriétaire (sauf `noEventSend`), mémorise l'ancienne position, applique la nouvelle et invoque `onPositionTeleport`. |
| `PlayerMover:moveHorizontally(currentForceX: number, currentForceZ: number)` | 564 | ✍ Ajoute un mouvement x/z à la force accumulée de cette image et lève le dirty flag. La position elle-même ne change qu'à la mise à jour suivante. |
| `PlayerMover:moveVertically(currentForceY: number)` | 577 | ✍ Ajoute un mouvement y à la force accumulée de cette image et lève le dirty flag. La position elle-même ne change qu'à la mise à jour suivante. |
| `PlayerMover:updateFloorDistance(dt: number, isGrounded: any, currentX: any, currentY: any, currentZ: any)` | 589 | ✍ Met à jour l'état au sol, la distance au sol, l'indicateur de proximité du sol et les chronomètres de sol, d'air et de chute. En l'air, lance un rayon vers le bas (jusqu'à 200 m, depuis 10 m au-dessus du joueur) contre le terrain, les objets statiques et les routes, et se rabat sur y = 0 en l'absence d'impact. |
| `PlayerMover:onGroundRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 632 | ✍ Callback du raycast de contrôle du sol : enregistre la hauteur de l'impact comme niveau du sol quand un objet est touché. |
| `PlayerMover:updateWaterSubmergeDistance(currentX: any, currentY: any, currentZ: any)` | 640 | ✍ Lance un raycast asynchrone vers le bas (6 m, depuis 3 m au-dessus du joueur) contre le groupe de collision de l'eau ; le résultat est traité dans `onWaterRaycastCallback`. |
| `PlayerMover:onWaterRaycastCallback(hitObjectId: number, x: number, y: number, z: number)` | 655 | ✍ Calcule la profondeur d'immersion à partir de la hauteur de l'impact sur l'eau et de la position y du joueur enregistrée au lancer du rayon, puis définit `isInWater`, `needSwimming` et `isSwimming` (ce dernier avec un seuil inférieur de 0,2 à `needSwimming`). |
| `PlayerMover:update(dt: number)` | 678 | ✍ Mise à jour à chaque image : si la physique est active, calcule les deltas de position et déplace le contrôleur capsule. Vérifie ensuite le contact avec le sol (serveur ou physique active seulement), rafraîchit les données d'eau et de sol, puis met à jour le lacet de mouvement et la vitesse de rotation. |
| `PlayerMover:debugDraw(x: number, y: number, textSize: number) → number` | 895 | ✍ Dessine le noeud de direction de mouvement et des lignes de texte de debug pour la position, la vélocité, le lacet, la vitesse et les données d'eau et de sol. Renvoie la position y suivante. |

## Messages

- publie `MessageType.PLAYER_PRE_TELEPORT` (l.479)
