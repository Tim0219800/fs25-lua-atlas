# placeables/specializations/PlaceableWashingStation.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableWashingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWashingStation.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui héberge un ou plusieurs objets WashingStation lus sous `placeable.washingStation.station(?)`. Elle les crée au chargement, les enregistre au placement, les envoie aux clients qui rejoignent et garde leur ferme propriétaire synchronisée avec celle du placeable.

- **PlaceableWashingStation** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableWashingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableWashingStation.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Surcharge `setOwnerFarmId` sur le type de placeable. |
| `PlaceableWashingStation.registerEventListeners(placeableType: any)` | 30 | ✍ S'abonne à onLoad, onDelete, onFinalizePlacement, onReadStream et onWriteStream. |
| `PlaceableWashingStation.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Déclare les clés XML de la station de lavage en déléguant à `WashingStation.registerXMLPaths` pour chaque `station(?)`. |
| `PlaceableWashingStation:onLoad(savegame: table)` | 49 | ✍ Crée un WashingStation pour chaque entrée `station` et le charge ; ceux qui échouent sont supprimés et écartés. |
| `PlaceableWashingStation:onDelete()` | 65 | ✍ Supprime chaque objet station de lavage. |
| `PlaceableWashingStation:onFinalizePlacement()` | 77 | ✍ Donne à chaque station de lavage la ferme propriétaire du placeable et l'enregistre comme objet réseau. |
| `PlaceableWashingStation:onReadStream(streamId: any, connection: any)` | 89 | ✍ Côté client à la connexion : pour chaque station, lit son identifiant d'objet, lit son état et termine son enregistrement réseau. |
| `PlaceableWashingStation:onWriteStream(streamId: any, connection: any)` | 103 | ✍ Côté serveur à la connexion : pour chaque station, écrit son identifiant d'objet et son état, et l'enregistre dans le flux de la connexion. |
| `PlaceableWashingStation:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 117 | ✍ Appelle le parent, puis copie la nouvelle ferme propriétaire sur chaque station de lavage sans envoyer d'événement. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
