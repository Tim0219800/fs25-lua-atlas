# vehicles/specializations/events/AnimatedVehicleStopEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AnimatedVehicleStopEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AnimatedVehicleStopEvent.lua` — FS25 1.25.1.0

✍ Network event class `AnimatedVehicleStopEvent` (extends `Event`) that replicates the stop of a named animation on a vehicle. It carries the vehicle and the animation name. It belongs to the vehicle specialization events and defines nothing else.

- **AnimatedVehicleStopEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimatedVehicleStopEvent.emptyNew() → table` | 14 | ✍ Creates an empty `AnimatedVehicleStopEvent` instance without data, used when the event is read from a network stream. |
| `AnimatedVehicleStopEvent.new(object: table, name: string)` | 23 | ✍ Creates the event with its data: the vehicle and the animation name. |
| `AnimatedVehicleStopEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle and the animation name), then calls `run`. |
| `AnimatedVehicleStopEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle and the animation name). |
| `AnimatedVehicleStopEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `stopAnimation(name, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
