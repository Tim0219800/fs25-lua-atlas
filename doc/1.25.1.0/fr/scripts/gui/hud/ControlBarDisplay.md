# gui/hud/ControlBarDisplay.lua

*[English version](../../../../scripts/gui/hud/ControlBarDisplay.md)*

Source: `dataS/scripts/gui/hud/ControlBarDisplay.lua` — FS25 1.25.1.0

✍ Barre de contrôle HUD avec boutons tactiles/manette, dérivée de HUDDisplayElement. Elle déclare des tables de contrôles de véhicule (atteler, mise en marche, IA, quitter, décharger la fourche, quitter le cheval), de joueur (monter dans un véhicule/cheval, chevaucher) et un contrôle d'objet activable, chacun nommant les méthodes du véhicule ou du joueur appelées (availableFunc, actionFunc, ...). Elle affiche aussi jusqu'à deux boutons de niveau de remplissage avec barres de progression et glisse entre positions tactile et manette sur les plateformes à curseurs tactiles. updateButtons, updateButtonPositions et les constantes (UV, COLOR, POSITION, SIZE) ne sont pas définies dans ce fichier (NON VÉRIFIÉ).

- **ControlBarDisplay** hérite de `HUDDisplayElement` (l.34)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ControlBarDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 39 | ✍ Constructeur prenant le HUD, le chemin de l'atlas HUD et celui de l'atlas des contrôles. Crée un cadre de fond vide, initialise l'état et remplit les tables vehicleControls, playerControls et customControls (priorité, action d'entrée, UV d'icône et couleurs), puis appelle createComponents. |
| `ControlBarDisplay:createComponents()` | 226 | ✍ Crée un HUDButtonElement par contrôle avec son icône et son action d'entrée. Les callbacks ignorent les entrées pendant que le gestionnaire de sommeil dort ; les boutons de véhicule vérifient allowedFunc (avec un avertissement clignotant de 2,5 s si refusé) avant d'appeler actionFunc sur le véhicule, ceux du joueur l'appellent sur le joueur. Crée aussi deux contrôles de niveau de remplissage et mémorise les positions tactile et manette. |
| `ControlBarDisplay:setVehicle(vehicle: table)` | 320 | ✍ Définit le véhicule contrôlé, puis rafraîchit l'état de position, les tampons de niveaux de remplissage et les boutons. Si un bouton de changement de semences existe, son glyphe n'est visible que si le semoir attelé propose plus d'un type de semence. |
| `ControlBarDisplay:setPlayer(player: any)` | 339 | ✍ Mémorise la référence du joueur courant et met à jour l'état de position. |
| `ControlBarDisplay:update(dt: any)` | 347 | ✍ Mise à jour par frame : appelle l'update du parent, puis updateButtons et updateButtonPositions (définies ailleurs, NON VÉRIFIÉ). |
| `ControlBarDisplay:onInputHelpModeChange(inputHelpMode: any, force: any)` | 499 | ✍ Enregistre le nouveau mode d'aide à la saisie (clavier, manette...) et met à jour l'état de position, éventuellement forcé. |
| `ControlBarDisplay:onAIVehicleStateChanged(state: any, vehicle: any, force: any)` | 506 | ✍ Enregistre l'état d'activité de l'IA et met à jour l'état de position ; l'argument véhicule n'est pas utilisé. |
| `ControlBarDisplay:onGyroscopeSteeringChanged(state: any)` | 513 | ✍ Enregistre si la direction par gyroscope est active et met à jour l'état de position. |
| `ControlBarDisplay:updatePositionState(force: any)` | 531 | ✍ Choisit la disposition tactile ou manette : tactile si la plateforme a des curseurs tactiles et que l'entrée n'est pas la manette (ou si un joueur est à pied), manette sinon ou si la direction gyroscope est active ; puis l'applique. |
| `ControlBarDisplay:setPositionState(state: any, force: any)` | 550 | ✍ Sans effet sans curseurs tactiles. Lors d'un changement d'état, lance un tween vers la position tactile ou manette (le tactile est cinq fois plus rapide, un changement forcé est quasi instantané). |
| `ControlBarDisplay:addFillLevelControl()` | 583 | ✍ Crée un contrôle de niveau de remplissage : un bouton de changement de semences avec icône, plus une barre de fond et une barre de remplissage utilisant les UV de l'atlas. L'enregistre avec une priorité et renvoie la table du contrôle. |
| `ControlBarDisplay:addFillLevel(fillType: any, fillLevel: any, capacity: any, precision: any, maxReached: any)` | 620 | ✍ Collecteur appelé par vehicle:getFillLevelInformation : ajoute niveau et capacité à l'entrée du même type de remplissage (et mémorise precision, maxReached) ou ajoute une nouvelle entrée, en suivant l'ordre d'insertion pour le tri. |
| `ControlBarDisplay:updateFillLevelBuffers(vehicle: any)` | 650 | ✍ Masque les boutons de niveau de remplissage, remet le tampon à zéro, demande au véhicule ses informations de remplissage, trie par ordre d'insertion si nécessaire et alimente un contrôle avec chaque entrée de capacité non nulle (au plus autant que de contrôles). |
| `ControlBarDisplay.sortFillLevelBuffers(a: any, b: any)` | 691 | ✍ Comparateur pour table.sort ordonnant les entrées de remplissage par addIndex. |
| `ControlBarDisplay:updateFillLevelControl(fillLevelControl: any, fillLevelBuffer: any)` | 697 | ✍ Règle le pourcentage de la barre (UV et échelle), remplace l'icône du bouton par l'overlay HUD du type de remplissage, lie le semoir si son type de semence correspond, et définit l'état actif/visible du bouton (visible si niveau supérieur à zéro ou lié au semoir). |
| `ControlBarDisplay:setScale(uiScale: any)` | 756 | ✍ Applique une échelle d'interface uniforme, recalcule la position du fond et les positions tactile/manette, mémorise la position d'origine et conserve la visibilité et la position tactile actuelles. |
| `ControlBarDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 784 | ✍ Renvoie la position écran du fond à partir de la constante POSITION.BACKGROUND multipliée par l'échelle ; l'argument largeur n'est pas utilisé. |
| `ControlBarDisplay.createBackground()` | 795 | ✍ Crée un overlay sans image aux dimensions SIZE.BACKGROUND, utilisé uniquement comme cadre de positionnement. |
