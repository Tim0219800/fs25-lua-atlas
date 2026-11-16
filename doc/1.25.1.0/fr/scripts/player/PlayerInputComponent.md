# player/PlayerInputComponent.lua

*[English version](../../../scripts/player/PlayerInputComponent.md)*

Source: `dataS/scripts/player/PlayerInputComponent.lua` — FS25 1.25.1.0

✍ Collecte les entrées brutes d'un joueur à pied (déplacement, regard, course, saut, accroupissement, vol, changement de caméra, entrée en véhicule, outil à main et lampe) et les stocke sous forme de valeurs d'axe par image lues par `PlayerMover`, `PlayerCamera` et les états du joueur. Seul le joueur propriétaire enregistre des action events via `g_inputBinding` (et des gestes tactiles si `g_touchHandler` existe). Plusieurs gestionnaires enregistrés (zoom, bascule du vol, outil à main, lampe, actions de pause) et des aides comme `setMovementDirection` ne sont pas dans ce dump (NON VÉRIFIÉ).

- **PlayerInputComponent** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerInputComponent.new(player: Player) → PlayerInputComponent` | 24 | ✍ Crée le composant d'entrée d'un joueur avec tous les axes à zéro, non verrouillé, et construit les textes d'activation et de désactivation de la lampe à partir de la traduction `storeItem_flashlight`. |
| `PlayerInputComponent:addPauseListeners(isControlling: boolean)` | 129 | ✍ Si ce joueur est contrôlé et qu'une mission existe, abonne `onGamePaused` aux notifications de pause de la mission ; sinon ne fait rien. |
| `PlayerInputComponent:registerActionEvents()` | 145 | ✍ Propriétaire uniquement : dans le contexte d'entrée du joueur, enregistre les actions de déplacement, regard, zoom, course, vol, saut, accroupissement, changement de caméra, outil à main, entrée et lampe, ainsi que des gestes tactiles et des actions de pause. Il enregistre aussi un type de cible (animaux, véhicules, arbres, objets dynamiques, 0,5 à 3 m) sur le targeter du joueur. |
| `PlayerInputComponent:unregisterActionEvents()` | 362 | ✍ Propriétaire uniquement : retire tous les action events enregistrés par ce composant, les écouteurs de gestes tactiles pincement, Y et X, et le type de cible du targeter, puis efface les identifiants d'actions stockés. L'écouteur du double tap n'est pas retiré ici. |
| `PlayerInputComponent:resetState()` | 482 | ✍ Copie les valeurs d'entrée courantes dans les champs `last*`, puis remet à zéro les entrées de déplacement, course, vol, saut et caméra. L'accroupissement est conservé tant que le composant est verrouillé. |
| `PlayerInputComponent:lock()` | 522 | ✍ Mémorise la valeur d'accroupissement actuelle et ignore la plupart des entrées jusqu'au déverrouillage. |
| `PlayerInputComponent:unlock()` | 529 | ✍ Déverrouille les entrées et, si l'entrée d'accroupissement a changé pendant le verrouillage, réapplique la valeur d'accroupissement stockée pendant celui-ci. |
| `PlayerInputComponent:calculateNormalisedMovementDirection() → number, number` | 551 | ✍ Renvoie la direction de déplacement sous forme de vecteur 2D normalisé (droite, avant) dans l'espace local du joueur, ou 0, 0 sans entrée de déplacement. |
| `PlayerInputComponent:calculateNormalisedWorldMovementDirection() → number, number` | 583 | ✍ Convertit la direction de déplacement locale normalisée en x/z monde via le noeud de lacet de la caméra. Renvoie 0, 0 sans entrée ou sans noeud de lacet, donc ne fonctionne que pour le joueur contrôlé. |
| `PlayerInputComponent:onInputMoveSide(_: nil, inputValue: number)` | 860 | ✍ Callback d'action du déplacement gauche/droite : ignore les entrées verrouillées et les valeurs dans la zone morte du joystick, borne à -1..1, ajoute à `moveRight`, puis met à jour l'axe de marche et la direction de déplacement monde. |
| `PlayerInputComponent:onInputMoveForward(_: nil, inputValue: number)` | 890 | ✍ Callback d'action du déplacement avant/arrière : même filtrage que le déplacement latéral, mais la valeur est soustraite de `moveForward`. Met ensuite à jour l'axe de marche et la direction monde. |
| `PlayerInputComponent:touchEventLookUpDown(value: any)` | 918 | ✍ Gestionnaire de geste tactile pour le regard vertical : ignoré hors du contexte d'entrée du joueur, sinon met le geste à l'échelle de l'écran et le transmet à `onInputLookUpDown` comme entrée non souris. |
| `PlayerInputComponent:touchEventZoomInOut(value: any)` | 929 | ✍ Gestionnaire de pincement tactile : ignoré hors du contexte d'entrée du joueur, sinon transmet la valeur mise à l'échelle et inversée à `onInputZoomInOut` (défini hors de ce dump). |
| `PlayerInputComponent:touchEventLookLeftRight(value: any)` | 939 | ✍ Gestionnaire de geste tactile pour le regard horizontal : ignoré hors du contexte d'entrée du joueur, sinon met à l'échelle selon le ratio d'écran et le transmet à `onInputLookLeftRight` comme entrée non souris. |
| `PlayerInputComponent:onInputLookLeftRight(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 967 | ✍ Ajoute l'entrée de regard horizontal à `cameraRotationY`, en ignorant l'entrée verrouillée et la zone morte. Les valeurs souris utilisent un pas fixe de 16,666 ms, les autres périphériques le temps de l'image courante ; mémorise aussi si la source était la souris. |
| `PlayerInputComponent:onInputLookUpDown(_: nil, inputValue: number, _: nil, _: nil, isMouse: boolean)` | 1000 | ✍ Ajoute l'entrée de regard vertical à `cameraRotationX` avec les mêmes règles de zone morte et de temps que le regard horizontal, et inverse le signe si le réglage INVERT_Y_LOOK est actif. |
| `PlayerInputComponent:onInputRun(_: nil, inputValue: number)` | 1052 | ✍ Définit l'axe de course à partir de la valeur d'entrée bornée à 0..1, sauf si l'entrée est verrouillée. |
| `PlayerInputComponent:onInputChangeAltitude(_: nil, inputValue: number)` | 1070 | ✍ Définit l'axe de vol (-1 vers le bas à 1 vers le haut) à partir de la valeur d'entrée, sauf si l'entrée est verrouillée. Utilisé par le mode vol de debug. |
| `PlayerInputComponent:onInputJump(_: nil, inputValue: number)` | 1088 | ✍ Définit la puissance de saut à partir de la valeur d'entrée bornée à 0..1, sauf si l'entrée est verrouillée. |
| `PlayerInputComponent:onInputCrouch(_: nil, inputValue: number)` | 1106 | ✍ Enregistre la valeur d'accroupissement bornée à 0..1 ; pendant le verrouillage, elle est stockée dans la valeur d'accroupissement verrouillée et appliquée au déverrouillage. |
| `PlayerInputComponent:onInputSwitchCamera()` | 1121 | ✍ Bascule entre première et troisième personne sur la caméra du joueur, sauf si l'entrée est verrouillée ou si le joueur est dans un véhicule. |
| `PlayerInputComponent:onInputEnter()` | 1138 | ✍ Gère l'action d'entrée : ignorée dans les 200 ms suivant la dernière interaction. Interagit avec le véhicule interactif à portée, ou sinon démarre la monte de l'animal ciblé (fondu d'écran) ou affiche une notification critique si la limite de monte est atteinte. Les détails de `FSBaseMission` sont NON VÉRIFIÉS. |
| `PlayerInputComponent:onGamePaused(isPaused: boolean)` | 1209 | ✍ Écouteur de pause : verrouille les entrées quand le jeu se met en pause et les déverrouille à la reprise. |
| `PlayerInputComponent:debugDraw(x: number, y: number, textSize: number) → number` | 1225 | ✍ Affiche du texte de debug pour la puissance de saut, l'accroupissement et l'indicateur de mouvement de l'image précédente, puis appelle `debugDrawMovementGraphs` (absente de ce dump). Renvoie la position y suivante. |
