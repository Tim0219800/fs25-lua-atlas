# vehicles/specializations/WoodContainer.lua

Source : `dataS/scripts/vehicles/specializations/WoodContainer.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WoodContainer.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `WoodContainer.initSpecialization()` | 26 |  |
| `WoodContainer.registerXMLPaths(schema: any, baseKey: any)` | 47 |  |
| `WoodContainer.registerFunctions(vehicleType: any)` | 61 |  |
| `WoodContainer.registerOverwrittenFunctions(vehicleType: any)` | 69 |  |
| `WoodContainer.registerEventListeners(vehicleType: any)` | 76 |  |
| `WoodContainer:onLoad(savegame: any)` | 84 |  |
| `WoodContainer:onDelete()` | 131 |  |
| `WoodContainer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 144 |  |
| `WoodContainer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 152 |  |
| `WoodContainer:getPalletUnloadTriggerExtraSellPrice()` | 182 |  |
| `WoodContainer:getIsWoodContainerFillingAllowed()` | 188 |  |
| `WoodContainer:getInfoBoxTitle(superFunc: any)` | 202 |  |
| `WoodContainer:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 208 |  |
| `WoodContainer:onWoodContainerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 228 |  |
| `WoodContainer.getSplitShapeInfo(objectId: any, targetLength: any)` | 257 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getPalletUnloadTriggerExtraSellPrice` | 62 |
| registerFunction | `getIsWoodContainerFillingAllowed` | 63 |
| registerFunction | `onWoodContainerTriggerCallback` | 64 |
| registerOverwrittenFunction | `getInfoBoxTitle` | 70 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 71 |
| registerEventListener | `onLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onFillUnitFillLevelChanged` | 79 |
