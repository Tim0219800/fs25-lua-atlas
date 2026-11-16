# placeables/specializations/PlaceableWardrobe.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableWardrobe.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWardrobe.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour une garde-robe où les joueurs changent leur personnage. Un déclencheur joueur ajoute un WardrobeActivatable pour le joueur local si la garde-robe est libre d'accès ou appartient à sa ferme. Le drapeau d'accès libre est sauvegardé et envoyé aux clients qui rejoignent.

- **PlaceableWardrobe** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWardrobe.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableWardrobe.registerFunctions(placeableType: any)` | 25 | ✍ Enregistre `wardrobeTriggerCallback` sur le type de placeable. |
| `PlaceableWardrobe.registerEventListeners(placeableType: any)` | 31 | ✍ S'abonne à onLoad, onDelete, onReadStream et onWriteStream (le chargement et la sauvegarde passent par les hooks standard des placeables, NON VÉRIFIÉ). |
| `PlaceableWardrobe.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Déclare les clés XML de la garde-robe (nœud de déclencheur et `#isFreeForAll`). |
| `PlaceableWardrobe.registerSavegameXMLPaths(schema: any, basePath: any)` | 49 | ✍ Déclare l'attribut de sauvegarde `#isFreeForAll`. |
| `PlaceableWardrobe:onLoad(savegame: table)` | 58 | ✍ Crée l'activable, lit `placeable.wardrobe#triggerNode` (avertissement s'il n'a pas le bit de collision joueur) et enregistre le déclencheur, puis lit `#isFreeForAll` (false par défaut). |
| `PlaceableWardrobe:loadFromXMLFile(xmlFile: any, key: any)` | 77 | ✍ Restaure `#isFreeForAll` depuis la sauvegarde s'il est présent. |
| `PlaceableWardrobe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 87 | ✍ Écrit `#isFreeForAll` dans la sauvegarde. |
| `PlaceableWardrobe:onDelete()` | 93 | ✍ Retire l'activable du système d'activables et supprime le déclencheur. |
| `PlaceableWardrobe:onReadStream(streamId: integer, connection: Connection)` | 108 | ✍ Côté client à la connexion : lit le booléen d'accès libre. |
| `PlaceableWardrobe:onWriteStream(streamId: integer, connection: Connection)` | 117 | ✍ Côté serveur à la connexion : écrit le booléen d'accès libre. |
| `PlaceableWardrobe:wardrobeTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 124 | ✍ Callback du déclencheur : quand le joueur local entre ou sort, et que la garde-robe est libre ou appartient à sa ferme, ajoute ou retire l'activable. Les autres acteurs sont ignorés. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `wardrobeTriggerCallback` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
