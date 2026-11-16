# internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/SoilSamplerStartEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) telling a soil sampler vehicle to start a soil sampling run. Synchronised between clients and server through the usual re-broadcast pattern.

- **SoilSamplerStartEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `SoilSamplerStartEvent.emptyNew() → table` | 14 | ✍ Creates an empty SoilSamplerStartEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `SoilSamplerStartEvent.new(object: table)` | 22 | ✍ Creates the event for a soil sampler object. |
| `SoilSamplerStartEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the network object reference, then calls run. |
| `SoilSamplerStartEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Writes the network object reference. |
| `SoilSamplerStartEvent:run(connection: Connection)` | 48 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:startSoilSampling(true). |
| `SoilSamplerStartEvent.sendEvent(object: table, noEventSend: boolean)` | 62 | ✍ Entry point to sync the start of soil sampling. Server: broadcasts a new SoilSamplerStartEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
