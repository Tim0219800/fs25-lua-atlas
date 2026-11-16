# placeables/specializations/events/PlaceableLightsStateEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableLightsStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableLightsStateEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that switches a light group of a placeable on or off. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.

- **PlaceableLightsStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableLightsStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream reading. |
| `PlaceableLightsStateEvent.new(placeable: table, groupIndex: integer, isActive: boolean)` | 23 | ✍ Creates the event with the placeable, the light group index and the target active state. |
| `PlaceableLightsStateEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the placeable, the group index (`PlaceableLights.MAX_NUM_BITS` bits) and the active flag, then calls `run`. |
| `PlaceableLightsStateEvent:writeStream(streamId: integer, connection: Connection)` | 46 | ✍ Writes the placeable, the group index (`PlaceableLights.MAX_NUM_BITS` bits) and the active flag. |
| `PlaceableLightsStateEvent:run(connection: Connection)` | 55 | ✍ On the server, rebroadcasts to other connections (not the sender); then, if the placeable is synchronized and has `setGroupIsActive`, applies the state locally without resending. |
| `PlaceableLightsStateEvent.sendEvent(placeable: table, groupIndex: integer, isActive: boolean, noEventSend: any)` | 70 | ✍ Unless `noEventSend` is true, broadcasts the event from the server, or sends it to the server from a client. |
