# vehicles/specializations/events/LiftableAxleEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/LiftableAxleEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/LiftableAxleEvent.lua` — FS25 1.25.1.0

✍ Network event class `LiftableAxleEvent` (extends `Event`) that replicates the lifted state of a liftable axle. It carries the vehicle, a boolean state and an optional fixed height (float32). It belongs to the vehicle specialization events and defines nothing else.

- **LiftableAxleEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `LiftableAxleEvent.emptyNew() → table` | 14 | ✍ Creates an empty `LiftableAxleEvent` instance without data, used when the event is read from a network stream. |
| `LiftableAxleEvent.new(object: table, state: any, fixedHeight: any)` | 22 | ✍ Creates the event with its data: the vehicle, a boolean state and an optional fixed height (float32). |
| `LiftableAxleEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the event data from the network stream (the vehicle, a boolean state and an optional fixed height (float32)), then calls `run`. |
| `LiftableAxleEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Writes the event data to the network stream (the vehicle, a boolean state and an optional fixed height (float32)). |
| `LiftableAxleEvent:run(connection: Connection)` | 65 | ✍ Executes the event on the receiving side: calls `setLiftableAxleState(state, fixedHeight, nil, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `LiftableAxleEvent.sendEvent(object: table, state: boolean, fixedHeight: boolean, noEventSend: boolean)` | 76 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
