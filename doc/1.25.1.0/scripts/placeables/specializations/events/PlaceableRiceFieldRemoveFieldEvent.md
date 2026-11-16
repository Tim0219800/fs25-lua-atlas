# placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldRemoveFieldEvent.lua` — FS25 1.25.1.0

✍ Network event that deletes one field of a PlaceableRiceField by index. A client sends it to the server, which applies it and broadcasts it back to all clients.

- **PlaceableRiceFieldRemoveFieldEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldRemoveFieldEvent.emptyNew() → table` | 14 | ✍ Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldRemoveFieldEvent.new(placeableRiceField: any, fieldIndex: any)` | 20 | ✍ Builds the event from the rice field placeable and the index of the field to remove. |
| `PlaceableRiceFieldRemoveFieldEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the rice field object and a UInt8 field index, then runs the event. |
| `PlaceableRiceFieldRemoveFieldEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes the rice field object and the UInt8 field index. |
| `PlaceableRiceFieldRemoveFieldEvent:run(connection: Connection)` | 54 | ✍ If the rice field is synchronized, removes the field via `removeFieldByIndex`; when received by the server (the connection is not the server's), it then rebroadcasts the same event to all clients. |
