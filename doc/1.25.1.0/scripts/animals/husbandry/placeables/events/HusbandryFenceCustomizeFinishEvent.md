# animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceCustomizeFinishEvent.lua` — FS25 1.25.1.0

✍ Network event announcing that a player has finished customizing the fence of a husbandry placeable, with a success flag. A client sends it to the server, which rebroadcasts it to the other clients and applies it locally.

- **HusbandryFenceCustomizeFinishEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryFenceCustomizeFinishEvent.emptyNew()` | 17 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryFenceCustomizeFinishEvent.new(placeable: any, success: any)` | 24 | ✍ Creates the event for the given husbandry placeable and a boolean telling whether the customization succeeded. |
| `HusbandryFenceCustomizeFinishEvent:readStream(streamId: any, connection: any)` | 35 | ✍ Reads the placeable (node object) and the success bool from the stream, then runs the event. |
| `HusbandryFenceCustomizeFinishEvent:writeStream(streamId: any, connection: any)` | 44 | ✍ Writes the placeable as a node object and the success bool to the stream. |
| `HusbandryFenceCustomizeFinishEvent:run(connection: any)` | 51 | ✍ If received by the server, rebroadcasts it to other clients. When the placeable is synchronized, resolves the sending user (server only) and calls `finishFenceCustomization(user, success, true)`. |
