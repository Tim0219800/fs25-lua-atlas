# placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldFieldEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldFieldEvent.lua` — FS25 1.25.1.0

✍ Network event that submits a newly drawn rice field (polygon, height, water height) to the receiving side of a PlaceableRiceField. The receiver builds the field and finalizes it, then answers with PlaceableRiceFieldFieldAnswerEvent. It is meant to go from a client to the server, but this file does not check which side runs it.

- **PlaceableRiceFieldFieldEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldFieldEvent.emptyNew() → table` | 14 | ✍ Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldFieldEvent.new(placeableRiceField: any, field: any)` | 20 | ✍ Builds the event from the rice field placeable and a field table holding height, polygon and water height. |
| `PlaceableRiceFieldFieldEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the rice field, the height, the vertex count and the 2D vertices, then the water height, creating the field via `createNewField` and a `Polygon2D`, and runs the event. Note: the rice field is not nil-checked before `createNewField`. |
| `PlaceableRiceFieldFieldEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Writes the rice field, the field height, the vertex count and each polygon vertex coordinate as Float32, then the water height. |
| `PlaceableRiceFieldFieldEvent:run(connection: Connection)` | 74 | ✍ If the rice field is synchronized, calls `finalizeNewField` with the new field and a flag set to true, and its callback replies to the sender with a PlaceableRiceFieldFieldAnswerEvent holding the status code. |
