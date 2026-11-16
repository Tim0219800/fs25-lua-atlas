# internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/AdditionalFieldBuyInfoEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that carries the extra field buy information (Precision Farming data shown when buying a farmland) from server to a requesting client. It is sent in reply to RequestFieldBuyInfoEvent.

- **AdditionalFieldBuyInfoEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AdditionalFieldBuyInfoEvent.emptyNew() → table` | 14 | ✍ Creates an empty AdditionalFieldBuyInfoEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `AdditionalFieldBuyInfoEvent.new(farmlandId: table)` | 22 | ✍ Creates the event for a farmland id. |
| `AdditionalFieldBuyInfoEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Client side: reads the farmland id, then lets g_precisionFarming.additionalFieldBuyInfo read the data with readInfoFromStream, if that object exists. |
| `AdditionalFieldBuyInfoEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Server side: writes the farmland id, then lets g_precisionFarming.additionalFieldBuyInfo write the data with writeInfoToStream, if that object exists. |
