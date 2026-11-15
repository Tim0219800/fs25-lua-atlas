# vehicles/VehicleMaterialManager.lua

Source: `dataS/scripts/vehicles/VehicleMaterialManager.lua` — FS25 1.25.1.0

- **VehicleMaterialManager** inherits from `AbstractManager` (l.21)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleMaterialManager:initDataStructures()` | 36 |  |
| `VehicleMaterialManager:loadMapData(mapXMLFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 48 |  |
| `VehicleMaterialManager:addModMaterialTemplatesToLoad(xmlFilename: any, key: any, baseDirectory: any, customEnvironment: any)` | 68 |  |
| `VehicleMaterialManager:loadMaterialTemplates(xmlFilename: any, baseDirectory: any, customEnvironment: any)` | 74 |  |
| `VehicleMaterialManager:loadMaterialTemplatesFromXML(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any, parentTemplateDefault: any)` | 84 |  |
| `VehicleMaterialManager:getMaterialTemplateByName(name: any, customEnvironment: any)` | 183 |  |
| `VehicleMaterialManager:getMaterialTemplateColorByName(name: any, customEnvironment: any)` | 200 |  |
| `VehicleMaterialManager:getMaterialTemplateColorAndTitleByName(name: any, customEnvironment: any)` | 214 |  |
| `VehicleMaterialManager:getMaterialTemplateIndexByName(name: any)` | 247 |  |
| `VehicleMaterialManager:getMaterialTemplateNameByIndex(index: any)` | 262 |  |
| `VehicleMaterialManager:getMaterialTemplateFinish(materialTemplateName: any)` | 270 |  |
| `VehicleMaterialManager.registerXMLPaths(schema: any, basePath: any)` | 296 |  |
