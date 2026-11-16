# vehicles/specializations/Ropes.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Ropes.md)*

Source: `dataS/scripts/vehicles/specializations/Ropes.lua` — FS25 1.25.1.0

✍ Specialization for vehicles with visual ropes drawn by a shader on a base node. On the client it reads `vehicle.ropes.rope` entries and each frame pushes shader parameters (cv0, cv2, cv3, cv4) so the rope stretches from the base node to the target node, with optional parameter adjusters driven by node rotation or translation. It has no prerequisites and does nothing on a dedicated server.

- **Ropes** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Ropes.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `Ropes.initSpecialization()` | 23 | ✍ Declares the `vehicle.ropes.rope` XML schema: base/target nodes and parameters, plus the `baseParameterAdjuster` and `targetParameterAdjuster` children (node, rotation or translation axis and range, min/max target parameters). |
| `Ropes.registerFunctions(vehicleType: any)` | 53 | ✍ Registers `loadAdjusterNode`, `updateRopes` and `updateAdjusterNodes` on the vehicle type. |
| `Ropes.registerEventListeners(vehicleType: any)` | 61 | ✍ Subscribes to onLoad, onLoadFinished and onPostUpdate. |
| `Ropes:onLoad(savegame: table)` | 70 | ✍ Client only: reads each rope (skipping entries without base/target parameters, with a warning), sets the initial shader parameters on the base node and loads the adjusters. Removes the load-finished and post-update listeners if not client or no rope was loaded. Note: the adjuster keys are built without a dot (`ropeKey .. "baseParameterAdjuster"`), which seems to prevent them from being read. |
| `Ropes:onLoadFinished(savegame: table)` | 127 | ✍ Forces a full rope refresh by calling `updateRopes(9999)` once loading is complete. |
| `Ropes:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 136 | ✍ Legacy entry point kept for backwards compatibility; it simply calls `Ropes.onPostUpdate` (not registered as a listener in this file). |
| `Ropes:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 146 | ✍ Calls `updateRopes(dt)` every frame to refresh the rope shader parameters. |
| `Ropes:loadAdjusterNode(adjusterNode: any, xmlFile: any, key: any)` | 152 | ✍ Loads one adjuster (node, rotation or translation axis and range, min/max target parameters). Returns false with an XML warning if the node or either min/max parameter set is missing. |
| `Ropes:updateRopes(dt: any)` | 187 | ✍ For each rope, sets shader parameters cv0 (base plus adjuster offset), cv2, cv3 (target position in base space) and cv4 (target parameters plus adjuster offset in base space). The `dt` argument is not used. |
| `Ropes:updateAdjusterNodes(adjusterNodes: any)` | 205 | ✍ Sums the contributions of a list of adjusters: each maps its node's rotation or translation on one axis to 0..1 over its range and interpolates between its min and max target parameters. Returns the summed x, y, z. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadAdjusterNode` | 54 |
| registerFunction | `updateRopes` | 55 |
| registerFunction | `updateAdjusterNodes` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onLoadFinished` | 63 |
| registerEventListener | `onPostUpdate` | 64 |
