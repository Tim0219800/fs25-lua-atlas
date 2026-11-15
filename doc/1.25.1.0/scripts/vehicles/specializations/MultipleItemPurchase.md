# vehicles/specializations/MultipleItemPurchase.lua

Source: `dataS/scripts/vehicles/specializations/MultipleItemPurchase.lua` — FS25 1.25.1.0

- **MultipleItemPurchase** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `MultipleItemPurchase.initSpecialization()` | 15 |  |
| `MultipleItemPurchase.prerequisitesPresent(specializations: any)` | 38 |  |
| `MultipleItemPurchase.registerFunctions(vehicleType: any)` | 44 |  |
| `MultipleItemPurchase.registerOverwrittenFunctions(vehicleType: any)` | 51 |  |
| `MultipleItemPurchase.registerEventListeners(vehicleType: any)` | 61 |  |
| `MultipleItemPurchase:onLoad(savegame: table)` | 71 |  |
| `MultipleItemPurchase:onPreLoadFinished(savegame: table)` | 139 |  |
| `MultipleItemPurchase:loadItemAtPosition(position: any)` | 150 |  |
| `MultipleItemPurchase:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, loadingTask: any)` | 213 |  |
| `MultipleItemPurchase:onDelete()` | 243 |  |
| `MultipleItemPurchase:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 |  |
| `MultipleItemPurchase:getTotalMass(superFunc: any, onlyGivenVehicle: any)` | 270 |  |
| `MultipleItemPurchase:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 290 |  |
| `MultipleItemPurchase:setVisibility(superFunc: any, state: any)` | 312 |  |
| `MultipleItemPurchase:addToPhysics(superFunc: any)` | 323 |  |
| `MultipleItemPurchase:removeFromPhysics(superFunc: any)` | 341 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadItemAtPosition` | 45 |
| registerFunction | `onFinishLoadingVehicle` | 46 |
| registerOverwrittenFunction | `getTotalMass` | 52 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 53 |
| registerOverwrittenFunction | `setVisibility` | 54 |
| registerOverwrittenFunction | `addToPhysics` | 55 |
| registerOverwrittenFunction | `removeFromPhysics` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onPreLoadFinished` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onUpdate` | 65 |
