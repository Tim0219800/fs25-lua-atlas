# vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringStateEvent.lua` — FS25 1.25.1.0

- **AIAutomaticSteeringStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIAutomaticSteeringStateEvent.emptyNew() → table` | 14 |  |
| `AIAutomaticSteeringStateEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 |  |
| `AIAutomaticSteeringStateEvent:readStream(streamId: integer, connection: Connection)` | 37 |  |
| `AIAutomaticSteeringStateEvent:writeStream(streamId: integer, connection: Connection)` | 53 |  |
| `AIAutomaticSteeringStateEvent:run(connection: Connection)` | 66 |  |
| `AIAutomaticSteeringStateEvent.sendEvent(vehicle: table, state: integer, segmentIndex: boolean, segmentIsLeft: any, noEventSend: boolean)` | 81 |  |
