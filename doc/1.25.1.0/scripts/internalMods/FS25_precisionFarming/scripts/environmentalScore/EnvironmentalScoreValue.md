# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua` — FS25 1.25.1.0

✍ Base class for one criterion of the environmental score. It keeps a table of per-farmland data (farmlandDatas), handles generic loading and saving under the criterion's xmlKey, and the network stream layout (count, then farmland id plus data). Subclasses override getScore (0 to 1), initFarmlandData, the load/save/stream hooks and overwriteGameFunctions.

- **EnvironmentalScoreValue** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreValue.new(pfModule: any, customMt: any)` | 16 | ✍ Constructor: stores pfModule and sets the default xmlKey to "default". Subclasses pass their own metatable and xmlKey. |
| `EnvironmentalScoreValue:initFarmlandData()` | 27 | ✍ Returns a fresh per-farmland data table; the base version returns an empty table and is meant to be overridden. |
| `EnvironmentalScoreValue:getFarmlandData(farmlandId: any)` | 33 | ✍ Returns the data table of a farmland, creating it through initFarmlandData (and storing the farmlandId in it) on first access. Returns nil for a nil id. |
| `EnvironmentalScoreValue:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 44 | ✍ Initialises an empty farmlandDatas table and returns true. Subclasses call it first when loading their map XML configuration. |
| `EnvironmentalScoreValue:loadFromItemsXML(xmlFile: any, key: any)` | 52 | ✍ Savegame loading: iterates the <xmlKey>.farmland entries and passes each to loadFarmlandData for the matching farmland id. |
| `EnvironmentalScoreValue:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 64 | ✍ Savegame writing: writes one <xmlKey>.farmland entry per stored farmland and lets saveFarmlandData add the details. |
| `EnvironmentalScoreValue:loadFarmlandData(data: any, xmlFile: any, key: any)` | 76 | ✍ Empty hook to read one farmland's saved values; overridden by subclasses. |
| `EnvironmentalScoreValue:saveFarmlandData(data: any, xmlFile: any, key: any)` | 81 | ✍ Empty hook to write one farmland's values; overridden by subclasses. |
| `EnvironmentalScoreValue:readStream(streamId: integer, connection: Connection, farmId: any)` | 88 | ✍ Client side read: reads a farmland count, then for each entry a farmland id and the data via readFarmlandDataFromStream. Bit width comes from g_farmlandManager.numberOfBits. |
| `EnvironmentalScoreValue:writeStream(streamId: integer, connection: Connection, farmId: any)` | 101 | ✍ Server side write: counts the farmlands owned by the given farm, then writes each farmland id followed by its data via writeFarmlandDataToStream. |
| `EnvironmentalScoreValue:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 121 | ✍ Empty hook for reading one farmland's data from a stream; overridden by subclasses. |
| `EnvironmentalScoreValue:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 126 | ✍ Empty hook for writing one farmland's data to a stream; overridden by subclasses. |
| `EnvironmentalScoreValue:update(dt: any)` | 131 | ✍ Empty per-frame update hook for subclasses. |
| `EnvironmentalScoreValue:getScore()` | 136 | ✍ Returns a neutral score of 0.5; subclasses return a 0 to 1 value for a given farmland id. |
| `EnvironmentalScoreValue:overwriteGameFunctions(pfModule: any)` | 142 | ✍ Hooks FertilizingSowingMachine.processSowingMachineArea to count direct-planting area through addWorkedArea. Note: the base class has no addWorkedArea, and every subclass overrides this method, so this body appears to be unused leftover code. |
