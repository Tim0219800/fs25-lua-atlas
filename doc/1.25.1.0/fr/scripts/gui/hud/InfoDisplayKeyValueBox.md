# gui/hud/InfoDisplayKeyValueBox.lua

*[English version](../../../../scripts/gui/hud/InfoDisplayKeyValueBox.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayKeyValueBox.lua` — FS25 1.25.1.0

✍ Boîte d'information (étend InfoDisplayBox) destinée à afficher un titre et des lignes clé/valeur sur un fond en trois parties. Seul le constructeur figure dans ce fichier : il crée les overlays de fond fieldInfo haut/milieu/bas, colorés d'après HUD.COLOR.BACKGROUND, et une icône d'avertissement colorée d'après HUD.COLOR.ACTIVE. Les méthodes de lignes et de titre ne sont pas définies ici (NON VÉRIFIÉ pour leur emplacement).

- **InfoDisplayKeyValueBox** hérite de `InfoDisplayBox` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InfoDisplayKeyValueBox.new(infoDisplay: any, uiScale: any, customMt: any)` | 19 | ✍ Crée la boîte avec une liste de lignes vide, le titre provisoire 'Unknown Title', trois overlays de fond et une icône d'avertissement créés via g_overlayManager. |
