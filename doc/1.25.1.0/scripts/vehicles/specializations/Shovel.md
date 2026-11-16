# vehicles/specializations/Shovel.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Shovel.md)*

Source: `dataS/scripts/vehicles/specializations/Shovel.lua` — FS25 1.25.1.0

✍ Specialization for shovels and buckets that scoop loose material (height-map fill types) from the ground into a fill unit and can tip it out by tilting. It requires FillUnit, FillVolume, Dischargeable and BunkerSiloInteractor. The pickup runs on the server in onUpdateTick over one or more `vehicle.shovel.shovelNode` entries; the loading fill type is synchronised to clients through the update stream so they can play the fill effect. Discharge is driven by the tilt angle of a `dischargeInfo` node instead of the normal toggle.

- **Shovel** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Shovel.prerequisitesPresent(specializations: any)` | 17 | ✍ Returns true only if the vehicle type has FillUnit, FillVolume, Dischargeable and BunkerSiloInteractor. |
| `Shovel.initSpecialization()` | 23 | ✍ Declares the XML schema: global flags (`ignoreFillUnitFillType`, `useSpeedLimit`), the shovelNode attributes (node, fill unit, load info, width, length, offsets, movement and angle conditions, liters per second, smoothing), the `dischargeInfo` node and angles, and the fill effects. |
| `Shovel.registerFunctions(vehicleType: any)` | 61 | ✍ Registers `loadShovelNode`, `getShovelNodeIsActive`, `getCanShovelAtPosition`, `getShovelTipFactor` and `getIsShovelEffectState`. |
| `Shovel.registerOverwrittenFunctions(vehicleType: any)` | 71 | ✍ Overrides the discharge hooks (`getIsDischargeNodeActive`, `getDischargeNodeEmptyFactor`, `handleDischarge`, `handleDischargeOnEmpty`, `handleDischargeRaycast`, `getCanToggleDischargeToObject`, `getCanToggleDischargeToGround`) plus `getWearMultiplier` and `doCheckSpeedLimit`. |
| `Shovel.registerEventListeners(vehicleType: any)` | 85 | ✍ Subscribes to onLoad, onReadStream, onWriteStream, onReadUpdateStream, onWriteUpdateStream, onDelete, onUpdateTick and onFillUnitFillLevelChanged. |
| `Shovel:onLoad(savegame: any)` | 98 | ✍ Reads the global flags, every `shovelNode`, the `dischargeInfo` (node plus min/max speed angles, which are mandatory when the node is set) and the client fill effects, and allocates the dirty flag. Removes the network and tick listeners if no shovel node loaded. Note: returns false when the angles are missing, before the effects and dirty flag are set up. |
| `Shovel:onDelete()` | 166 | ✍ Deletes the fill effects. |
| `Shovel:onReadStream(streamId: any, connection: any)` | 173 | ✍ Client on join: reads the current loading fill type from the stream. |
| `Shovel:onWriteStream(streamId: any, connection: any)` | 180 | ✍ Server on join: writes the current loading fill type to the stream. |
| `Shovel:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 187 | ✍ Client side: when the server flagged a change, reads the new loading fill type. |
| `Shovel:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 199 | ✍ Server side: if the effect dirty flag is set in the mask, writes true and the loading fill type; otherwise writes false. |
| `Shovel:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 211 | ✍ Server: for each active shovel node, scoops material along the node line from the density height map into the fill unit (limited by free capacity, liters per second and farmland access), may raise capacity temporarily, notifies the bunker silo, resets the fill level for inactive nodes with `resetFillLevel`, and smooths the ground when moving backward. Tracks the loading fill type with a 500 ms hold and raises the dirty flag on change. Client: starts or stops the fill effects. |
| `Shovel:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 318 | ✍ Server: once the fill level falls back to the default capacity, restores the default capacity of a fill unit whose capacity the shovel had increased. |
| `Shovel:loadShovelNode(xmlFile: any, key: any, shovelNode: any)` | 338 | ✍ Reads one shovel node (node, fill unit, load info, size, offsets, movement, liters per second converted to per millisecond, max pickup angle, attacher requirement, reset/ignore flags, smoothing settings). Returns false with an XML warning if the node is missing. |
| `Shovel:getShovelNodeIsActive(shovelNode: any)` | 374 | ✍ Returns whether the node may pick up now: moving forward along its local z (if movement is required, updating its last position), pickup angle not above the maximum, and an attacher vehicle present when required. |
| `Shovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 406 | ✍ For the discharge node tied to the shovel discharge info, returns false while the tip factor is 0; otherwise defers to the parent. |
| `Shovel:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 423 | ✍ Multiplies the parent's empty factor by the tip factor for the shovel's discharge node, so tipping further empties faster. |
| `Shovel:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 440 | ✍ Skips the parent handling for the shovel's own discharge node when a discharge info node exists; other nodes use the parent. |
| `Shovel:handleDischargeOnEmpty(superFunc: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 450 | ✍ Skips the parent handling entirely when a discharge info node is defined. |
| `Shovel:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 458 | ✍ For the shovel discharge node: sets the discharge state to OBJECT when the raycast hits an object that accepts the fill type and has free capacity, otherwise back to OFF; with no object, sets GROUND if tipped, filled, allowed on ground, owned land and valid position, else shows warnings for the active player. Other nodes use the parent. |
| `Shovel:getCanToggleDischargeToObject(superFunc: any)` | 499 | ✍ Returns false when a discharge info node exists (tilt controls discharge); otherwise defers to the parent. |
| `Shovel:getCanToggleDischargeToGround(superFunc: any)` | 509 | ✍ Returns false when a discharge info node exists; otherwise defers to the parent. |
| `Shovel:getShovelTipFactor()` | 519 | ✍ Returns 0 to 1 from the angle between the discharge info node's z axis and the world vertical, interpolated between `minSpeedAngle` and `maxSpeedAngle` (radians); returns 0 below the minimum or without a node. |
| `Shovel:getIsShovelEffectState() → boolean` | 537 | ✍ Returns whether a fill type is currently being loaded, and that fill type (FillType.UNKNOWN if none). |
| `Shovel:getWearMultiplier(superFunc: any) → number` | 545 | ✍ Adds the work wear multiplier to the parent value while material is being loaded. |
| `Shovel:doCheckSpeedLimit(superFunc: any) → boolean` | 559 | ✍ Returns true if the parent does, or if `useSpeedLimit` is set and the vehicle is turned on (or cannot be turned on). |
| `Shovel:getCanShovelAtPosition(shovelNode: any)` | 565 | ✍ Returns whether the node may pick up at its current position: always true if farmland state is ignored or the line is in a free access area, otherwise both ends of the node width must be on land the active farm can access. Returns false for a nil node. |
| `Shovel:updateDebugValues(values: any)` | 593 | ✍ Debug helper: appends the discharge node angle, min and max speed angles (in degrees) and the resulting tip factor (or an out-of-range text) to the given values table. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadShovelNode` | 62 |
| registerFunction | `getShovelNodeIsActive` | 63 |
| registerFunction | `getCanShovelAtPosition` | 64 |
| registerFunction | `getShovelTipFactor` | 65 |
| registerFunction | `getIsShovelEffectState` | 66 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 72 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 73 |
| registerOverwrittenFunction | `handleDischarge` | 74 |
| registerOverwrittenFunction | `handleDischargeOnEmpty` | 75 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 76 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 77 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 78 |
| registerOverwrittenFunction | `getWearMultiplier` | 79 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 80 |
| registerEventListener | `onLoad` | 86 |
| registerEventListener | `onReadStream` | 87 |
| registerEventListener | `onWriteStream` | 88 |
| registerEventListener | `onReadUpdateStream` | 89 |
| registerEventListener | `onWriteUpdateStream` | 90 |
| registerEventListener | `onDelete` | 91 |
| registerEventListener | `onUpdateTick` | 92 |
| registerEventListener | `onFillUnitFillLevelChanged` | 93 |
