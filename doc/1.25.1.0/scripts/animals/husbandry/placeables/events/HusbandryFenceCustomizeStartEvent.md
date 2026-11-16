# animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeStartEvent.lua` — FS25 1.25.1.0

✍ Network event announcing that a player starts customizing the fence of a husbandry placeable. Sent by a client to the server, which rebroadcasts it to the other clients and applies it locally.

- **HusbandryFenceCustomizeStartEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryFenceCustomizeStartEvent.emptyNew()` | 17 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryFenceCustomizeStartEvent.new(placeable: any)` | 24 | ✍ Creates the event for the given husbandry placeable. |
| `HusbandryFenceCustomizeStartEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Reads the placeable as a node object from the stream, then runs the event. |
| `HusbandryFenceCustomizeStartEvent:writeStream(streamId: any, connection: any)` | 42 | ✍ Writes the placeable as a node object to the stream. |
| `HusbandryFenceCustomizeStartEvent:run(connection: any)` | 48 | ✍ If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, resolves the sending user (server only) and calls `startFenceCustomization(user, true)`. |
