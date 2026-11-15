# placeables/specializations/events/PlaceableLightsStateEvent.lua

Source: `dataS/scripts/placeables/specializations/events/PlaceableLightsStateEvent.lua` — FS25 1.25.1.0

- **PlaceableLightsStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableLightsStateEvent.emptyNew() → table` | 14 |  |
| `PlaceableLightsStateEvent.new(placeable: table, groupIndex: integer, isActive: boolean)` | 23 |  |
| `PlaceableLightsStateEvent:readStream(streamId: integer, connection: Connection)` | 35 |  |
| `PlaceableLightsStateEvent:writeStream(streamId: integer, connection: Connection)` | 46 |  |
| `PlaceableLightsStateEvent:run(connection: Connection)` | 55 |  |
| `PlaceableLightsStateEvent.sendEvent(placeable: table, groupIndex: integer, isActive: boolean, noEventSend: any)` | 70 |  |
