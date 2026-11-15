# placeables/specializations/PlaceableProductionPoint.lua

Source: `dataS/scripts/placeables/specializations/PlaceableProductionPoint.lua` — FS25 1.25.1.0

- **PlaceableProductionPoint** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableProductionPoint.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableProductionPoint.registerEvents(placeableType: any)` | 24 |  |
| `PlaceableProductionPoint.registerFunctions(placeableType: any)` | 31 |  |
| `PlaceableProductionPoint.registerOverwrittenFunctions(placeableType: any)` | 38 |  |
| `PlaceableProductionPoint.registerEventListeners(placeableType: any)` | 48 |  |
| `PlaceableProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 59 |  |
| `PlaceableProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 77 |  |
| `PlaceableProductionPoint.initSpecialization()` | 85 |  |
| `PlaceableProductionPoint:onLoad(savegame: table)` | 94 |  |
| `PlaceableProductionPoint:onDelete()` | 123 |  |
| `PlaceableProductionPoint:onFinalizePlacement()` | 134 |  |
| `PlaceableProductionPoint:updateInfo(superFunc: any, infoTable: any)` | 163 |  |
| `PlaceableProductionPoint:outputsChanged(outputs: any, state: any)` | 171 |  |
| `PlaceableProductionPoint:productionStatusChanged(production: any, status: any)` | 177 |  |
| `PlaceableProductionPoint:onReadStream(streamId: any, connection: any)` | 183 |  |
| `PlaceableProductionPoint:onWriteStream(streamId: any, connection: any)` | 194 |  |
| `PlaceableProductionPoint:loadFromXMLFile(xmlFile: any, key: any)` | 205 |  |
| `PlaceableProductionPoint:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 214 |  |
| `PlaceableProductionPoint:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 223 |  |
| `PlaceableProductionPoint:collectPickObjects(superFunc: any, node: any)` | 242 |  |
| `PlaceableProductionPoint:canBuy(superFunc: any)` | 265 |  |
| `PlaceableProductionPoint:onBuy()` | 276 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onOutputFillTypesChanged` | 25 |
| registerEvent | `onProductionStatusChanged` | 26 |
| registerFunction | `outputsChanged` | 32 |
| registerFunction | `productionStatusChanged` | 33 |
| registerOverwrittenFunction | `setOwnerFarmId` | 39 |
| registerOverwrittenFunction | `collectPickObjects` | 40 |
| registerOverwrittenFunction | `canBuy` | 41 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `finalizeConstruction` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onFinalizePlacement` | 51 |
| registerEventListener | `onWriteStream` | 52 |
| registerEventListener | `onReadStream` | 53 |
| registerEventListener | `onBuy` | 54 |
