# gui/hud/FillLevelsDisplay.lua

*[English version](../../../../scripts/gui/hud/FillLevelsDisplay.md)*

Source: `dataS/scripts/gui/hud/FillLevelsDisplay.lua` — FS25 1.25.1.0

✍ Affichage HUD des niveaux de remplissage du véhicule, dérivé de HUDDisplay. Ce fichier ne définit que le constructeur : tranches de fond (gui.filltypes_left/middle/right), icône de poids maximal, barre de progression en trois parties et tables vides pour le véhicule, les icônes et les niveaux. La mise en page et le dessin ne sont pas dans ce fichier (NON VÉRIFIÉ).

- **FillLevelsDisplay** hérite de `HUDDisplay` (l.29)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillLevelsDisplay.new()` | 33 | ✍ Constructeur. Crée les overlays de fond teintés, l'overlay de l'icône de poids max et la barre de progression ThreePartOverlay ; aucun véhicule n'est associé et les tables d'icônes/données sont vides. |
