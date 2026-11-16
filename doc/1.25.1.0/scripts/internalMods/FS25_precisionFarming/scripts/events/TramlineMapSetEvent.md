# internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/TramlineMapSetEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that synchronises a tramline change on one farmland: working width, direction, spacing, an enabled flag and whether to clear the fruit. Clients send it to the server, which re-broadcasts it.

- **TramlineMapSetEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `TramlineMapSetEvent.emptyNew() → table` | 14 | ✍ Creates an empty TramlineMapSetEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `TramlineMapSetEvent.new(farmlandId: table, workingWidth: any, workDirection: any, spacing: any, enabled: any, clearFruit: any)` | 22 | ✍ Creates the event with the farmland id, working width, work direction, spacing, enabled flag and clearFruit flag. |
| `TramlineMapSetEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the farmland id, three 32 bit floats and two booleans (enabled, clearFruit), then calls run. |
| `TramlineMapSetEvent:writeStream(streamId: integer, connection: Connection)` | 53 | ✍ Writes the same fields in the same order as readStream. |
| `TramlineMapSetEvent:run(connection: Connection)` | 65 | ✍ Receiving side. The server re-broadcasts to the other clients, then every side calls tramlineMap:setFarmlandTramlines(...) with noEventSend set, if the tramline map exists. |
| `TramlineMapSetEvent.sendEvent(farmlandId: table, workingWidth: boolean, workDirection: any, spacing: any, enabled: any, clearFruit: any, noEventSend: boolean)` | 81 | ✍ Entry point to sync a tramline change. Server: broadcasts a new TramlineMapSetEvent to all clients; client: sends it to the server. Does nothing when noEventSend is true. |
