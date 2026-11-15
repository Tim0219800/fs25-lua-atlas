# misc/ConsumableManager.lua

Source: `dataS/scripts/misc/ConsumableManager.lua` — FS25 1.25.1.0

- **ConsumableManager** inherits from `AbstractManager` (l.19)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ConsumableManager.new(customMt: any) → table` | 24 |  |
| `ConsumableManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 48 |  |
| `ConsumableManager:unloadMapData() → boolean` | 89 |  |
| `ConsumableManager:addModConsumable(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 119 |  |
| `ConsumableManager:loadConsumableVariationsFromXML(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 130 |  |
| `ConsumableManager:consumableI3DFileLoaded(i3dNode: any, failedReason: any, arguments: any)` | 263 |  |
| `ConsumableManager:getConsumableMeshByIndex(index: any, addTensionBeltMesh: any)` | 283 |  |
| `ConsumableManager:getConsumableConsumingMeshByIndex(index: any)` | 307 |  |
| `ConsumableManager:getConsumableVariationIndexByName(name: any, customEnvironment: any)` | 332 |  |
| `ConsumableManager:getConsumableVariationNameByIndex(index: any)` | 351 |  |
| `ConsumableManager:getConsumableVariationCapacityAndUnitByIndex(index: any)` | 362 |  |
| `ConsumableManager:getConsumableVariationShaderParameterByIndex(index: any)` | 373 |  |
| `ConsumableManager:getConsumableVariationMetaDataByIndex(index: any)` | 384 |  |
| `ConsumableManager:getConsumableVariationsByType(typeName: any)` | 395 |  |
| `ConsumableManager:getConsumableVariationPriceByIndex(index: any)` | 410 |  |
| `ConsumableManager:getTypeTitle(typeName: any)` | 421 |  |
| `ConsumableManager.registerConsumableXMLPaths(schema: any)` | 432 |  |
| `ConsumableManager.registerConsumablesXMLPaths(schema: any)` | 460 |  |
