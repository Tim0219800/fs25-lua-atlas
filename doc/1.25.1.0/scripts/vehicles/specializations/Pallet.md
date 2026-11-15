# vehicles/specializations/Pallet.lua

Source: `dataS/scripts/vehicles/specializations/Pallet.lua` — FS25 1.25.1.0

- **Pallet** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Pallet.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `Pallet.initSpecialization()` | 23 |  |
| `Pallet.registerFunctions(vehicleType: any)` | 54 |  |
| `Pallet.registerOverwrittenFunctions(vehicleType: any)` | 64 |  |
| `Pallet.registerEventListeners(vehicleType: any)` | 77 |  |
| `Pallet:onPreLoad(savegame: any)` | 87 |  |
| `Pallet:onLoad(savegame: table)` | 95 |  |
| `Pallet:onPostLoad(savegame: any)` | 227 |  |
| `Pallet:onDelete()` | 255 |  |
| `Pallet:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 271 |  |
| `Pallet:loadComponentFromXML(superFunc: any, component: any, xmlFile: any, key: any, rootPosition: any, i: any)` | 278 |  |
| `Pallet:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 290 |  |
| `Pallet:getMeshNodes(superFunc: any)` | 326 |  |
| `Pallet:collectPalletTensionBeltNodes(nodes: any)` | 343 |  |
| `Pallet:setPalletTensionBeltNodesDirty()` | 371 |  |
| `Pallet:getInfoBoxTitle()` | 463 |  |
| `Pallet:getAutoLoadSize(superFunc: any)` | 469 |  |
| `Pallet:autoLoad(superFunc: any, autoLoader: any, node: any, posX: any, posZ: any, sizeX: any, sizeZ: any)` | 481 |  |
| `Pallet:getShowInVehiclesOverview(superFunc: any)` | 496 |  |
| `Pallet:getCanBeReset(superFunc: any)` | 502 |  |
| `Pallet:getIsMapHotspotVisible(superFunc: any)` | 508 |  |
| `Pallet:getFillUnitEmptyOnReset(superFunc: any)` | 514 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onPalletI3DFileLoaded` | 55 |
| registerFunction | `getInfoBoxTitle` | 56 |
| registerFunction | `collectPalletTensionBeltNodes` | 57 |
| registerFunction | `setPalletTensionBeltNodesDirty` | 58 |
| registerFunction | `updatePalletStraps` | 59 |
| registerOverwrittenFunction | `getMeshNodes` | 65 |
| registerOverwrittenFunction | `loadComponentFromXML` | 66 |
| registerOverwrittenFunction | `getAutoLoadSize` | 67 |
| registerOverwrittenFunction | `autoLoad` | 68 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 69 |
| registerOverwrittenFunction | `getCanBeReset` | 70 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 71 |
| registerOverwrittenFunction | `getFillUnitEmptyOnReset` | 72 |
| registerEventListener | `onPreLoad` | 78 |
| registerEventListener | `onLoad` | 79 |
| registerEventListener | `onPostLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onFillUnitFillLevelChanged` | 82 |
