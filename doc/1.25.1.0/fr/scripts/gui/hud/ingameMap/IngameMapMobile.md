# gui/hud/ingameMap/IngameMapMobile.lua

*[English version](../../../../../scripts/gui/hud/ingameMap/IngameMapMobile.md)*

Source: `dataS/scripts/gui/hud/ingameMap/IngameMapMobile.lua` — FS25 1.25.1.0

✍ Sous-classe mobile de IngameMap (affichage de la carte du HUD/menu). Elle ne surcharge que la mise à l'échelle pour replacer l'élément à sa position de base après un changement d'échelle.

- **IngameMapMobile** hérite de `IngameMap` (l.16)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `IngameMapMobile:setScale(uiScale: any)` | 311 | ✍ Applique uiScale via l'implémentation parente de IngameMap, puis déplace l'élément à la position de fond calculée pour cette échelle. |
