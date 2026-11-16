# vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua` — FS25 1.25.1.0

✍ Network event that switches the automatic steering of a vehicle on or off, optionally with the segment index and side to start on. Clients send it to the server, which applies it and rebroadcasts. Use `sendEvent` to emit it.

- **AIAutomaticSteeringStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIAutomaticSteeringStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIAutomaticSteeringStateEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Creates the event with vehicle, on/off state, and optional segment index and side. |
| `AIAutomaticSteeringStateEvent:readStream(streamId: integer, connection: Connection)` | 37 | ✍ Reads the vehicle, the state flag and an optional segment (UInt16 index plus left flag), then calls `run`. |
| `AIAutomaticSteeringStateEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Writes vehicle, state and, if the segment index is set and above 0, the index and left flag. |
| `AIAutomaticSteeringStateEvent:run(connection: Connection)` | 66 | ✍ Applies `setAIAutomaticSteeringEnabled` on a synchronized vehicle (which may return the effective segment), and when received on the server rebroadcasts a new event to clients. |
| `AIAutomaticSteeringStateEvent.sendEvent(vehicle: table, state: integer, segmentIndex: boolean, segmentIsLeft: any, noEventSend: boolean)` | 81 | ✍ Sends the event unless `noEventSend` is true: the server broadcasts it, a client sends it to the server. |
