# vehicles/specializations/events/MotorGearShiftEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/MotorGearShiftEvent.lua` — FS25 1.25.1.0

- **MotorGearShiftEvent** inherits from `Event` (l.21)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `MotorGearShiftEvent.emptyNew() → table` | 28 |  |
| `MotorGearShiftEvent.new(vehicle: table, shiftType: boolean, shiftValue: any)` | 37 |  |
| `MotorGearShiftEvent:readStream(streamId: integer, connection: Connection)` | 49 |  |
| `MotorGearShiftEvent:writeStream(streamId: integer, connection: Connection)` | 64 |  |
| `MotorGearShiftEvent:run(connection: Connection)` | 76 |  |
| `MotorGearShiftEvent.sendToServer(vehicle: table, shiftType: integer, shiftValue: integer?)` | 109 |  |
