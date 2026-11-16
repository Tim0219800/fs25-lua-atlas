# vehicles/specializations/SplineVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SplineVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/SplineVehicle.lua` — FS25 1.25.1.0

✍ Specialization for vehicles that only move along a spline (the train wagons and locomotives). It reads the front/back nodes and the two dollies, measures their distances, and lets the train system (`self.trainSystem`, set through `setTrainSystem`) place the vehicle along the rail spline with `alignToSplineTime`. It overrides speed, surface sound and discharge activation. The TrainSystem class is not in the dump, so its behaviour is UNVERIFIED. Note: `setSplineSpeed` is registered as a vehicle function but no function of that name is defined in this file.

- **SplineVehicle** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SplineVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `SplineVehicle.initSpecialization()` | 23 | ✍ Declares the XML schema for `vehicle.splineVehicle.dollies` (front/back nodes, the two dolly nodes, align flag) and the `needsIsEntered` attribute on discharge nodes (also per configuration). |
| `SplineVehicle.registerFunctions(vehicleType: any)` | 43 | ✍ Registers `getFrontToBackDistance`, `getSplineTimeFromDistance`, `getSplinePositionAndTimeFromDistance`, `alignToSplineTime`, `getCurrentSplinePosition` and `setSplineSpeed`. |
| `SplineVehicle.registerOverwrittenFunctions(vehicleType: any)` | 54 | ✍ Overrides `getLastSpeed`, `setTrainSystem`, `getCurrentSurfaceSound`, `getAreSurfaceSoundsActive`, `getIsDischargeNodeActive` and `loadDischargeNode`. |
| `SplineVehicle.registerEventListeners(vehicleType: any)` | 65 | ✍ Subscribes to onLoad and onUpdate. |
| `SplineVehicle:onLoad(savegame: table)` | 74 | ✍ Reads the front, back and dolly nodes, computes their distances (front to back, dolly to dolly, root to each end) with `calcDistanceFrom`, reads the align flag and zeroes the spline position and speed state. |
| `SplineVehicle:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 103 | ✍ If a train system is set, asks it to update the railroad vehicle positions with `updateRailroadVehiclePositions(dt)`. |
| `SplineVehicle:setTrainSystem(superFunc: any, trainSystem: any)` | 111 | ✍ Calls the parent, then converts the vehicle's measured distances into spline time fractions using the spline length from the train system. |
| `SplineVehicle:getCurrentSplinePosition()` | 130 | ✍ Returns the current spline position (time value) of the vehicle. |
| `SplineVehicle:getFrontToBackDistance()` | 136 | ✍ Returns the distance between the front and back nodes, measured at load. |
| `SplineVehicle:getSplineTimeFromDistance(t: any, distance: any, stepSize: any)` | 142 | ✍ Returns the valid spline time reached by moving a given distance from spline time `t`; direction forward if `stepSize` is not negative. Returns nothing without a train system. |
| `SplineVehicle:getSplinePositionAndTimeFromDistance(t: any, distance: any, stepSize: any)` | 154 | ✍ Same as `getSplineTimeFromDistance` but returns the x, y, z spline position and the valid spline time. Returns nothing without a train system. |
| `SplineVehicle:alignToSplineTime(spline: any, yOffset: any, tFront: any)` | 167 | ✍ Places the vehicle on the spline from the front spline time: derives the moving direction, positions the root from the front and dolly points, sets orientation, feeds the network interpolators, aligns the dolly nodes, stores the position and returns the spline time of the back node. Note: it reads `spec.trainSystem` for the spline length, while the rest of the file uses `self.trainSystem`, so this looks like a bug (UNVERIFIED which one is set). |
| `SplineVehicle:getLastSpeed(superFunc: any, useAttacherVehicleSpeed: any)` | 228 | ✍ Returns the absolute spline speed converted to km/h (spline position speed times 3.6), ignoring the parent. |
| `SplineVehicle:getCurrentSurfaceSound()` | 234 | ✍ Returns the wheel surface sound registered under "railroad". |
| `SplineVehicle:getAreSurfaceSoundsActive(superFunc: any)` | 240 | ✍ Delegates to the root vehicle when this is not the root (so only the train head decides); otherwise returns true. |
| `SplineVehicle:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 251 | ✍ Calls the parent and additionally reads `needsIsEntered` (default true) onto the discharge node entry. |
| `SplineVehicle:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 263 | ✍ For nodes that need the vehicle to be entered, returns false while the root vehicle is not controlled; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
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
