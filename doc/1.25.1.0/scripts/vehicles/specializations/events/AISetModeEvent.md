# vehicles/specializations/events/AISetModeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AISetModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AISetModeEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronises the selected AI mode of a vehicle (1-based index, sent as index minus 1 on `AIModeSelection.NUM_BITS` bits). Clients send it to the server, which applies it and relays it to the others. Use `sendEvent` to emit it.

- **AISetModeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AISetModeEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AISetModeEvent.new(vehicle: table, aiMode: integer)` | 23 | ✍ Creates the event for a vehicle with the AI mode index to select. |
| `AISetModeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the vehicle and the mode as an unsigned integer of `AIModeSelection.NUM_BITS` bits, adding 1, then calls `run`. |
| `AISetModeEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the vehicle and the mode minus 1 in `AIModeSelection.NUM_BITS` bits (modes are 1-based). |
| `AISetModeEvent:run(connection: Connection)` | 52 | ✍ Calls `setAIModeSelection(mode, true)` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender. |
| `AISetModeEvent.sendEvent(vehicle: table, aiMode: integer, noEventSend: boolean)` | 67 | ✍ Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server. |
