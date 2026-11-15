# vehicles/specializations/HydraulicHammer.lua

Source: `dataS/scripts/vehicles/specializations/HydraulicHammer.lua` — FS25 1.25.1.0

- **HydraulicHammer** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HydraulicHammer.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `HydraulicHammer.initSpecialization()` | 24 |  |
| `HydraulicHammer.registerFunctions(vehicleType: any)` | 53 |  |
| `HydraulicHammer.registerOverwrittenFunctions(vehicleType: any)` | 59 |  |
| `HydraulicHammer.registerEventListeners(vehicleType: any)` | 67 |  |
| `HydraulicHammer:onLoad(savegame: table)` | 79 |  |
| `HydraulicHammer:onDelete()` | 136 |  |
| `HydraulicHammer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 148 |  |
| `HydraulicHammer:hydraulicHammerRaycastCallback(actorId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 166 |  |
| `HydraulicHammer:onDeactivate()` | 223 |  |
| `HydraulicHammer:onTurnedOn()` | 232 |  |
| `HydraulicHammer:onTurnedOff()` | 244 |  |
| `HydraulicHammer:getDirtMultiplier(superFunc: any) → number` | 262 |  |
| `HydraulicHammer:getWearMultiplier(superFunc: any) → number` | 276 |  |
| `HydraulicHammer:getConsumingLoad(superFunc: any)` | 289 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `hydraulicHammerRaycastCallback` | 54 |
| registerOverwrittenFunction | `getDirtMultiplier` | 60 |
| registerOverwrittenFunction | `getWearMultiplier` | 61 |
| registerOverwrittenFunction | `getConsumingLoad` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onUpdate` | 70 |
| registerEventListener | `onDeactivate` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
