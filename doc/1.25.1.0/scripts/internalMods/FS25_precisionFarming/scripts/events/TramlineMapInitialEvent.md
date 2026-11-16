# internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapInitialEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that sends all farmland tramline settings (working width, work direction, spacing) from the server to a joining client.

- **TramlineMapInitialEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TramlineMapInitialEvent.emptyNew() → table` | 14 | ✍ Creates an empty TramlineMapInitialEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `TramlineMapInitialEvent.new(farmlandTramlineStates: table)` | 22 | ✍ Creates the event with a table of tramline states indexed by farmland id. |
| `TramlineMapInitialEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Client side: reads a farmland count, then for each farmland its id and three 32 bit floats (workingWidth, workDirection, spacing); then calls run. |
| `TramlineMapInitialEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Server side: writes the farmland count, then each farmland id with its three float values. |
| `TramlineMapInitialEvent:run(connection: Connection)` | 69 | ✍ Replaces g_precisionFarming.tramlineMap.farmlandTramlineStates with the received table, if the tramline map exists. |
