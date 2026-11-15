# vehicles/specializations/events/PickupSetStateEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/PickupSetStateEvent.lua` — FS25 1.25.1.0

- **PickupSetStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PickupSetStateEvent.emptyNew() → table` | 14 |  |
| `PickupSetStateEvent.new(object: table, isPickupLowered: boolean)` | 23 |  |
| `PickupSetStateEvent:readStream(streamId: integer, connection: Connection)` | 34 |  |
| `PickupSetStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 |  |
| `PickupSetStateEvent:run(connection: Connection)` | 52 |  |
| `PickupSetStateEvent.sendEvent(vehicle: table, isPickupLowered: boolean, noEventSend: boolean)` | 67 |  |
