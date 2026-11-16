# gui/hud/HUDSliderElement.lua

*[English version](../../../../scripts/gui/hud/HUDSliderElement.md)*

Source: `dataS/scripts/gui/hud/HUDSliderElement.lua` — FS25 1.25.1.0

✍ Curseur HUD pour appareils tactiles (interface mobile). Il enregistre trois zones tactiles (appui, maintien, relâchement) sur un overlay d'arrière-plan via g_touchHandler et déplace l'overlay enveloppé le long d'un axe entre des translations minimale et maximale, avec positions centrale et de verrouillage optionnelles. Étend HUDElement. Seul le constructeur figure dans ce fichier ; onSliderDown, setCallback, setAxisPosition ou resetSlider sont utilisés ailleurs mais non définis ici (NON VÉRIFIÉ pour leur origine).

- **HUDSliderElement** hérite de `HUDElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDSliderElement.new(overlay: number, backgroundOverlay: number, touchAreaOffsetX: number, touchAreaOffsetY: number, touchAreaPressedGain: table?, transAxis: any, minTrans: any, centerTrans: any, maxTrans: any, lockTrans: any)` | 23 | ✍ Construit le curseur autour d'un overlay et d'un overlay d'arrière-plan, mémorise l'axe, les translations min/centre/max/verrou et une vitesse par défaut de 0.0002, puis enregistre trois zones tactiles sur l'arrière-plan et règle leur gain de taille à l'appui. À noter : son commentaire décrit des paramètres de FrameElement, pas ceux-ci. |
