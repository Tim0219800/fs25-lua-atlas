# vehicles/specializations/events/AttachableStartDetachEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/AttachableStartDetachEvent.lua` — FS25 1.25.1.0

- **AttachableStartDetachEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AttachableStartDetachEvent.emptyNew() → table` | 14 |  |
| `AttachableStartDetachEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 |  |
| `AttachableStartDetachEvent:readStream(streamId: integer, connection: Connection)` | 34 |  |
| `AttachableStartDetachEvent:writeStream(streamId: integer, connection: Connection)` | 44 |  |
| `AttachableStartDetachEvent:run(connection: Connection)` | 51 |  |
| `AttachableStartDetachEvent.sendEvent(vehicle: table, noEventSend: boolean)` | 66 |  |
