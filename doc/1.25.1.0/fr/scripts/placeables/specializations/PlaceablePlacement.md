# placeables/specializations/PlaceablePlacement.lua

*[English version](../../../../scripts/placeables/specializations/PlaceablePlacement.md)*

Source: `dataS/scripts/placeables/specializations/PlaceablePlacement.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable sans prérequis qui porte les données utilisées quand le joueur positionne un bâtiment : zones de test de chevauchement, magnétisme de position et de rotation, alignement optionnel au terrain et sons de pose et de destruction. Elle enregistre plusieurs fonctions (masque de chevauchement, nœud valide, test d'eau, densité-hauteur, zone bloquée) dont le corps est absent du dump : NON VÉRIFIÉ. Les clés XML sont lues sous placeable.placement.

- **PlaceablePlacement** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceablePlacement.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Retourne toujours true : la spécialisation peut être ajoutée à n'importe quel type de placeable. |
| `PlaceablePlacement.registerFunctions(placeableType: any)` | 29 | ✍ Enregistre les fonctions de placement sur le type de placeable, dont plusieurs (getPlacementOverlapMask, isValidOverlapNode, getCanBePlacedInWater, getIsAreaBlocked, getHasOverlapWithDensityHeight, getIsOnOwnedFarmland) non définies dans ce fichier du dump. |
| `PlaceablePlacement.registerEventListeners(placeableType: any)` | 54 | ✍ Abonne la spécialisation aux événements onLoad, onDelete et onPreFinalizePlacement. |
| `PlaceablePlacement.registerXMLPaths(schema: any, basePath: any)` | 62 | ✍ Déclare le schéma XML de placeable.placement : les trois nœuds d'alignement au terrain, les zones de test (nœuds début/fin), les options de rotation aléatoire/manuelle, alignToWorldY, les pas de magnétisme de position et de rotation, et les sons place, placeLayered et destroy. |
| `PlaceablePlacement:onLoad(savegame: table)` | 88 | ✍ Charge depuis le XML les zones de test, les options de rotation, les pas de magnétisme (valeurs absolues) et alignToWorldY ; retombe sur l'alignement Y monde avec un avertissement si les trois nœuds manquent. Côté client, si Platform.hasContruction est vrai, charge aussi les sons 2D de pose. |
| `PlaceablePlacement:onDelete()` | 136 | ✍ Côté client, supprime les échantillons sonores de placement chargés. |
| `PlaceablePlacement:loadTestArea(xmlFile: any, key: any, area: any)` | 145 | ✍ Lit une zone de test depuis le XML. Le nœud de fin doit être enfant direct du nœud de début ; calcule la taille de la boîte, son centre relatif au nœud racine et sa rotation Y, avec une marge de sécurité de 5 cm vers le bas. Retourne false (avec avertissement) si invalide. |
| `PlaceablePlacement:getPlacementRotation(x: any, y: any, z: any)` | 195 | ✍ Prend la rotation proposée et aligne la composante Y sur l'angle de magnétisme configuré s'il existe ; retourne x, y, z. |
| `PlaceablePlacement:getPlacementPosition(x: any, y: any, z: any)` | 207 | ✍ Aligne x et z sur la grille configurée (arrondi par défaut, puis ajout du décalage) si un pas est défini ; y n'est pas modifié. Retourne x, y, z. |
| `PlaceablePlacement:getPositionSnapSize()` | 222 | ✍ Retourne le pas de la grille de magnétisme de position issu du XML. |
| `PlaceablePlacement:getPositionSnapOffset()` | 228 | ✍ Retourne le décalage de magnétisme de position issu du XML. |
| `PlaceablePlacement:getRotationSnapAngle()` | 234 | ✍ Retourne l'angle de magnétisme de rotation en radians issu du XML. |
| `PlaceablePlacement:onPreFinalizePlacement()` | 240 | ✍ Serveur uniquement, quand alignToWorldY est faux : pose la racine à la hauteur du terrain et l'oriente pour que les trois nœuds suivent la pente. Les clients reçoivent la transformation par synchronisation. |
| `PlaceablePlacement:getIsAreaOwnedByFarm(sx: any, sz: any, wx: any, wz: any, hx: any, hz: any, farmId: any)` | 267 | ✍ Retourne true uniquement si la ferme possède le terrain le long des quatre bords du parallélogramme défini par les points (via g_farmlandManager). |
| `PlaceablePlacement:startPlacementCheck(x: any, y: any, z: any, rotY: any)` | 284 | ✍ Point d'accroche vide appelé avec la position et la rotation Y proposées ; les spécialisations ou mods peuvent le surcharger. |
| `PlaceablePlacement:getHasOverlap(x: any, y: any, z: any, rotY: any, checkFunc: any)` | 343 | ✍ Teste chaque zone : zone bloquée, puis overlapBox (boîte abaissée à 0,5 m sous le coin de terrain le plus bas) selon le masque de placement, puis contrôle densité-hauteur. Retourne true et le nœud touché, ou false, nil. |
| `PlaceablePlacement:getHasOverlapWithPlaces(places: any, x: any, y: any, z: any, rotY: any)` | 422 | ✍ Retourne true si un coin d'une zone de test, à la position et rotation données, se trouve dans l'une des places de placement fournies. |
| `PlaceablePlacement:getHasOverlapWithZones(zones: any, x: any, y: any, z: any, rotY: any)` | 450 | ✍ Retourne true si un coin de zone de test est dans une zone interdite (avec test d'eau sauf si le placeable peut être dans l'eau) ou hors de la limite du système de placeables. |
| `PlaceablePlacement:getTestParallelogramAtWorldPosition(testArea: any, x: any, z: any, rotY: any)` | 498 | ✍ Calcule les quatre coins XZ monde d'une zone de test pour une position et une rotation Y de placement. Retourne les coins de départ, de largeur, de hauteur et opposé en paires x, z. |
| `PlaceablePlacement:playPlaceSound()` | 531 | ✍ Client uniquement : joue les échantillons place et placeLayered. |
| `PlaceablePlacement:playDestroySound(onlyIfNotPlaying: any)` | 541 | ✍ Client uniquement : joue l'échantillon destroy, en l'ignorant éventuellement s'il est déjà en cours de lecture. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadTestArea` | 30 |
| registerFunction | `getIsAreaOwnedByFarm` | 31 |
| registerFunction | `getIsOnOwnedFarmland` | 32 |
| registerFunction | `startPlacementCheck` | 33 |
| registerFunction | `getPlacementRotation` | 34 |
| registerFunction | `getPlacementPosition` | 35 |
| registerFunction | `getPositionSnapSize` | 36 |
| registerFunction | `getPositionSnapOffset` | 37 |
| registerFunction | `getRotationSnapAngle` | 38 |
| registerFunction | `getPlacementOverlapMask` | 39 |
| registerFunction | `isValidOverlapNode` | 40 |
| registerFunction | `getHasOverlap` | 41 |
| registerFunction | `getHasOverlapWithPlaces` | 42 |
| registerFunction | `getCanBePlacedInWater` | 43 |
| registerFunction | `getHasOverlapWithZones` | 44 |
| registerFunction | `getTestParallelogramAtWorldPosition` | 45 |
| registerFunction | `playPlaceSound` | 46 |
| registerFunction | `playDestroySound` | 47 |
| registerFunction | `getIsAreaBlocked` | 48 |
| registerFunction | `getHasOverlapWithDensityHeight` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `onPreFinalizePlacement` | 57 |
