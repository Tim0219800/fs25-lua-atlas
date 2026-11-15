# field/FieldManager.lua

Source: `dataS/scripts/field/FieldManager.lua` — FS25 1.25.1.0

- **FieldManager** inherits from `AbstractManager` (l.37)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FieldManager.new(customMt: table) → FieldManager` | 63 |  |
| `FieldManager:initDataStructures()` | 71 |  |
| `FieldManager:loadMapData(xmlFile: XMLFile, missionInfo: any, baseDirectory: any) → boolean` | 93 |  |
| `FieldManager:unloadMapData()` | 352 |  |
| `FieldManager:delete()` | 379 |  |
| `FieldManager:loadFromXMLFile(xmlFilename: string)` | 385 |  |
| `FieldManager:saveToXMLFile(xmlFilename: string)` | 432 |  |

## Messages

- subscribes `MessageType.FINISHED_GROWTH_PERIOD` (l.321)
- subscribes `MessageType.MISSION_GENERATION_START` (l.322)
- subscribes `MessageType.MISSION_GENERATION_END` (l.323)
