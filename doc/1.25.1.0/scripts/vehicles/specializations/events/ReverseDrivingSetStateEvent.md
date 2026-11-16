# vehicles/specializations/events/ReverseDrivingSetStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/ReverseDrivingSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ReverseDrivingSetStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `ReverseDrivingSetStateEvent` (extends `Event`) that replicates the reverse-driving state of a vehicle. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **ReverseDrivingSetStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ReverseDrivingSetStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `ReverseDrivingSetStateEvent` instance without data, used when the event is read from a network stream. |
| `ReverseDrivingSetStateEvent.new(vehicle: table, isReverseDriving: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `ReverseDrivingSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `ReverseDrivingSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `ReverseDrivingSetStateEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setIsReverseDriving(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `ReverseDrivingSetStateEvent.sendEvent(vehicle: table, isReverseDriving: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
