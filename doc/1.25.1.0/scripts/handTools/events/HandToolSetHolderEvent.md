# handTools/events/HandToolSetHolderEvent.lua

*[Version française](../../../fr/scripts/handTools/events/HandToolSetHolderEvent.md)*

Source: `dataS/scripts/handTools/events/HandToolSetHolderEvent.lua` — FS25 1.25.1.0

✍ Network event that changes the holder of a hand tool (a player or a `HandToolHolder`), or clears it. A client sends it to the server, which rebroadcasts it; after applying it, it publishes the event class on the message center.

- **HandToolSetHolderEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolSetHolderEvent.emptyNew() → table` | 18 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `HandToolSetHolderEvent.new(handTool: any, holder: any)` | 25 | ✍ Creates the event for a hand tool and a holder (may be nil to clear it); `hasHolder` is true when a holder is given. |
| `HandToolSetHolderEvent:readStream(streamId: integer, connection: Connection)` | 39 | ✍ Reads the hand tool, a bool telling whether there is a holder, and the holder when present, then runs the event. |
| `HandToolSetHolderEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the hand tool, a presence bool and, if a holder exists, the holder as node objects. |
| `HandToolSetHolderEvent:run(connection: Connection)` | 64 | ✍ If received by the server, rebroadcasts it. When the tool is synchronized and the holder could be resolved (or none was sent), calls `setHolder(holder, true)`. Always publishes `HandToolSetHolderEvent` on `g_messageCenter`. |
| `HandToolSetHolderEvent.sendEvent(handTool: table, holder: table, noEventSend: boolean)` | 83 | ✍ Helper unless `noEventSend` is true: a server broadcasts the event to all clients, a client sends it to the server. |
