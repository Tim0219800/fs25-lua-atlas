# internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ResetYieldMapEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) sent by a client to reset the yield map data of a farmland. The server applies it through the yieldMap object of g_precisionFarming.

- **ResetYieldMapEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ResetYieldMapEvent.emptyNew() → table` | 14 | ✍ Creates an empty ResetYieldMapEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `ResetYieldMapEvent.new(farmlandId: table)` | 22 | ✍ Creates the event for a farmland id. |
| `ResetYieldMapEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the farmland id, then calls run. |
| `ResetYieldMapEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Client side: writes the farmland id. |
| `ResetYieldMapEvent:run(connection: Connection)` | 48 | ✍ Executes only on the server: calls g_precisionFarming.yieldMap:resetFarmlandYieldArea for the farmland, then updatePrecisionFarmingOverlays. |
