# animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua

*[Version française](../../../../../fr/scripts/animals/husbandry/placeables/events/HusbandryFenceValidateEvent.md)*

Source: `dataS/scripts/animals/husbandry/placeables/events/HusbandryFenceValidateEvent.lua` — FS25 1.25.1.0

✍ Request/response event pair for validating a husbandry fence. A client sends the placeable to the server, which tries to finalize the fence and answers with a success bool that the client publishes on the message center.

- **HusbandryFenceValidateEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HusbandryFenceValidateEvent.emptyNew()` | 17 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HusbandryFenceValidateEvent.new(placeable: any)` | 24 | ✍ Creates the client-to-server request holding the placeable to validate. Note: `run` also calls `HusbandryFenceValidateEvent.newServerToClient`, which is not defined in this file (UNVERIFIED, may be missing in the dump or a bug). |
| `HusbandryFenceValidateEvent:readStream(streamId: any, connection: any)` | 42 | ✍ If the sender is a client, reads the placeable node object; if the sender is the server, reads the success bool. Then runs the event. |
| `HusbandryFenceValidateEvent:writeStream(streamId: any, connection: any)` | 54 | ✍ On a client connection to the server, writes the placeable node object; otherwise writes `self.success` as a bool. |
| `HusbandryFenceValidateEvent:run(connection: any)` | 64 | ✍ Client: publishes `HusbandryFenceValidateEvent` with the success value on `g_messageCenter`. Server: calls `tryFinalizeFence()` on the placeable and sends the result back to the requesting connection. |
