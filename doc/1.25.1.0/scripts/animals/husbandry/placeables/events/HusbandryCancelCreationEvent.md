# animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryCancelCreationEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryCancelCreationEvent.lua` — FS25 1.25.1.0

✍ Network event sent from a client to the server when the player cancels the husbandry creation step, so that the server creates the placeable without a meadow. It is client-to-server only; the run method asserts that it is not received from a server connection.

- **HusbandryCancelCreationEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryCancelCreationEvent.emptyNew()` | 17 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryCancelCreationEvent.new(placeableId: any)` | 24 | ✍ Creates the event and stores the given value in `placeableId`, which `writeStream` later sends as a node object id. Note: the caller is expected to pass an id (UNVERIFIED, no caller in this file). |
| `HusbandryCancelCreationEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Reads a node object id from the stream into `self.placeable`, then runs the event immediately. Note: it uses `readNodeObjectId`, so whether `self.placeable` is an object or a raw id depends on that function (UNVERIFIED, not in the dump). |
| `HusbandryCancelCreationEvent:writeStream(streamId: any, connection: any)` | 42 | ✍ Writes `self.placeableId` to the stream with `NetworkUtil.writeNodeObjectId`. |
| `HusbandryCancelCreationEvent:run(connection: any)` | 48 | ✍ Server side: if the placeable exists and has `createMeadow`, calls `createMeadow(false)` to finish creation without a meadow, as if the meadow dialog had been dismissed. Asserts the event comes from a client. |
