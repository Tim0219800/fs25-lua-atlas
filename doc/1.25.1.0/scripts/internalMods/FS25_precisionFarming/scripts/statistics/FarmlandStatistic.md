# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistic.lua` — FS25 1.25.1.0

✍ Per-farmland statistics holder of Precision Farming. It owns two FarmlandStatisticCounter objects, one for the current period and one for the whole game, and handles XML save/load, network stream sync, reset and increments.

- **FarmlandStatistic** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandStatistic.new(farmlandId: any, customMt: any)` | 16 | ✍ Constructor. Stores the farmland id, a hasChanged flag and creates fresh period and total counters. |
| `FarmlandStatistic:loadFromItemsXML(xmlFile: any, key: any)` | 30 | ✍ Loads both counters from the items XML if the stored #farmlandId matches this statistic; otherwise logs a warning and loads nothing. |
| `FarmlandStatistic:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 41 | ✍ Writes the farmland id and both counters (periodCounter, totalCounter) under the given XML key. |
| `FarmlandStatistic:onReadStream(streamId: integer, connection: Connection)` | 51 | ✍ Client side on join: reads period then total counter from the stream. Order must match onWriteStream. |
| `FarmlandStatistic:onWriteStream(streamId: integer, connection: Connection)` | 61 | ✍ Server side on join: writes period then total counter to the stream. |
| `FarmlandStatistic:reset(clearTotal: any)` | 68 | ✍ Resets the period counter; also resets the total counter when clearTotal is true. |
| `FarmlandStatistic:getValue(total: any, name: any)` | 78 | ✍ Returns the named value from the total counter if total is true, otherwise from the period counter. Returns 0 for unknown names. |
| `FarmlandStatistic:updateStatistic(name: any, value: any)` | 93 | ✍ Adds a value to the named field of both counters (only fields that exist) and sets hasChanged. |
