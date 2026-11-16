# vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIConveyorBeltSetAngleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIConveyorBeltSetAngleEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronises the AI conveyor belt angle of a vehicle (signed 8-bit). A client sends it to the server, which applies it and relays it to the other clients.

- **AIConveyorBeltSetAngleEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIConveyorBeltSetAngleEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIConveyorBeltSetAngleEvent.new(vehicle: table, currentAngle: integer)` | 23 | ✍ Creates the event for a vehicle with the conveyor belt angle value to set. |
| `AIConveyorBeltSetAngleEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the vehicle and the angle as a signed 8-bit integer, then calls `run`. |
| `AIConveyorBeltSetAngleEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the vehicle and the angle as a signed 8-bit integer (so the value must fit -128..127). |
| `AIConveyorBeltSetAngleEvent:run(connection: Connection)` | 52 | ✍ Calls `setAIConveyorBeltAngle(angle, true)` on a synchronized vehicle; on the server it rebroadcasts to the other clients, excluding the sender connection. No `sendEvent` helper exists. |
