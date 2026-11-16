# placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableObjectStorageErrorEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableObjectStorageErrorEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) from the server to a client telling that an object storage action failed. The client shows a blinking warning only for the owner farm and when the player is within a warning distance of the storage. Error ids and the distance constants are defined elsewhere in this class.

- **PlaceableObjectStorageErrorEvent** inherits from `Event` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableObjectStorageErrorEvent.emptyNew() → table` | 25 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableObjectStorageErrorEvent.new(placeable: table, errorId: integer)` | 33 | ✍ Creates the event with the storage placeable and an error id. |
| `PlaceableObjectStorageErrorEvent:readStream(streamId: integer, connection: Connection)` | 44 | ✍ Reads the placeable and the error id (`SEND_NUM_BITS` bits), then calls `run`. |
| `PlaceableObjectStorageErrorEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the placeable and the error id (`SEND_NUM_BITS` bits). |
| `PlaceableObjectStorageErrorEvent:run(connection: Connection)` | 62 | ✍ If the placeable is synchronized, belongs to the local farm and is within `SHOW_WARNING_DISTANCE` (XZ) of the client, shows a blinking warning for the matching error: not enough space, storage full, bale or pallet slot limit, unsupported object, or max amount reached. |
