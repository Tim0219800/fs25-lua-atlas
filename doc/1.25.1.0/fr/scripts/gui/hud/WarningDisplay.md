# gui/hud/WarningDisplay.lua

*[English version](../../../../scripts/gui/hud/WarningDisplay.md)*

Source: `dataS/scripts/gui/hud/WarningDisplay.lua` — FS25 1.25.1.0

✍ Élément HUD (sous-classe de HUDDisplay) dessinant une pile verticale de boîtes d'avertissement rouges avec une icône d'info, légèrement sous le centre de l'écran. Chaque entrée de la liste warnings est rendue dans une boîte noire arrondie avec texte gras à retour à la ligne. L'ajout des avertissements à la liste est NON VÉRIFIÉ (absent de ce fichier).

- **WarningDisplay** hérite de `HUDDisplay` (l.25)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WarningDisplay.new(customMt: any?) → any` | 32 | ✍ Crée l'affichage avec une liste d'avertissements vide et une icône d'info grise semi-transparente. À noter : l'argument customMt est ignoré, la métatable de la classe est toujours utilisée. |
| `WarningDisplay:storeScaledValues()` | 49 | ✍ Mémorise la position mise à l'échelle (centre horizontal, 0,45 de la hauteur d'écran), la largeur maximale de texte, la taille de texte, les marges, décalages et la taille d'icône pour l'échelle courante. |
| `WarningDisplay:draw()` | 78 | ✍ Dessine chaque avertissement de la liste en pile centrée de boîtes, chacune dimensionnée selon son texte et l'icône, avec l'alpha du texte lié à IngameMap.alpha. Sort tôt s'il n'y a aucun avertissement et restaure l'état de rendu du texte ensuite. |
