# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua` — FS25 1.25.1.0

✍ Environmental score criterion for tillage. Per farmland it tracks the worked area (in square meters) for each tillage type (none, deep cultivation, flat cultivation, direct planting) and weights them (0.5, 0, 0.5, 1) into a 0 to 1 score. Server hooks on Cultivator, SowingMachine, FertilizingSowingMachine and HarvestExtension feed it. Subclass of EnvironmentalScoreValue.

- **EnvironmentalScoreTillage** inherits from `EnvironmentalScoreValue` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreTillage.new(pfModule: any, customMt: any)` | 22 | ✍ Constructor: sets the xmlKey to "tillage" and the weight of each tillage type. |
| `EnvironmentalScoreTillage:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 39 | ✍ Calls the parent loadFromXML and returns its result. |
| `EnvironmentalScoreTillage:update(dt: any)` | 49 | ✍ Empty update hook. |
| `EnvironmentalScoreTillage:getScore(farmlandId: any)` | 54 | ✍ Returns the tillage score: the client score if present, else the sum over types of the worked share of the field (capped at 1) times the type weight, capped at 1. Without field area it returns the weight of the none type. |
| `EnvironmentalScoreTillage:initFarmlandData()` | 75 | ✍ Creates the per-farmland record. The none-type area starts at math.huge as a marker meaning "not yet initialised"; the other areas start at 0. |
| `EnvironmentalScoreTillage:loadFarmlandData(data: any, xmlFile: any, key: any)` | 89 | ✍ Reads totalFieldArea and the four worked areas (none, deep, flat, direct) from the savegame XML. |
| `EnvironmentalScoreTillage:saveFarmlandData(data: any, xmlFile: any, key: any)` | 99 | ✍ Writes the total field area and the four worked areas, but only once the record has been initialised (none-type area no longer math.huge). |
| `EnvironmentalScoreTillage:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 111 | ✍ Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals. |
| `EnvironmentalScoreTillage:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 118 | ✍ Server side: writes the current score as an 8 bit value (score times 255). |
| `EnvironmentalScoreTillage:addWorkedArea(farmlandId: any, area: any, type: any)` | 125 | ✍ Registers area worked with a tillage type. On first use the farmland's total area becomes the none-type area; the converted area is then taken evenly from the other types and added to the given type. |
| `EnvironmentalScoreTillage:overwriteGameFunctions(pfModule: any)` | 165 | ✍ Server only. Hooks Cultivator.processCultivatorArea (deep or flat by useDeepMode), SowingMachine and FertilizingSowingMachine.processSowingMachineArea (direct planting) and HarvestExtension.setLastScoringValues (grass counts as direct planting). Uses vehicle:getPFStatisticInfo for the farmland. |
