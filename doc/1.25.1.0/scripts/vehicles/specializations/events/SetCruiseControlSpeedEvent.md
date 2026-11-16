# vehicles/specializations/events/SetCruiseControlSpeedEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/SetCruiseControlSpeedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/SetCruiseControlSpeedEvent.lua` — FS25 1.25.1.0

✍ Network event class `SetCruiseControlSpeedEvent` (extends `Event`) that replicates the cruise control target speeds (forward and reverse). It carries the vehicle and two uint8 speeds (forward, reverse). It belongs to the vehicle specialization events and defines nothing else.

- **SetCruiseControlSpeedEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SetCruiseControlSpeedEvent.emptyNew() → table` | 14 | ✍ Creates an empty `SetCruiseControlSpeedEvent` instance without data, used when the event is read from a network stream. |
| `SetCruiseControlSpeedEvent.new(vehicle: table, speed: number, speedReverse: number)` | 24 | ✍ Creates the event with its data: the vehicle and two uint8 speeds (forward, reverse). |
| `SetCruiseControlSpeedEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the event data from the network stream (the vehicle and two uint8 speeds (forward, reverse)), then calls `run`. |
| `SetCruiseControlSpeedEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes the event data to the network stream (the vehicle and two uint8 speeds (forward, reverse)). |
| `SetCruiseControlSpeedEvent:run(connection: Connection)` | 56 | ✍ Executes the event on the receiving side: calls `setCruiseControlMaxSpeed(speed, speedReverse)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
