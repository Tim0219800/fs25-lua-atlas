# vehicles/specializations/events/SetCrabSteeringEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetCrabSteeringEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCrabSteeringEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetCrabSteeringEvent` (extends `Event`) that replicates the crab steering mode. It carries the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **SetCrabSteeringEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetCrabSteeringEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetCrabSteeringEvent` instance without data, used when the event is read from a network stream. |
| `SetCrabSteeringEvent.new(vehicle: table, state: integer)` | 23 | ✍ Creates the event with its data: the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits). |
| `SetCrabSteeringEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits)), then calls `run`. |
| `SetCrabSteeringEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a state (`CrabSteering.STEERING_SEND_NUM_BITS` bits)). |
| `SetCrabSteeringEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setCrabSteering(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `SetCrabSteeringEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
