# vehicles/specializations/events/MowerToggleWindrowDropEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MowerToggleWindrowDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MowerToggleWindrowDropEvent.lua` — FS25 1.25.1.0

✍ Network event class `MowerToggleWindrowDropEvent` (extends `Event`) that replicates the use of the mower windrow drop areas. It carries the vehicle and a boolean. It belongs to the vehicle specialization events and defines nothing else.

- **MowerToggleWindrowDropEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `MowerToggleWindrowDropEvent.emptyNew() → table` | 14 | ✍ Creates an empty `MowerToggleWindrowDropEvent` instance without data, used when the event is read from a network stream. |
| `MowerToggleWindrowDropEvent.new(object: table, useMowerWindrowDropAreas: boolean)` | 23 | ✍ Creates the event with its data: the vehicle and a boolean. |
| `MowerToggleWindrowDropEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and a boolean), then calls `run`. |
| `MowerToggleWindrowDropEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and a boolean). |
| `MowerToggleWindrowDropEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `setUseMowerWindrowDropAreas(value, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `MowerToggleWindrowDropEvent.sendEvent(vehicle: table, useMowerWindrowDropAreas: boolean, noEventSend: boolean)` | 67 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
