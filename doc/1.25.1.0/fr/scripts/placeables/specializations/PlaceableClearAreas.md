# placeables/specializations/PlaceableClearAreas.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableClearAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableClearAreas.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui définit des zones rectangulaires (nœuds de départ, de largeur et de hauteur) nettoyées lors de la première construction du placeable. Côté serveur, pour un placeable non chargé depuis une sauvegarde, elle supprime champs, mauvaises herbes, pierres, traces de pneus, décorations et contenu de tas sur ces zones.

- **PlaceableClearAreas** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableClearAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableClearAreas.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `loadClearArea`. |
| `PlaceableClearAreas.registerEventListeners(placeableType: any)` | 30 | ✍ S'abonne à `onLoad` et `onPostFinalizePlacement`. |
| `PlaceableClearAreas.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Déclare `clearAreas.clearArea(?)` avec `startNode`, `widthNode` et `heightNode`. |
| `PlaceableClearAreas:onLoad(savegame: table)` | 48 | ✍ Charge chaque entrée `clearArea` valide et émet un avertissement si la section `clearAreas` est absente. |
| `PlaceableClearAreas:loadClearArea(xmlFile: any, key: any, area: any)` | 66 | ✍ Lit les nœuds de départ, de largeur et de hauteur dans la table de zone ; journalise un avertissement et renvoie false si l'un manque, sinon true. |
| `PlaceableClearAreas:onPostFinalizePlacement()` | 94 | ✍ Serveur uniquement et seulement pour un nouveau placement : pour chaque zone, supprime champ, mauvaises herbes, pierres, traces de pneus et décorations via `FSDensityMapUtil`, et vide le contenu de la heightmap via `DensityMapHeightUtil.clearArea`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadClearArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onPostFinalizePlacement` | 32 |
