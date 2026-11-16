# gui/hud/ContextActionDisplay.lua

*[English version](../../../../scripts/gui/hud/ContextActionDisplay.md)*

Source: `dataS/scripts/gui/hud/ContextActionDisplay.lua` — FS25 1.25.1.0

✍ Affichage HUD de l'invite d'action contextuelle (atteler, carburant, déverser, nourriture animale), montré en bas au centre avec un glyphe de touche ou de manette, une icône, un titre d'action et une description. Le contexte doit être redéfini à chaque frame ; la plus haute priorité l'emporte et il reste visible pendant ContextActionDisplay.MIN_DISPLAY_DURATION après le dernier appel. Dérivé de HUDDisplay ; masqué tant que le message en jeu est visible. updateControls est appelée mais non définie ici (NON VÉRIFIÉ, probablement dans HUDDisplay).

- **ContextActionDisplay** hérite de `HUDDisplay` (l.33)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ContextActionDisplay.new(customMt: any?) → any` | 39 | ✍ Constructeur. Associe les valeurs CONTEXT_ICON (ATTACH, FUEL, TIP, FILL_BOWL) à des identifiants de tranches GUI et crée les overlays de boutons glyphe/touche et l'overlay d'icône teinté. Aucun contexte n'est défini au départ. |
| `ContextActionDisplay:storeScaledValues()` | 75 | ✍ Calcule la position à l'échelle (bas centre), la taille de l'icône, les tailles de texte, les décalages, la largeur max du texte, la hauteur des boutons et leurs largeurs minimales. |
| `ContextActionDisplay:update(dt: any)` | 108 | ✍ Décompte le temps d'affichage de dt (ms) tant qu'il est visible ; à zéro, il masque l'affichage et réinitialise le contexte. |
| `ContextActionDisplay:draw()` | 124 | ✍ Dessine l'invite : boutons clavier ou manette, icône, titre gras coloré et description à retour à la ligne, centrés en groupe. Ignoré si le message en jeu (g_currentMission.hud.ingameMessage) est visible ou si aucun contrôle n'est défini. |
| `ContextActionDisplay:setContext(contextAction: string, contextIconName: string, text: string, priority: integer?, actionText: string?)` | 206 | ✍ Enregistre le contexte pour cette frame : nom d'action, icône, texte, priorité optionnelle (0 par défaut) et titre d'action optionnel. Accepté si sa priorité est au moins égale à l'actuelle et si l'icône est connue (textes en majuscules) ; sinon rafraîchit seulement le minuteur s'il s'agit de la même action. À appeler à chaque frame. |
| `ContextActionDisplay:resetContext()` | 235 | ✍ Efface les contrôles, le texte et la priorité pour que la frame suivante puisse définir un nouveau contexte. |
