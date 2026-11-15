# vehicles/specializations/SplineVehicle.lua

Source : `dataS/scripts/vehicles/specializations/SplineVehicle.lua` — FS25 1.25.1.0

- **SplineVehicle** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SplineVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `SplineVehicle.initSpecialization()` | 23 |  |
| `SplineVehicle.registerFunctions(vehicleType: any)` | 43 |  |
| `SplineVehicle.registerOverwrittenFunctions(vehicleType: any)` | 54 |  |
| `SplineVehicle.registerEventListeners(vehicleType: any)` | 65 |  |
| `SplineVehicle:onLoad(savegame: table)` | 74 |  |
| `SplineVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 103 |  |
| `SplineVehicle:setTrainSystem(superFunc: any, trainSystem: any)` | 111 |  |
| `SplineVehicle:getCurrentSplinePosition()` | 130 |  |
| `SplineVehicle:getFrontToBackDistance()` | 136 |  |
| `SplineVehicle:getSplineTimeFromDistance(t: any, distance: any, stepSize: any)` | 142 |  |
| `SplineVehicle:getSplinePositionAndTimeFromDistance(t: any, distance: any, stepSize: any)` | 154 |  |
| `SplineVehicle:alignToSplineTime(spline: any, yOffset: any, tFront: any)` | 167 |  |
| `SplineVehicle:getLastSpeed(superFunc: any, useAttacherVehicleSpeed: any)` | 228 |  |
| `SplineVehicle:getCurrentSurfaceSound()` | 234 |  |
| `SplineVehicle:getAreSurfaceSoundsActive(superFunc: any)` | 240 |  |
| `SplineVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 251 |  |
| `SplineVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 263 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getFrontToBackDistance` | 44 |
| registerFunction | `getSplineTimeFromDistance` | 45 |
| registerFunction | `getSplinePositionAndTimeFromDistance` | 46 |
| registerFunction | `alignToSplineTime` | 47 |
| registerFunction | `getCurrentSplinePosition` | 48 |
| registerFunction | `setSplineSpeed` | 49 |
| registerOverwrittenFunction | `getLastSpeed` | 55 |
| registerOverwrittenFunction | `setTrainSystem` | 56 |
| registerOverwrittenFunction | `getCurrentSurfaceSound` | 57 |
| registerOverwrittenFunction | `getAreSurfaceSoundsActive` | 58 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 59 |
| registerOverwrittenFunction | `loadDischargeNode` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onUpdate` | 67 |
