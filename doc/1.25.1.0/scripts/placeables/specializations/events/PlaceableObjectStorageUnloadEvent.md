# placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableObjectStorageUnloadEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageUnloadEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) asking the server to unload a number of stored objects of one kind from an object storage placeable. It carries the placeable, the object info index and the amount.

- **PlaceableObjectStorageUnloadEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableObjectStorageUnloadEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableObjectStorageUnloadEvent.new(placeable: table, objectInfoIndex: integer, objectAmount: boolean)` | 23 | ✍ Creates the event with the storage placeable, the object info index and the amount to unload. |
| `PlaceableObjectStorageUnloadEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the placeable, the object info index (`NUM_BITS_OBJECT_INFO` bits) and the amount (`NUM_BITS_AMOUNT` bits), then calls `run`. |
| `PlaceableObjectStorageUnloadEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes the placeable, the object info index and the amount with the same bit widths as reading. |
| `PlaceableObjectStorageUnloadEvent:run(connection: Connection)` | 55 | ✍ If the placeable is synchronized and has `removeAbstractObjectsFromStorage`, calls it with the index, amount and connection. |
