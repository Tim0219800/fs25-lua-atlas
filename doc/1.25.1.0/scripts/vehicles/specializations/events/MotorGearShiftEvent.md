# vehicles/specializations/events/MotorGearShiftEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MotorGearShiftEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorGearShiftEvent.lua` — FS25 1.25.1.0

✍ Network event class `MotorGearShiftEvent` (extends `Event`) that is a request to change gear, group or direction on a motorized vehicle. It carries the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits). It belongs to the vehicle specialization events and defines nothing else.

- **MotorGearShiftEvent** inherits from `Event` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `MotorGearShiftEvent.emptyNew() → table` | 28 | ✍ Creates an empty `MotorGearShiftEvent` instance without data, used when the event is read from a network stream. |
| `MotorGearShiftEvent.new(vehicle: table, shiftType: boolean, shiftValue: any)` | 37 | ✍ Creates the event with its data: the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits). |
| `MotorGearShiftEvent:readStream(streamId: integer, connection: Connection)` | 49 | ✍ Reads the event data from the network stream (the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits)), then calls `run`. |
| `MotorGearShiftEvent:writeStream(streamId: integer, connection: Connection)` | 64 | ✍ Writes the event data to the network stream (the vehicle, a shift type (4 bits) and, for gear or group selection only, a value (5 bits)). |
| `MotorGearShiftEvent:run(connection: Connection)` | 76 | ✍ Executes the event on the receiving side: dispatches on the shift type to `shiftGear`, `selectGear`, `shiftGroup`, `selectGroup` or `changeDirection` of `spec_motorized.motor`. |
| `MotorGearShiftEvent.sendToServer(vehicle: table, shiftType: integer, shiftValue: integer?)` | 109 | ✍ Helper that sends a new gear-shift event to the server connection when `g_client` exists. |
