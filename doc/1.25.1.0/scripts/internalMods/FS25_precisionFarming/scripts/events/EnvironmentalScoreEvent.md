# internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/EnvironmentalScoreEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that sends the environmental score data of one farm from server to a client, in reply to RequestEnvironmentalScoreEvent.

- **EnvironmentalScoreEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreEvent.emptyNew() → table` | 14 | ✍ Creates an empty EnvironmentalScoreEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `EnvironmentalScoreEvent.new(farmId: table)` | 22 | ✍ Creates the event for a farm id. |
| `EnvironmentalScoreEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Client side: reads the farm id, then passes the stream to g_precisionFarming.environmentalScore:readStream, if it exists. |
| `EnvironmentalScoreEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Server side: writes the farm id, then lets g_precisionFarming.environmentalScore:writeStream write that farm's score data. |
