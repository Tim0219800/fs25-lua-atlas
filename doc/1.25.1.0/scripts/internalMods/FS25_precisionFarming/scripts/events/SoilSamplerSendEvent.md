# internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerSendEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) telling a soil sampler vehicle to send its taken samples for analysis. Synchronised between clients and server through the usual re-broadcast pattern.

- **SoilSamplerSendEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SoilSamplerSendEvent.emptyNew() → table` | 14 | ✍ Creates an empty SoilSamplerSendEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `SoilSamplerSendEvent.new(object: table)` | 22 | ✍ Creates the event for a soil sampler object. |
| `SoilSamplerSendEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the network object reference, then calls run. |
| `SoilSamplerSendEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Writes the network object reference. |
| `SoilSamplerSendEvent:run(connection: Connection)` | 48 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:sendTakenSoilSamples(true). |
| `SoilSamplerSendEvent.sendEvent(object: table, noEventSend: boolean)` | 62 | ✍ Entry point to sync the sending of taken soil samples. Server: broadcasts a new SoilSamplerSendEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
