# placeables/specializations/events/PlaceableTrainSystemSellEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableTrainSystemSellEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableTrainSystemSellEvent.lua` — FS25 1.25.1.0

✍ Client-to-server network event asking a PlaceableTrainSystem to sell its goods. The server executes `sellGoods`; the effects on money or fill levels are implemented elsewhere (UNVERIFIED).

- **PlaceableTrainSystemSellEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableTrainSystemSellEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable, used by the network layer before reading a stream. |
| `PlaceableTrainSystemSellEvent.new(object: table) → PlaceableTrainSystemSellEvent` | 22 | ✍ Builds the event from the train system object. |
| `PlaceableTrainSystemSellEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the object from the stream and runs the event. |
| `PlaceableTrainSystemSellEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Writes only the train system object reference. |
| `PlaceableTrainSystemSellEvent:run(connection: Connection)` | 48 | ✍ Acts only on the server side (when the connection is not the server's): if the object is synchronized, calls `sellGoods` on it. No rebroadcast. |
