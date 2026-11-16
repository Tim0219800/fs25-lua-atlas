# objects/ProductionPointProductionStateEvent.lua

*[Version française](../../fr/scripts/objects/ProductionPointProductionStateEvent.md)*

Source: `dataS/scripts/objects/ProductionPointProductionStateEvent.lua` — FS25 1.25.1.0

✍ Network event telling that a production of a production point was switched on or off, identified by its string id. A client sends it to the server, which applies it and rebroadcasts it to the other clients.

- **ProductionPointProductionStateEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionPointProductionStateEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used when reading from a stream. |
| `ProductionPointProductionStateEvent.new(productionPoint: any, productionId: any, isEnabled: any)` | 20 | ✍ Creates the event with the production point, the production id string and the enabled flag. |
| `ProductionPointProductionStateEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Reads the production point object, production id string and enabled flag from the stream, then runs the event. |
| `ProductionPointProductionStateEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Writes the production point object, production id string and enabled flag to the stream. |
| `ProductionPointProductionStateEvent:run(connection: any)` | 47 | ✍ On the server, rebroadcasts the event to the other clients; then, if the production point exists, calls setProductionState with the no-event flag. |
| `ProductionPointProductionStateEvent.sendEvent(productionPoint: any, productionId: any, isEnabled: any, noEventSend: any)` | 59 | ✍ Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server. |
