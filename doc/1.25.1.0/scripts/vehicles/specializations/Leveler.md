# vehicles/specializations/Leveler.lua

Source: `dataS/scripts/vehicles/specializations/Leveler.lua` — FS25 1.25.1.0

- **Leveler** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Leveler.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `Leveler.initSpecialization()` | 29 |  |
| `Leveler.registerFunctions(vehicleType: any)` | 76 |  |
| `Leveler.registerOverwrittenFunctions(vehicleType: any)` | 84 |  |
| `Leveler.registerEventListeners(vehicleType: any)` | 90 |  |
| `Leveler:onLoad(savegame: table)` | 101 |  |
| `Leveler:onDelete()` | 163 |  |
| `Leveler:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 174 |  |
| `Leveler:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 188 |  |
| `Leveler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 202 |  |
| `Leveler:loadLevelerNodeFromXML(levelerNode: table, xmlFile: XMLFile, key: string) → boolean` | 444 |  |
| `Leveler:getIsLevelerPickupNodeActive(levelerNode: table) → boolean` | 519 |  |
| `Leveler:getIsAttacherJointControlDampingAllowed(superFunc: any) → boolean` | 526 |  |
| `Leveler.onLevelerRaycastCallback(levelerNode: integer, hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 557 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsLevelerPickupNodeActive` | 77 |
| registerFunction | `loadLevelerNodeFromXML` | 78 |
| registerFunction | `onLevelerRaycastCallback` | 79 |
| registerOverwrittenFunction | `getIsAttacherJointControlDampingAllowed` | 85 |
| registerEventListener | `onLoad` | 91 |
| registerEventListener | `onDelete` | 92 |
| registerEventListener | `onReadUpdateStream` | 93 |
| registerEventListener | `onWriteUpdateStream` | 94 |
| registerEventListener | `onUpdate` | 95 |
