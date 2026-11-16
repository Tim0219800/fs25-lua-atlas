# gui/hud/InfoDisplay.lua

*[English version](../../../../scripts/gui/hud/InfoDisplay.md)*

Source: `dataS/scripts/gui/hud/InfoDisplay.lua` — FS25 1.25.1.0

✍ Classe de base des panneaux d'information HUD ancrés en bas à droite de l'écran (étend HUDDisplay). Elle garde une liste de boîtes (InfoDisplayBox) et leur transmet les changements d'échelle. Les champs boxes, totalHeight et isEnabled sont renseignés par des sous-classes ou d'autres codes, pas ici (NON VÉRIFIÉ).

- **InfoDisplay** hérite de `HUDDisplay` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InfoDisplay:setScale(uiScale: number)` | 30 | ✍ Applique l'échelle d'interface via la classe parente, puis appelle setScale sur chaque boîte de self.boxes. |
| `InfoDisplay:storeScaledValues()` | 40 | ✍ Ancre l'affichage au point d'ancrage droit/bas du HUD et met en cache une marge verticale de 5 pixels entre les boîtes, en unités écran. |
| `InfoDisplay:getDisplayHeight()` | 92 | ✍ Retourne la hauteur totale mémorisée si l'affichage est activé, sinon 0. |
