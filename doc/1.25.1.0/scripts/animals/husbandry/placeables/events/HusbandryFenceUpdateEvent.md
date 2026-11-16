# animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceUpdateEvent.lua` — FS25 1.25.1.0

✍ Network event that tells a receiver to rebuild the fence of a husbandry placeable, optionally deleting its customizable segments first. The file does not show who sends it or the direction (UNVERIFIED).

- **HusbandryFenceUpdateEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryFenceUpdateEvent.emptyNew()` | 12 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryFenceUpdateEvent.new(placeable: any, deleteCustomizableSegments: any)` | 19 | ✍ Creates the event for a placeable and a flag saying whether the customizable fence segments must be deleted. |
| `HusbandryFenceUpdateEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Reads the placeable (node object) and the delete flag from the stream, then runs the event. |
| `HusbandryFenceUpdateEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Writes the placeable as a node object and the delete flag to the stream. |
| `HusbandryFenceUpdateEvent:run(connection: any)` | 46 | ✍ When the placeable is synchronized, optionally calls `deleteCustomizableSegments()`, then always `finalizeHusbandryFence()`. No rebroadcast is done here. |
