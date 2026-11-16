# objects/ProductionPointProductionStatusEvent.lua

*[Version française](../../fr/scripts/objects/ProductionPointProductionStatusEvent.md)*

Source: `dataS/scripts/objects/ProductionPointProductionStatusEvent.lua` — FS25 1.25.1.0

✍ Network event carrying the status of one production of a production point, identified by its index in the productions list (sent as 8 bits). A client sends it to the server, which applies it and rebroadcasts it to the other clients. Status values come from ProductionPoint constants not present in this dump.

- **ProductionPointProductionStatusEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionPointProductionStatusEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used when reading from a stream. |
| `ProductionPointProductionStatusEvent.new(productionPoint: ProductionPoint, productionIndex: integer, status: integer) → ProductionPointProductionStatusEvent` | 24 | ✍ Creates the event with the production point, the production index and the status value. |
| `ProductionPointProductionStatusEvent:readStream(streamId: any, connection: any)` | 34 | ✍ Reads the production point object, the production index (8 bits) and the status from the stream, then runs the event. |
| `ProductionPointProductionStatusEvent:writeStream(streamId: any, connection: any)` | 43 | ✍ Writes the production point object, production index (8 bits) and status to the stream. |
| `ProductionPointProductionStatusEvent:run(connection: any)` | 51 | ✍ On the server, rebroadcasts the event; then looks up the production by index and calls setProductionStatus with the no-event flag. Note: no check that the index maps to an existing production. |
| `ProductionPointProductionStatusEvent.sendEvent(productionPoint: any, productionIndex: any, status: any, noEventSend: any)` | 64 | ✍ Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server. |
