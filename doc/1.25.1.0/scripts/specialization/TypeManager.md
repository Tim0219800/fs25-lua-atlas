# specialization/TypeManager.lua

Source : `dataS/scripts/specialization/TypeManager.lua` — FS25 1.25.1.0

- **TypeManager** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TypeManager.new(typeName: any, rootElementName: any, xmlFilename: any, specializationManager: any, customMt: any) → table` | 17 |  |
| `TypeManager:loadMapData() → boolean` | 40 |  |
| `TypeManager:unloadMapData()` | 71 |  |
| `TypeManager:addType(typeName: string, className: string, filename: string, customEnvironment: string, parent: any) → boolean` | 82 |  |
| `TypeManager:loadTypeFromXML(xmlFile: any, key: any, isDLC: any, modDir: any, modName: any)` | 118 |  |
| `TypeManager:addSpecialization(typeName: any, specName: any)` | 218 |  |
| `TypeManager:validateTypes()` | 245 |  |
| `TypeManager:finalizeTypes()` | 264 |  |
| `TypeManager:getTypes()` | 324 |  |
| `TypeManager:removeType(typeName: any)` | 330 |  |
| `TypeManager:getTypeByName(typeName: any, modName: any)` | 336 |  |
| `TypeManager:getObjectTypeFromXML(xmlFilename: any)` | 363 |  |
