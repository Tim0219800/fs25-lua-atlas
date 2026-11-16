# handTools/events/HandsThrowObjectEvent.lua

*[Version française](../../../fr/scripts/handTools/events/HandsThrowObjectEvent.md)*

Source: `dataS/scripts/handTools/events/HandsThrowObjectEvent.lua` — FS25 1.25.1.0

✍ Network event that tells peers a player's hands released the held object, either simply dropped or thrown with a direction and a force. The client of the owning player sends it to the server, which re-broadcasts it to the other clients. The effect is applied through the HandToolHands specialization of the referenced hands object.

- **HandsThrowObjectEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandsThrowObjectEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance, used by the network layer before `readStream` fills it. |
| `HandsThrowObjectEvent:readStream(streamId: integer, connection: table)` | 44 | ✍ Reads the hands object, then a flag telling whether this is a throw. If so it reads a compressed direction (3 components in -1..1) and a force scalar (0..1), then calls `run`. |
| `HandsThrowObjectEvent:writeStream(streamId: integer, connection: table)` | 66 | ✍ Writes the hands object and the throw flag; direction and force scalar are only written when the flag is set. Compression bit counts come from constants of the class defined elsewhere. |
| `HandsThrowObjectEvent:run(connection: table)` | 84 | ✍ Applies the event. On the server it first rebroadcasts to other clients. A non-throw calls `dropHeldItem(true)`; a throw calls `throwHeldItemWithForceVector` with noEventSend set, so no new event is sent. |
