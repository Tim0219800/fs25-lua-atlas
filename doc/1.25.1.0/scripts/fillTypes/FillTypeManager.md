# fillTypes/FillTypeManager.lua

Source: `dataS/scripts/fillTypes/FillTypeManager.lua` — FS25 1.25.1.0

- **FillTypeManager** inherits from `AbstractManager` (l.67)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FillTypeManager.new(customMt: table?) → table` | 73 |  |
| `FillTypeManager:initDataStructures()` | 80 |  |
| `FillTypeManager:loadDefaultTypes()` | 109 |  |
| `FillTypeManager:loadMapData(xmlFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 121 |  |
| `FillTypeManager:loadModFillTypes()` | 147 |  |
| `FillTypeManager:unloadMapData()` | 173 |  |
| `FillTypeManager:loadFillTypes(xmlFile: table\|integer, baseDirectory: string, isBaseType: boolean, customEnv: string?, finalizeType: any) → boolean` | 192 |  |
| `FillTypeManager:addFillType(fillTypeDesc: table) → boolean` | 315 |  |
| `FillTypeManager:assignFillTypeTextureArraysFromTerrain(nodeId: integer, terrainRootNodeId: integer, diffuse: boolean, normal: boolean, height: boolean)` | 341 |  |
| `FillTypeManager:assignCustomFillTypeTextureArraysFromTerrain(nodeId: integer, terrainRootNodeId: integer, diffuse: string, normal: string, height: string)` | 358 |  |
| `FillTypeManager:constructTerrainFillLayers(heightTypes: table, terrainRootNodeId: integer) → boolean` | 373 |  |
| `FillTypeManager:constructFillTypeDistanceTextureArray(terrainDetailHeightId: integer, typeFirstChannel: integer, typeNumChannels: integer, heightTypes: table) → boolean` | 412 |  |
| `FillTypeManager:getTextureArrayIndexByFillTypeIndex(index: integer) → integer` | 431 |  |
| `FillTypeManager:getPrioritizedEffectTypeByFillTypeIndex(index: integer) → string` | 440 |  |
| `FillTypeManager:getSmokeColorByFillTypeIndex(index: integer, fruitColor: boolean) → table` | 450 |  |
| `FillTypeManager:getFillTypeByIndex(index: integer) → table` | 467 |  |
| `FillTypeManager:getFillTypeNameByIndex(index: integer) → string` | 475 |  |
| `FillTypeManager:getFillTypeTitleByIndex(index: integer) → string` | 483 |  |
| `FillTypeManager:getFillTypeNamesByIndices(indices: table) → table` | 491 |  |
| `FillTypeManager:getFillTypeIndexByName(name: string) → integer` | 504 |  |
| `FillTypeManager:getFillTypeByName(name: string) → table` | 512 |  |
| `FillTypeManager:getFillTypes() → table` | 522 |  |
| `FillTypeManager:addFillTypeCategory(name: string, isBaseType: boolean) → integer` | 531 |  |
| `FillTypeManager:addFillTypeToCategory(fillTypeIndex: integer, categoryIndex: integer) → table` | 562 |  |
| `FillTypeManager:getFillTypesByCategoryNames(names: string, warning: string?, fillTypes: table?) → table` | 586 |  |
| `FillTypeManager:getIsFillTypeInCategory(fillTypeIndex: string, categoryName: string) → boolean` | 660 |  |
| `FillTypeManager:getFillTypesByNames(names: string, warning: string?, fillTypes: table?) → table` | 675 |  |
| `FillTypeManager:getFillTypesFromXML(xmlFile: XMLFile, categoryKey: string, namesKey: string, requiresFillTypes: boolean?) → table` | 708 |  |
| `FillTypeManager:addFillTypeConverter(name: string, isBaseType: boolean) → any` | 775 |  |
| `FillTypeManager:addFillTypeConversion(converter: integer, sourceFillTypeIndex: integer, targetFillTypeIndex: integer, conversionFactor: number)` | 806 |  |
| `FillTypeManager:getConverterDataByName(converterName: string) → table` | 816 |  |
| `FillTypeManager:getSampleByFillType(fillType: integer) → table` | 824 |  |
