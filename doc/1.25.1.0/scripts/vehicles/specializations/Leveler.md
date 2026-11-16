# vehicles/specializations/Leveler.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Leveler.md)*

Source: `dataS/scripts/vehicles/specializations/Leveler.lua` — FS25 1.25.1.0

✍ Specialization for blades/levelers that push and spread bulk material (silage, chaff, snow-like heaps) over the height-map terrain, mainly in bunker silos. Requires FillUnit and BunkerSiloInteractor. Each `vehicle.leveler.levelerNode` picks material up while driving in the pick-up direction, drops it along a line and in front of the blade, and can smooth the ground. The simulation runs on the server; the client only receives a moved-amount percentage to drive effects.

- **Leveler** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Leveler.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Returns true only if the vehicle type has both the FillUnit and BunkerSiloInteractor specializations. |
| `Leveler.initSpecialization()` | 29 | ✍ Registers the leveler XML schema: node, width, drop widths and offsets, height-check count, smoothing options, fill unit index, occlusion areas, force settings, `ignoreFarmlandState` and the effect paths. |
| `Leveler.registerFunctions(vehicleType: any)` | 76 | ✍ Registers `getIsLevelerPickupNodeActive`, `loadLevelerNodeFromXML` and `onLevelerRaycastCallback` on the vehicle type. |
| `Leveler.registerOverwrittenFunctions(vehicleType: any)` | 84 | ✍ Overrides `getIsAttacherJointControlDampingAllowed` so joint damping depends on the leveler position. |
| `Leveler.registerEventListeners(vehicleType: any)` | 90 | ✍ Subscribes to onLoad, onDelete, onReadUpdateStream, onWriteUpdateStream and onUpdate. |
| `Leveler:onLoad(savegame: table)` | 101 | ✍ Reads leveler settings and all `levelerNode` entries, initialises the moved-amount smoothing state, force node and effects (client). Removes the onUpdate listener if no valid node loaded. Note: the XML default of `maxFillLevelPerMS` is 35 here but 20 in the schema. |
| `Leveler:onDelete()` | 163 | ✍ Deletes the leveler effects. |
| `Leveler:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 174 | ✍ Client side: when the server flagged a change, reads the quantised moved-amount percentage from the stream. |
| `Leveler:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 188 | ✍ Server side: writes a flag and, if the dirty flag is set, the quantised moved-amount percentage for clients. |
| `Leveler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 202 | ✍ Client: starts or stops effects according to the moved-amount percentage. Server: for each node, checks farmland access, picks material up from the height map when moving in the pick-up direction, drops it under and in front of the blade, smooths ground, updates the percentage and applies a drag force. Raises the dirty flag on change. |
| `Leveler:loadLevelerNodeFromXML(levelerNode: table, xmlFile: XMLFile, key: string) → boolean` | 444 | ✍ Loads one leveler node (geometry, drop widths and offsets, occlusion areas, smoothing, fill unit) into the given table and creates a reference-frame transform. Returns false if the node or fill unit is missing. |
| `Leveler:getIsLevelerPickupNodeActive(levelerNode: table) → boolean` | 519 | ✍ Returns true if the vehicle cannot be attached or is currently attached to another vehicle; picking up is active only in that case. |
| `Leveler:getIsAttacherJointControlDampingAllowed(superFunc: any) → boolean` | 526 | ✍ Override: damping is allowed only if the parent allows it and the height map has material at every leveler node position. |
| `Leveler.onLevelerRaycastCallback(levelerNode: integer, hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 557 | ✍ Raycast callback (note: called with the node table, not the vehicle). If the ray ends without hitting a non-terrain object, it registers occlusion areas and drops the remaining fill level in front of the blade, returning the leftover to be picked up later. |

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
