# vehicles/specializations/events/PalletFillerStateEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/PalletFillerStateEvent.lua` — FS25 1.25.1.0

- **PalletFillerStateEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PalletFillerStateEvent.emptyNew() → table` | 19 |  |
| `PalletFillerStateEvent.new(object: table, state: table) → table` | 29 |  |
| `PalletFillerStateEvent:readStream(streamId: integer, connection: Connection)` | 41 |  |
| `PalletFillerStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 |  |
| `PalletFillerStateEvent:run(connection: Connection)` | 60 |  |
| `PalletFillerStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 75 |  |
