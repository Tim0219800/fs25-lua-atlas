# placeables/specializations/PlaceableHotspots.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableHotspots.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableHotspots.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui attache un ou plusieurs points d'intérêt de carte (PlaceableHotspot) à un bâtiment, avec type, nom, position monde et position de téléportation optionnelle. Les points sont ajoutés à la mission après la finalisation et rafraîchis par updateHotspots lors d'un changement de propriétaire. Aucun prérequis.

- **PlaceableHotspots** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableHotspots.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableHotspots.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre getHotspot, updateHotspots et setHotspotVisible. Les deux derniers n'ont pas de corps dans le dump du SDK (NON VÉRIFIÉ). |
| `PlaceableHotspots.registerEventListeners(placeableType: any)` | 32 | ✍ Abonne la spécialisation aux événements de chargement, suppression, post-finalisation du placement et changement de propriétaire. |
| `PlaceableHotspots.registerXMLPaths(schema: any, basePath: any)` | 41 | ✍ Déclare les entrées hotspot : linkNode, teleportNode, type (UNLOADING par défaut), worldPosition, teleportWorldPosition et text. |
| `PlaceableHotspots:onLoad(savegame: table)` | 55 | ✍ Crée un PlaceableHotspot par entrée XML. Un type inconnu retombe sur UNLOADING avec un avertissement. La position vient du noeud de liaison (ou de la racine) sauf si worldPosition est donné ; une position de téléportation explicite est relevée au moins à la hauteur du terrain. Le texte est traduit avec l'i18n du mod. |
| `PlaceableHotspots:onDelete()` | 108 | ✍ Se désabonne du centre de messages, retire chaque point de la carte de la mission et le supprime. |
| `PlaceableHotspots:onPostFinalizePlacement()` | 122 | ✍ Ajoute chaque point à la carte de la mission et appelle updateHotspots. |
| `PlaceableHotspots:onOwnerChanged()` | 135 | ✍ Appelle updateHotspots après un changement de propriétaire. |
| `PlaceableHotspots:getHotspot(index: any)` | 159 | ✍ Renvoie le point à l'index donné (base 1), ou le premier si aucun index n'est fourni. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getHotspot` | 25 |
| registerFunction | `updateHotspots` | 26 |
| registerFunction | `setHotspotVisible` | 27 |
| registerEventListener | `onLoad` | 33 |
| registerEventListener | `onDelete` | 34 |
| registerEventListener | `onPostFinalizePlacement` | 35 |
| registerEventListener | `onOwnerChanged` | 36 |
