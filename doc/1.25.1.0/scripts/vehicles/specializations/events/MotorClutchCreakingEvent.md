# vehicles/specializations/events/MotorClutchCreakingEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MotorClutchCreakingEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorClutchCreakingEvent.lua` — FS25 1.25.1.0

✍ Network event class `MotorClutchCreakingEvent` (extends `Event`) that tells clients that the clutch is creaking. It carries the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes. It belongs to the vehicle specialization events and defines nothing else.

- **MotorClutchCreakingEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `MotorClutchCreakingEvent.emptyNew() → table` | 18 | ✍ Creates an empty `MotorClutchCreakingEvent` instance without data, used when the event is read from a network stream. |
| `MotorClutchCreakingEvent.new(vehicle: table, isEvent: boolean, groupTransmission: any, gearIndex: any, groupIndex: any)` | 27 | ✍ Creates the event with its data: the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes. |
| `MotorClutchCreakingEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Reads the event data from the network stream (the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes), then calls `run`. |
| `MotorClutchCreakingEvent:writeStream(streamId: integer, connection: Connection)` | 61 | ✍ Writes the event data to the network stream (the vehicle, an isEvent flag, a group-transmission flag and optional gear (6 bits) and group (5 bits) indexes). |
| `MotorClutchCreakingEvent:run(connection: Connection)` | 78 | ✍ Executes the event on the receiving side: raises the vehicle event `onClutchCreaking` with these values (no rebroadcast in `run`). |
