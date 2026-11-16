# vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/WoodHarvesterCutLengthEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/WoodHarvesterCutLengthEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the selected cut length index of a wood harvester between server and clients. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **WoodHarvesterCutLengthEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodHarvesterCutLengthEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `WoodHarvesterCutLengthEvent.new(object: table, index: number)` | 23 | ✍ Builds the event with the data to send (a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits)); stored on the instance for `writeStream`. |
| `WoodHarvesterCutLengthEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits) from the stream, then calls `run(connection)`. |
| `WoodHarvesterCutLengthEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a cut length index (WoodHarvester.NUM_BITS_CUT_LENGTH bits) to the stream (same order as `readStream`). |
| `WoodHarvesterCutLengthEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `setWoodHarvesterCutLengthIndex(index, true)` on the object if synchronized. |
| `WoodHarvesterCutLengthEvent.sendEvent(object: table, index: number, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
