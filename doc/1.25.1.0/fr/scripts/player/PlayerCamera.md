# player/PlayerCamera.lua

*[English version](../../../scripts/player/PlayerCamera.md)*

Source: `dataS/scripts/player/PlayerCamera.lua` — FS25 1.25.1.0

✍ Caméra d'un joueur, utilisable en première ou troisième personne. Elle possède le noeud de lacet, le noeud de tangage et le noeud racine de caméra, et gère la rotation selon les entrées, le suivi du joueur, le zoom et la distance de collision, le balancement de la vue en première personne et les forçages temporaires de cible. Elle s'abonne aux réglages de champ de vision du joueur. Plusieurs fonctions qu'elle appelle (`initialiseCameraNodes`, `switchToPerspective`, `applyZoom`, `getHasOverriddenTarget`, `getBaseOffsetY`) ne sont pas dans ce dump (NON VÉRIFIÉ).

- **PlayerCamera** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerCamera.new(player: Player) → PlayerCamera` | 59 | ✍ Crée la caméra d'un joueur, en première personne au départ, collision activée et zoom par défaut, et s'abonne aux changements des réglages de FOV en première et troisième personne. Aucun noeud de scène n'existe encore. |
| `PlayerCamera:initialise()` | 126 | ✍ Appelée au premier chargement du joueur ; délègue à `initialiseCameraNodes` (absente de ce dump) pour créer les noeuds de caméra dans la scène. |
| `PlayerCamera:makeCurrent()` | 202 | ✍ Rend cette caméra active dans `g_cameraManager` : la caméra première personne, la caméra de conversation à la troisième personne pendant une conversation, ou la caméra troisième personne normale. |
| `PlayerCamera:toggleThirdPersonMode()` | 214 | ✍ Bascule entre première et troisième personne en appelant `switchToPerspective` avec l'inverse du mode actuel. |
| `PlayerCamera:getIsCollisionEnabled() → boolean` | 332 | ✍ Renvoie l'indicateur de collision stocké. À noter : le code renvoie simplement la variable, elle n'est donc pas forcée à false en première personne. |
| `PlayerCamera:setIsCollisionEnabled(isCollisionEnabled: boolean)` | 339 | ✍ Définit si la caméra entre en collision avec les objets derrière elle. |
| `PlayerCamera:getOffsetY() → number` | 368 | ✍ Renvoie le décalage vertical supplémentaire de la caméra, utilisé pour des ajustements fins comme la nage. |
| `PlayerCamera:setOffsetY(offsetY: number)` | 375 | ✍ Définit le décalage vertical supplémentaire, 0 si nil est donné. |
| `PlayerCamera:getCurrentZoomDistance() → number` | 382 | ✍ Renvoie la distance actuelle entre la racine de la caméra et le point de focalisation. |
| `PlayerCamera:setCurrentZoomDistance(zoomDistance: number, isForced: boolean?)` | 390 | ✍ Enregistre la distance de zoom et recule le noeud racine de la caméra de cette valeur sur son axe z local. Le paramètre `isForced` n'est pas utilisé. |
| `PlayerCamera:getDesiredZoomDistance() → number` | 398 | ✍ Renvoie la distance de zoom souhaitée par le joueur, ou 0 en première personne. |
| `PlayerCamera:getFocusPosition() → number, number, number` | 419 | ✍ Renvoie la position monde du noeud de lacet, point autour duquel la caméra orbite et vers lequel elle regarde. |
| `PlayerCamera:setFocusPosition(x: number, y: number, z: number)` | 428 | ✍ Déplace le noeud de lacet à la position monde donnée. |
| `PlayerCamera:getCameraPosition() → number, number, number` | 486 | ✍ Renvoie la position monde du noeud racine de la caméra lui-même. |
| `PlayerCamera:getRotation() → number, number, number` | 495 | ✍ Renvoie le tangage, le lacet et le roulis calculés à partir de la direction avant de la caméra, ce qui évite l'inversion d'Euler du moteur ; le roulis est lu directement sur le noeud. |
| `PlayerCamera:setRotation(pitch: number, yaw: number, roll: number)` | 509 | ✍ Applique le tangage au noeud de tangage, le lacet au noeud de lacet et le roulis au noeud racine de caméra (qui est aussi tourné de pi). Les valeurs nil valent 0. |
| `PlayerCamera:calculateWorldDirection(directionX: number, directionZ: number) → number, number` | 521 | ✍ Convertit une direction locale x/z relative au noeud de lacet en direction monde x/z (la composante y est ignorée). |
| `PlayerCamera:calculateLocalDirection(directionX: number, directionZ: number) → number, number` | 532 | ✍ Convertit une direction monde x/z en direction locale au noeud de lacet (la composante y est ignorée). |
| `PlayerCamera:updateRotation(dt: number)` | 553 | ✍ Fait tourner la caméra selon les deltas d'entrée du joueur multipliés par le réglage de sensibilité, en bornant le tangage entre `LOWEST_PITCH` et `HIGHEST_PITCH`. Pendant un forçage de cible, elle suit la cible à la place. |
| `PlayerCamera:updatePosition(dt: number)` | 580 | ✍ Mise à jour de position à chaque image : suit le joueur, applique le balancement en première personne et la logique de zoom (`applyZoom`, absente de ce dump). Avec un forçage de cible, elle ne se met à jour que depuis la cible. |
| `PlayerCamera:focusOnPlayer()` | 600 | ✍ Centre la caméra sur la position graphique (interpolée) du joueur. |
| `PlayerCamera:focusOnPosition(x: number, y: number, z: number)` | 666 | ✍ Déplace le point de focalisation à la position donnée plus le décalage y courant et le décalage y de base (`getBaseOffsetY`, absente de ce dump). |
| `PlayerCamera:tryApplyViewBobbing(dt: number)` | 674 | ✍ Applique le balancement de la caméra (décalage x/y et roulis, lissé à chaque image) en première personne pendant la marche au sol, si le réglage CAMERA_BOBBING est actif. En troisième personne ou réglage désactivé, il réinitialise simplement le décalage de la caméra ; il ne fait rien si la vitesse du joueur dépasse 10. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.117)
- s'abonne à `MessageType.SETTING_CHANGED` (l.118)
