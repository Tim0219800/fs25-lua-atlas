# gui/hud/SwitchVehicleDisplay.lua

*[English version](../../../../scripts/gui/hud/SwitchVehicleDisplay.md)*

Source: `dataS/scripts/gui/hud/SwitchVehicleDisplay.lua` — FS25 1.25.1.0

✍ Élément HUD tactile/mobile (sous-classe de HUDDisplayElement) avec flèches gauche/droite et glyphes d'entrée pour passer d'un véhicule du joueur à l'autre via g_localPlayer. Il glisse entre une position manette et une position tactile selon le mode d'entrée, la direction gyroscope et le support tactile de la plateforme. Côté client uniquement. createBackgroundElements est appelée ici mais non définie dans ce fichier (NON VÉRIFIÉ).

- **SwitchVehicleDisplay** hérite de `HUDDisplayElement` (l.34)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SwitchVehicleDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 39 | ✍ Crée l'affichage sur un overlay de positionnement vide, initialise l'état (ni véhicule ni joueur, listes de boutons tactiles et de contrôles vides) et construit les composants. |
| `SwitchVehicleDisplay:setVehicle(vehicle: table)` | 75 | ✍ Mémorise le véhicule contrôlé et met à jour l'état de position. |
| `SwitchVehicleDisplay:setPlayer(player: any)` | 83 | ✍ Mémorise le joueur à pied et met à jour l'état de position. |
| `SwitchVehicleDisplay:createComponents()` | 173 | ✍ Construit le fond, l'icône, les deux glyphes d'entrée (changer de véhicule et revenir), les overlays de flèches gauche et droite et enregistre trois gestionnaires tactiles par flèche (relâchement, appui, annulation) auprès du HUD. Mémorise les positions cibles tactile et manette. |
| `SwitchVehicleDisplay:onSwitchLeft(x: any, y: any, isCancel: any)` | 234 | ✍ Gestionnaire de la flèche gauche : sauf sommeil, inactivité ou annulation, fait passer le joueur local au véhicule précédent (-1). |
| `SwitchVehicleDisplay:onSwitchRight(x: any, y: any, isCancel: any)` | 250 | ✍ Gestionnaire de la flèche droite : sauf sommeil, inactivité ou annulation, fait passer le joueur local au véhicule suivant (+1). |
| `SwitchVehicleDisplay:updatePositionState(force: any)` | 301 | ✍ Choisit l'état manette pour une entrée manette, l'absence de curseurs tactiles ou la direction gyroscope en véhicule ; sinon l'état tactile. L'applique via setPositionState. |
| `SwitchVehicleDisplay:onInputHelpModeChange(inputHelpMode: any, force: any)` | 315 | ✍ Mémorise le nouveau mode d'aide à la saisie et met à jour l'état de position, éventuellement forcé. |
| `SwitchVehicleDisplay:onGyroscopeSteeringChanged(state: any)` | 322 | ✍ Mémorise l'état de la direction au gyroscope et met à jour l'état de position. |
| `SwitchVehicleDisplay:setPositionState(state: any, force: any)` | 329 | ✍ Interpole l'affichage vers la position manette ou tactile quand l'état change (plus rapide vers le tactile, quasi instantané si forcé). Ne fait rien sur les plateformes sans curseurs tactiles. |
| `SwitchVehicleDisplay:setScale(uiScale: any)` | 366 | ✍ Applique une nouvelle échelle d'interface : redimensionne l'élément, recalcule les positions tactile et manette et la position d'origine, et conserve la position tactile quand cet état est actif. |
| `SwitchVehicleDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 394 | ✍ Renvoie la position écran de l'affichage pour l'échelle donnée (l'argument de largeur est inutilisé). |
| `SwitchVehicleDisplay.createBackground()` | 405 | ✍ Crée l'overlay vide servant uniquement de cadre de positionnement à l'affichage. |
