# placeables/PlaceableNameEvent.lua

*[Version française](../../fr/scripts/placeables/PlaceableNameEvent.md)*

Source: `dataS/scripts/placeables/PlaceableNameEvent.lua` — FS25 1.25.1.0

✍ Network event that carries a custom name for a placeable. A client sends it to the server, which applies the name and rebroadcasts it to all clients. A nil name means the custom name is reset.

- **PlaceableNameEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableNameEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used by the network layer before `readStream` fills it. |
| `PlaceableNameEvent.new(placeable: any, name: any)` | 19 | ✍ Builds an event for a placeable and a new name. Passing nil as the name marks the event as a reset and stores an empty string. |
| `PlaceableNameEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the placeable object, a reset flag and, if not a reset, the name string from the stream, then calls `run`. Note: on a reset the name field is not assigned from the stream. |
| `PlaceableNameEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Writes the placeable node object and the reset flag, followed by the name string only when the event is not a reset. |
| `PlaceableNameEvent:run(connection: any)` | 52 | ✍ Applies the name through `placeable:setName(name, true)` and logs it. When received by the server (connection is not the server), it rebroadcasts the event to the clients. |
| `PlaceableNameEvent.sendEvent(placeable: any, name: any, noEventSend: any)` | 65 | ✍ Sends a name event unless `noEventSend` is true: the server broadcasts it to clients, a client sends it to the server connection. |
