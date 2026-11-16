# gui/hud/SteeringSliderDisplay.lua

*[English version](../../../../scripts/gui/hud/SteeringSliderDisplay.md)*

Source: `dataS/scripts/gui/hud/SteeringSliderDisplay.lua` — FS25 1.25.1.0

✍ Élément HUD tactile/mobile (sous-classe de HUDDisplayElement) avec un curseur de direction horizontal à recentrage automatique. Il envoie la direction au véhicule ou à la monture contrôlé à chaque mise à jour sauf si la direction au gyroscope est active, et se cache en mode manette, direction gyroscope, conduite IA ou joueur à pied. N'a de sens que si Platform.hasTouchSliders est vrai. Côté client uniquement.

- **SteeringSliderDisplay** hérite de `HUDDisplayElement` (l.31)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SteeringSliderDisplay.new(hud: string, hudAtlasPath: string)` | 36 | ✍ Crée l'affichage sur un overlay de positionnement vide, initialise l'état (position de repos 0,5, aucun véhicule), construit les composants et s'abonne aux changements du réglage de vitesse de retour de direction. |
| `SteeringSliderDisplay:delete()` | 63 | ✍ Se désabonne de tous les messages du message center et supprime l'élément via la classe parente. |
| `SteeringSliderDisplay:setVehicle(vehicle: table)` | 72 | ✍ Définit le véhicule contrôlé, détecte s'il est monture et réinitialise la texture de la poignée. |
| `SteeringSliderDisplay:setPlayer(player: any)` | 83 | ✍ Définit la référence du joueur à pied et rafraîchit l'état de visibilité. |
| `SteeringSliderDisplay:createComponents()` | 91 | ✍ Construit le fond, la poignée du curseur (vitesse de recentrage issue du réglage de retour de direction) et l'icône de volant attachée à la poignée. |
| `SteeringSliderDisplay:setVisible(isVisible: boolean, animate: boolean)` | 140 | ✍ Surcharge la visibilité : la demande est transmise au parent sauf si elle demande l'affichage en mode d'aide manette, auquel cas rien ne se passe. |
| `SteeringSliderDisplay:onSliderPositionChanged(position: any)` | 148 | ✍ Callback du curseur mémorisant la nouvelle position bornée entre 0 et 1. |
| `SteeringSliderDisplay:getSteeringValue()` | 154 | ✍ Convertit la position du curseur en valeur de direction entre -1 et 1 avec une courbe quadratique (signe conservé), pour plus de finesse près du centre. |
| `SteeringSliderDisplay:getIsSliderActive()` | 173 | ✍ Renvoie vrai seulement si utilisable : pas en mode manette, curseurs tactiles supportés, direction gyroscope désactivée, aucune IA active sur le véhicule et aucun joueur à pied. |
| `SteeringSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 200 | ✍ Mémorise le nouveau mode d'aide à la saisie et rafraîchit l'état de visibilité. |
| `SteeringSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 208 | ✍ Callback d'état IA : rafraîchit l'état de visibilité (l'argument véhicule n'est pas comparé ici). |
| `SteeringSliderDisplay:onGyroscopeSteeringChanged(state: any)` | 214 | ✍ Mémorise l'état de la direction au gyroscope et rafraîchit l'état de visibilité. |
| `SteeringSliderDisplay:updateVisibilityState()` | 222 | ✍ Quand l'activité du curseur diffère de l'état d'animation mémorisé, affiche ou cache l'affichage (animé) et active ou désactive le toucher sur la poignée. |
| `SteeringSliderDisplay:onSteeringBackSpeedSettingChanged()` | 232 | ✍ Callback de réglage : réapplique à la poignée le facteur de vitesse de recentrage (valeur du réglage divisée par 10). |
| `SteeringSliderDisplay:update(dt: any)` | 244 | ✍ Mise à jour par frame : sauf direction gyroscope active, envoie la valeur de direction du curseur à la monture ou au véhicule via setSteeringInput (catégorie volant). Met ensuite à jour le curseur. |
| `SteeringSliderDisplay:setScale(uiScale: any)` | 280 | ✍ Applique une nouvelle échelle d'interface : redimensionne l'élément, recalcule position, plage du curseur et position d'origine en conservant la visibilité courante. |
| `SteeringSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 303 | ✍ Renvoie la position écran de l'affichage pour l'échelle donnée (l'argument de largeur est inutilisé). |
| `SteeringSliderDisplay.createBackground()` | 314 | ✍ Crée l'overlay vide servant uniquement de cadre de positionnement à l'affichage. |

## Messages

- s'abonne à `MessageType.SETTING_CHANGED` (l.56)
