# vehicles/specializations/events/AnimatedVehicleStartEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AnimatedVehicleStartEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AnimatedVehicleStartEvent.lua` — FS25 1.25.1.0

✍ Network event class `AnimatedVehicleStartEvent` (extends `Event`) that replicates the start of a named animation on a vehicle. It carries the vehicle, the animation name, the play speed and the start animation time (floats). It belongs to the vehicle specialization events and defines nothing else.

- **AnimatedVehicleStartEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimatedVehicleStartEvent.emptyNew() → table` | 14 | ✍ Creates an empty `AnimatedVehicleStartEvent` instance without data, used when the event is read from a network stream. |
| `AnimatedVehicleStartEvent.new(object: table, name: string, speed: number, animTime: number)` | 25 | ✍ Creates the event with its data: the vehicle, the animation name, the play speed and the start animation time (floats). |
| `AnimatedVehicleStartEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the event data from the network stream (the vehicle, the animation name, the play speed and the start animation time (floats)), then calls `run`. |
| `AnimatedVehicleStartEvent:writeStream(streamId: integer, connection: Connection)` | 51 | ✍ Writes the event data to the network stream (the vehicle, the animation name, the play speed and the start animation time (floats)). |
| `AnimatedVehicleStartEvent:run(connection: any)` | 60 | ✍ Executes the event on the receiving side: calls `playAnimation(name, speed, animTime, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
