# vehicles/specializations/events/MotorSetTurnedOnEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/MotorSetTurnedOnEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/MotorSetTurnedOnEvent.lua` — FS25 1.25.1.0

✍ Network event class `MotorSetTurnedOnEvent` (extends `Event`) that replicates the motor being started or stopped. It carries the vehicle and a turned-on boolean. It belongs to the vehicle specialization events and defines nothing else.

- **MotorSetTurnedOnEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `MotorSetTurnedOnEvent.emptyNew() → table` | 18 | ✍ Creates an empty `MotorSetTurnedOnEvent` instance without data, used when the event is read from a network stream. |
| `MotorSetTurnedOnEvent.new(vehicle: table, turnedOn: boolean)` | 27 | ✍ Creates the event with its data: the vehicle and a turned-on boolean. |
| `MotorSetTurnedOnEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the event data from the network stream (the vehicle and a turned-on boolean), then calls `run`. |
| `MotorSetTurnedOnEvent:writeStream(streamId: integer, connection: Connection)` | 48 | ✍ Writes the event data to the network stream (the vehicle and a turned-on boolean). |
| `MotorSetTurnedOnEvent:run(connection: Connection)` | 56 | ✍ Executes the event on the receiving side: calls `startMotor(true)` or `stopMotor(true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `MotorSetTurnedOnEvent.sendEvent(vehicle: table, turnedOn: boolean, noEventSend: boolean)` | 75 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
