# placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua

*[English version](../../../../../scripts/placeables/specializations/events/PlaceableObjectStorageStoreEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua` — FS25 1.25.1.0

✍ Événement réseau (sous-classe d'Event) qui demande au serveur de stocker les objets en attente dans le placeable de stockage d'objets. Il ne transporte que la référence du placeable.

- **PlaceableObjectStorageStoreEvent** hérite de `Event` (l.7)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableObjectStorageStoreEvent.emptyNew() → table` | 14 | ✍ Crée une instance d'événement vide pour la lecture de flux. |
| `PlaceableObjectStorageStoreEvent.new(placeable: Object) → PlaceableObjectStorageStoreEvent` | 22 | ✍ Crée l'événement pour le placeable de stockage donné. |
| `PlaceableObjectStorageStoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Lit le placeable, puis appelle `run`. |
| `PlaceableObjectStorageStoreEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Écrit la référence du placeable. |
| `PlaceableObjectStorageStoreEvent:run(connection: Connection)` | 48 | ✍ Si le placeable est synchronisé et possède `storePendingManualObjects`, l'appelle pour stocker les objets en attente. |
