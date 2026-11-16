# placeables/specializations/PlaceableTriggerMarkers.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableTriggerMarkers.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTriggerMarkers.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui attache des marqueurs visuels de déclencheur (fichiers i3d chargés, éventuellement collés au terrain) à des nœuds d'un bâtiment et ne les montre qu'aux joueurs qui y ont accès. Elle écoute les messages de changement de ferme et de création de joueur pour actualiser la visibilité. Les marqueurs sont déclarés sous `placeable.triggerMarkers.triggerMarker(?)`.

- **PlaceableTriggerMarkers** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableTriggerMarkers.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableTriggerMarkers.registerEventListeners(placeableType: any)` | 24 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement et onOwnerChanged. |
| `PlaceableTriggerMarkers.registerFunctions(placeableType: any)` | 33 | ✍ Enregistre `onPlayerFarmChanged`, `onMarkerFileLoaded`, `getTriggerMarkerPosition` et `setShowMarkers`. À noter : seule `onMarkerFileLoaded` est définie dans ce fichier ; les trois autres sont référencées sans définition ici (NON VÉRIFIÉ, peut-être ailleurs). |
| `PlaceableTriggerMarkers.registerXMLPaths(schema: any, basePath: any)` | 42 | ✍ Déclare les clés XML des marqueurs : `#node`, `#filename`, `#adjustToGround`, `#groundOffset` (0,03 par défaut), `#showAllPlayers` et `#showOnlyIfOwned` (false par défaut). |
| `PlaceableTriggerMarkers:onLoad(savegame: table)` | 56 | ✍ Parcourt les marqueurs, ignore ceux sans nœud, et mémorise leurs réglages (décalage au sol de 3 cm par défaut). Si un nom de fichier est donné, lance un chargement i3d partagé asynchrone lié à une tâche de chargement. |
| `PlaceableTriggerMarkers:onMarkerFileLoaded(i3dNode: any, failedReason: any, args: any)` | 132 | ✍ Callback de chargement asynchrone : lie l'i3d chargé sous le nœud du marqueur (si le chargement a réussi), en fait le nœud du marqueur, puis termine la tâche de chargement. |
| `PlaceableTriggerMarkers:onDelete()` | 148 | ✍ Libère les requêtes de chargement i3d partagées, retire chaque marqueur de la mission via `removeTriggerMarker`, et se désabonne des messages de changement de ferme et de création de joueur. |
| `PlaceableTriggerMarkers:onFinalizePlacement()` | 169 | ✍ Colle au terrain les marqueurs `adjustToGround` (hauteur du terrain plus décalage), affiche ou masque les marqueurs selon l'accès du joueur, et s'abonne aux messages de changement de ferme et de création de joueur. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
| registerEventListener | `onOwnerChanged` | 28 |
| registerFunction | `onPlayerFarmChanged` | 34 |
| registerFunction | `onMarkerFileLoaded` | 35 |
| registerFunction | `getTriggerMarkerPosition` | 36 |
| registerFunction | `setShowMarkers` | 37 |

## Messages

- s'abonne à `MessageType.PLAYER_FARM_CHANGED` (l.185)
- s'abonne à `MessageType.PLAYER_CREATED` (l.186)
