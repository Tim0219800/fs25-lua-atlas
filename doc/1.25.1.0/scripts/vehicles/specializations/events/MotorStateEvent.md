# vehicles/specializations/events/MotorStateEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/MotorStateEvent.lua` — FS25 1.25.1.0

- **MotorStateEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `MotorStateEvent.emptyNew() → table` | 18 |  |
| `MotorStateEvent.new(vehicle: table, motorState: integer)` | 27 |  |
| `MotorStateEvent:readStream(streamId: integer, connection: Connection)` | 39 |  |
| `MotorStateEvent:writeStream(streamId: integer, connection: Connection)` | 50 |  |
| `MotorStateEvent:run(connection: Connection)` | 58 |  |
| `MotorStateEvent.sendEvent(vehicle: table, motorState: integer, noEventSend: boolean)` | 74 |  |
