# vehicles/specializations/events/PickupSetStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PickupSetStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PickupSetStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `PickupSetStateEvent` (extends `Event`) that replicates the lowered or raised state of a pickup. It carries the vehicle and an isPickupLowered boolean. It belongs to the vehicle specialization events and defines nothing else.

- **PickupSetStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PickupSetStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty `PickupSetStateEvent` instance without data, used when the event is read from a network stream. |
| `PickupSetStateEvent.new(object: table, isPickupLowered: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and an isPickupLowered boolean. |
| `PickupSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and an isPickupLowered boolean), then calls `run`. |
| `PickupSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and an isPickupLowered boolean). |
| `PickupSetStateEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setPickupState(isPickupLowered, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PickupSetStateEvent.sendEvent(vehicle: table, isPickupLowered: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
