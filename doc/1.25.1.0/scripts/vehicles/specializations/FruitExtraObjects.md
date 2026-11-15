# vehicles/specializations/FruitExtraObjects.lua

Source: `dataS/scripts/vehicles/specializations/FruitExtraObjects.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FruitExtraObjects.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `FruitExtraObjects.initSpecialization()` | 24 |  |
| `FruitExtraObjects.registerXMLPaths(schema: any, basePath: any)` | 40 |  |
| `FruitExtraObjects.registerFunctions(vehicleType: table)` | 54 |  |
| `FruitExtraObjects.registerOverwrittenFunctions(vehicleType: table)` | 63 |  |
| `FruitExtraObjects.registerEventListeners(vehicleType: table)` | 69 |  |
| `FruitExtraObjects:onPostLoad(savegame: table)` | 79 |  |
| `FruitExtraObjects:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 |  |
| `FruitExtraObjects:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 157 |  |
| `FruitExtraObjects:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 166 |  |
| `FruitExtraObjects:onPostDetach(attacherVehicle: table, implement: table)` | 174 |  |
| `FruitExtraObjects:loadFruitExtraObjectFromXML(xmlFile: any, key: any, extraObject: any)` | 180 |  |
| `FruitExtraObjects:getFruitExtraObjectTypeData()` | 225 |  |
| `FruitExtraObjects:updateFruitExtraObjects()` | 231 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadFruitExtraObjectFromXML` | 55 |
| registerFunction | `getFruitExtraObjectTypeData` | 56 |
| registerFunction | `updateFruitExtraObjects` | 57 |
| registerEventListener | `onPostLoad` | 70 |
| registerEventListener | `onDynamicMountTypeChanged` | 71 |
| registerEventListener | `onPreAttach` | 72 |
| registerEventListener | `onPostDetach` | 73 |
