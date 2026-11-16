# vehicles/specializations/WindBending.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WindBending.md)*

Source: `dataS/scripts/vehicles/specializations/WindBending.lua` — FS25 1.25.1.0

✍ Client-side specialization that makes foliage-like shapes (e.g. crop on a header or load) bend according to vehicle motion, by feeding the `directionBend` shader parameter. It has no prerequisites and registers no functions of its own; it only reacts to onLoad and onUpdate. Nodes are declared under `vehicle.windBending.windBendingNodes.windBendingNode`.

- **WindBending** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WindBending.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: this specialization has no prerequisite specializations. |
| `WindBending.initSpecialization()` | 23 | ✍ Registers the XML schema paths of a wind bending node: `#node`, `#decalNode`, `#speedReferenceNode`, `#maxBending` (meters, default 0.15), `#maxBendingNeg` and `#maxBendingSpeed` (km/h, default 20). |
| `WindBending.registerFunctions(vehicleType: any)` | 39 | ✍ Empty: the specialization adds no new vehicle functions. |
| `WindBending.registerEventListeners(vehicleType: any)` | 44 | ✍ Subscribes the vehicle type to onLoad and onUpdate. |
| `WindBending:onLoad(savegame: table)` | 52 | ✍ Client only: reads each configured node, keeping it only if it is a shape with the `directionBend` shader parameter (otherwise logs an XML error). Removes the onUpdate listener on servers or when no valid node exists. |
| `WindBending:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 94 | ✍ For each node, derives a movement direction from the reference node's position change since the last call, then sets `directionBend` through `g_animationManager` with an amount scaled by vehicle speed over `maxBendingSpeed`. Uses the negative maximum when moving in reverse. The decal node gets the same values. Note: the speed is computed with a fixed factor of 10, not with dt. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 45 |
| registerEventListener | `onUpdate` | 46 |
