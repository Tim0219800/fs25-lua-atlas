# misc/SprayTypeManager.lua

Source: `dataS/scripts/misc/SprayTypeManager.lua` — FS25 1.25.1.0

- **SprayTypeManager** inherits from `AbstractManager` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SprayTypeManager.new(customMt: any) → table` | 19 |  |
| `SprayTypeManager:initDataStructures()` | 26 |  |
| `SprayTypeManager:loadDefaultTypes()` | 74 |  |
| `SprayTypeManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 83 |  |
| `SprayTypeManager:loadSprayTypes(xmlFile: any, missionInfo: any, isBaseType: any) → boolean` | 92 |  |
| `SprayTypeManager:addSprayType(name: string, litersPerSecond: number, typeName: any, sprayGroundType: any, isBaseType: any) → table` | 117 |  |
| `SprayTypeManager:getSprayTypeByIndex(index: integer) → table` | 172 |  |
| `SprayTypeManager:getSprayTypeByName(name: string) → table` | 183 |  |
| `SprayTypeManager:getFillTypeNameByIndex(index: integer) → string` | 195 |  |
| `SprayTypeManager:getFillTypeIndexByName(name: string) → integer` | 206 |  |
| `SprayTypeManager:getFillTypeByName(name: string) → table` | 218 |  |
| `SprayTypeManager:getSprayTypeByFillTypeIndex(index: any)` | 228 |  |
| `SprayTypeManager:getSprayTypeIndexByFillTypeIndex(index: integer) → integer` | 239 |  |
| `SprayTypeManager:getSprayTypes() → table` | 252 |  |
