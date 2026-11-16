# internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua

*[English version](../../../../../../scripts/internalMods/FS25_precisionFarming/scripts/maps/ValueMap.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua` — FS25 1.25.1.0

✍ Classe de base des cartes de valeurs de Precision Farming (sol, azote, pH, rendement, couverture, passages de roues, etc.). Seul un utilitaire statique de coordonnées subsiste dans ce dump ; le corps de la classe n'est pas inclus.

- **ValueMap** (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ValueMap.roundToPixelCenter(x: any, z: any, terrainSize: any, mapSize: any)` | 280 | ✍ Aligne une position monde x/z sur le centre du pixel de carte qui la contient, d'après la taille du terrain et la résolution de la carte. Renvoie les coordonnées monde x et z ajustées. |
