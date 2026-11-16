# objects/ProductionPointOutputModeEvent.lua

*[Version française](../../fr/scripts/objects/ProductionPointOutputModeEvent.md)*

Source: `dataS/scripts/objects/ProductionPointOutputModeEvent.lua` — FS25 1.25.1.0

✍ Network event telling that the output distribution mode of one output fill type of a production point changed (see ProductionPoint.OUTPUT_MODE, defined outside this dump). A client sends it to the server, which applies it and rebroadcasts it to the other clients.

- **ProductionPointOutputModeEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `ProductionPointOutputModeEvent.emptyNew() → table` | 13 | ✍ Creates an empty event instance, used when reading from a stream. |
| `ProductionPointOutputModeEvent.new(productionPoint: any, outputFillTypeId: any, outputMode: any)` | 20 | ✍ Creates the event with the production point, the output fill type id and the output mode. |
| `ProductionPointOutputModeEvent:readStream(streamId: any, connection: any)` | 30 | ✍ Reads the production point object, fill type id and mode from the stream, then runs the event. |
| `ProductionPointOutputModeEvent:writeStream(streamId: any, connection: any)` | 39 | ✍ Writes the production point object, fill type id and mode to the stream. |
| `ProductionPointOutputModeEvent:run(connection: any)` | 47 | ✍ On the server, rebroadcasts the event to the other clients; then, if the production point still exists, calls setOutputDistributionMode with the no-event flag so it does not resend. |
| `ProductionPointOutputModeEvent.sendEvent(productionPoint: any, outputFillTypeId: any, outputMode: any, noEventSend: any)` | 59 | ✍ Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server. |
