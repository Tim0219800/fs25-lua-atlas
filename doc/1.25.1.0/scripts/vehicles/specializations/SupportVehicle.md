# vehicles/specializations/SupportVehicle.lua

Source : `dataS/scripts/vehicles/specializations/SupportVehicle.lua` — FS25 1.25.1.0

- **SupportVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SupportVehicle.prerequisitesPresent(specializations: any)` | 15 |  |
| `SupportVehicle.initSpecialization()` | 21 |  |
| `SupportVehicle.registerFunctions(vehicleType: any)` | 39 |  |
| `SupportVehicle.registerOverwrittenFunctions(vehicleType: any)` | 47 |  |
| `SupportVehicle.registerEventListeners(vehicleType: any)` | 57 |  |
| `SupportVehicle:onLoad(savegame: any)` | 66 |  |
| `SupportVehicle:onDelete()` | 128 |  |
| `SupportVehicle:onPostDetach(attacherVehicle: table, implement: table)` | 138 |  |
| `SupportVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 144 |  |
| `SupportVehicle:addSupportVehicle(isDetach: any)` | 167 |  |
| `SupportVehicle:supportVehicleLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 199 |  |
| `SupportVehicle:enableSupportVehicle()` | 222 |  |
| `SupportVehicle:removeSupportVehicle()` | 282 |  |
| `SupportVehicle:getAllowMultipleAttachments(superFunc: any)` | 296 |  |
| `SupportVehicle:resolveMultipleAttachments(superFunc: any)` | 302 |  |
| `SupportVehicle:getShowAttachableMapHotspot(superFunc: any)` | 312 |  |
| `SupportVehicle:getIsReadyToFinishDetachProcess(superFunc: any)` | 322 |  |
| `SupportVehicle:startDetachProcess(superFunc: any, noEventSend: any)` | 329 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `addSupportVehicle` | 40 |
| registerFunction | `enableSupportVehicle` | 41 |
| registerFunction | `removeSupportVehicle` | 42 |
| registerOverwrittenFunction | `getAllowMultipleAttachments` | 48 |
| registerOverwrittenFunction | `resolveMultipleAttachments` | 49 |
| registerOverwrittenFunction | `getShowAttachableMapHotspot` | 50 |
| registerOverwrittenFunction | `getIsReadyToFinishDetachProcess` | 51 |
| registerOverwrittenFunction | `startDetachProcess` | 52 |
| registerEventListener | `onLoad` | 58 |
| registerEventListener | `onDelete` | 59 |
| registerEventListener | `onUpdate` | 60 |
| registerEventListener | `onPostDetach` | 61 |
