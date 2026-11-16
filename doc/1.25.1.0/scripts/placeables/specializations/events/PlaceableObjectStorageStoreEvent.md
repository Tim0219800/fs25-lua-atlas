# placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableObjectStorageStoreEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageStoreEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) asking the server to store the objects pending in the object storage placeable. It only carries the placeable reference.

- **PlaceableObjectStorageStoreEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableObjectStorageStoreEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableObjectStorageStoreEvent.new(placeable: Object) → PlaceableObjectStorageStoreEvent` | 22 | ✍ Creates the event for the given storage placeable. |
| `PlaceableObjectStorageStoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the placeable, then calls `run`. |
| `PlaceableObjectStorageStoreEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Writes the placeable reference. |
| `PlaceableObjectStorageStoreEvent:run(connection: Connection)` | 48 | ✍ If the placeable is synchronized and has `storePendingManualObjects`, calls it to store the waiting objects. |
