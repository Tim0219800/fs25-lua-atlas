# gui/hud/GamePausedDisplay.lua

*[English version](../../../../scripts/gui/hud/GamePausedDisplay.md)*

Source: `dataS/scripts/gui/hud/GamePausedDisplay.lua` — FS25 1.25.1.0

✍ Bandeau HUD pleine largeur affichant un texte de pause sur une bande sombre au centre de l'écran, éventuellement sur un fond d'écran de démarrage. Dérivé de HUDDisplay. Le texte par défaut est le mot allemand pour pause, codé en dur, modifiable avec setPauseText.

- **GamePausedDisplay** hérite de `HUDDisplay` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GamePausedDisplay.new() → table` | 28 | ✍ Constructeur. Crée l'overlay de fond d'écran de démarrage et définit le texte de pause par défaut en majuscules. À noter : il appelle SideNotification:superClass().new au lieu de sa propre superclasse, ce qui ressemble à un copier-coller. |
| `GamePausedDisplay:storeScaledValues()` | 43 | ✍ Centre le bandeau à l'écran et calcule sa hauteur (75 px à l'échelle), la taille et le décalage du texte. |
| `GamePausedDisplay:draw(drawBackground: any)` | 57 | ✍ Lorsqu'il est visible, affiche éventuellement le fond, puis dessine une bande noire translucide sur tout l'écran et le texte de pause gras centré. |
| `GamePausedDisplay:setPauseText(text: any)` | 83 | ✍ Remplace le texte de pause, converti en majuscules. |
