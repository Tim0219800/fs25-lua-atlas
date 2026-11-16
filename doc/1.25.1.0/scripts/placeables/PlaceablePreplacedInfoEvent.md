# placeables/PlaceablePreplacedInfoEvent.lua

*[Version française](../../fr/scripts/placeables/PlaceablePreplacedInfoEvent.md)*

Source: `dataS/scripts/placeables/PlaceablePreplacedInfoEvent.lua` — FS25 1.25.1.0

✍ Network event used when a client joins, to transfer information about preplaced placeables. It holds no data itself and delegates entirely to the placeable system's stream functions.

- **PlaceablePreplacedInfoEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceablePreplacedInfoEvent.emptyNew()` | 12 | ✍ Creates an empty event instance for the network layer. |
| `PlaceablePreplacedInfoEvent.new()` | 19 | ✍ Creates the event; it takes no arguments and stores nothing. |
| `PlaceablePreplacedInfoEvent:readStream(streamId: any, connection: any)` | 27 | ✍ Forwards the stream to `g_currentMission.placeableSystem:readStreamPreplacedInfo`, which reads the preplaced placeable info. |
| `PlaceablePreplacedInfoEvent:writeStream(streamId: any, connection: any)` | 33 | ✍ Forwards the stream to `g_currentMission.placeableSystem:writeStreamPreplacedInfo`, which writes the preplaced placeable info. |
