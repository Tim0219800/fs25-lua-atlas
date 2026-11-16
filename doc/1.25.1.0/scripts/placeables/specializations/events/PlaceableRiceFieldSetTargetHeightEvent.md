# placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldSetTargetHeightEvent.lua` — FS25 1.25.1.0

✍ Network event that changes the water target height of one rice field of a PlaceableRiceField. A client sends it to the server, which applies it and rebroadcasts it to every client.

- **PlaceableRiceFieldSetTargetHeightEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldSetTargetHeightEvent.emptyNew() → table` | 14 | ✍ Creates an empty event using the class metatable; unlike sibling events, no channel is passed (default channel). |
| `PlaceableRiceFieldSetTargetHeightEvent.new(placeableRiceField: any, fieldIndex: any, targetHeight: any)` | 20 | ✍ Builds the event from the rice field placeable, a field index and a target water height. |
| `PlaceableRiceFieldSetTargetHeightEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the rice field object, a UInt8 field index and a Float32 target height, then runs the event. |
| `PlaceableRiceFieldSetTargetHeightEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes the rice field object, the UInt8 field index and the Float32 target height. |
| `PlaceableRiceFieldSetTargetHeightEvent:run(connection: Connection)` | 57 | ✍ If the rice field is synchronized, calls `setWaterHeightTarget` with the field index, the target height and a flag set to true; on the server it then rebroadcasts the event to all clients. |
