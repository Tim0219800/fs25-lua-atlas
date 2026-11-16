# vehicles/specializations/events/TreePlanterLoadPalletEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/TreePlanterLoadPalletEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/TreePlanterLoadPalletEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes loading a sapling pallet onto a tree planter, identifying the pallet by its network object id. Part of the vehicle specialization event set; the receiving side only acts if the target object is synchronized.

- **TreePlanterLoadPalletEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TreePlanterLoadPalletEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the event metatable, used when the network layer receives this event. |
| `TreePlanterLoadPalletEvent.new(object: table, palletObjectId: integer)` | 23 | ✍ Builds the event with the data to send (a node object and a pallet network object id); stored on the instance for `writeStream`. |
| `TreePlanterLoadPalletEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads a node object and a pallet network object id from the stream, then calls `run(connection)`. |
| `TreePlanterLoadPalletEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes a node object and a pallet network object id to the stream (same order as `readStream`). |
| `TreePlanterLoadPalletEvent:run(connection: Connection)` | 52 | ✍ Applies the event on the receiving side: on the server re-broadcasts itself, then calls `loadPallet(palletObjectId, true)` on the object if synchronized. |
| `TreePlanterLoadPalletEvent.sendEvent(object: table, palletObjectId: integer, noEventSend: boolean)` | 67 | ✍ Helper to send the event: broadcasts it from the server, or sends it to the server when called on a client. Does nothing when noEventSend is true. |
