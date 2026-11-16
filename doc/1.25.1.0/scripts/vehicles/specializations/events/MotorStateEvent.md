# vehicles/specializations/events/MotorStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MotorStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `MotorStateEvent` (extends `Event`) that replicates the motor state of a vehicle. It carries the vehicle and a motor state serialized through `MotorState`. It belongs to the vehicle specialization events and defines nothing else.

- **MotorStateEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `MotorStateEvent.emptyNew() → table` | 18 | ✍ Creates an empty `MotorStateEvent` instance without data, used when the event is read from a network stream. |
| `MotorStateEvent.new(vehicle: table, motorState: integer)` | 27 | ✍ Creates the event with its data: the vehicle and a motor state serialized through `MotorState`. |
| `MotorStateEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Reads the event data from the network stream (the vehicle and a motor state serialized through `MotorState`), then calls `run`. |
| `MotorStateEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (the vehicle and a motor state serialized through `MotorState`). |
| `MotorStateEvent:run(connection: Connection)` | 58 | ✍ Executes the event on the receiving side: calls `setMotorState(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `MotorStateEvent.sendEvent(vehicle: table, motorState: integer, noEventSend: boolean)` | 74 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
