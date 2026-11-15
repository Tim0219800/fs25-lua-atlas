# ai/HelperManager.lua

Source: `dataS/scripts/ai/HelperManager.lua` — FS25 1.25.1.0

- **HelperManager** inherits from `AbstractManager` (l.27)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HelperManager.new(customMt: any) → table` | 32 |  |
| `HelperManager:initDataStructures()` | 39 |  |
| `HelperManager:loadDefaultTypes(missionInfo: any, baseDirectory: any)` | 49 |  |
| `HelperManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 58 |  |
| `HelperManager:loadHelpers(xmlFileHandle: any, missionInfo: any, baseDirectory: any, isBaseType: any, customEnvironment: any) → boolean` | 68 |  |
| `HelperManager:addHelper(name: string, title: string, color: string, playerStyle: any, baseDir: string, isBaseType: any) → boolean` | 95 |  |
| `HelperManager:getRandomHelper() → table` | 141 |  |
| `HelperManager:getRandomHelperStyle() → table` | 148 |  |
| `HelperManager:getRandomIndex() → integer` | 155 |  |
| `HelperManager:getHelperByIndex(index: integer) → table` | 163 |  |
| `HelperManager:getHelperByName(name: string) → table` | 174 |  |
| `HelperManager:useHelper(helper: table) → boolean` | 186 |  |
| `HelperManager:releaseHelper(helper: table)` | 199 |  |
| `HelperManager:getNumOfHelpers() → integer` | 206 |  |
