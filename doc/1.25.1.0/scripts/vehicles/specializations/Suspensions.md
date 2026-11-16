# vehicles/specializations/Suspensions.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Suspensions.md)*

Source: `dataS/scripts/vehicles/specializations/Suspensions.lua` — FS25 1.25.1.0

✍ Specialization for non-wheel suspensions such as cabin, seat or driver character, with no prerequisites. Each suspension node is a client-side spring/damper simulation, per axis, driven by the acceleration of a reference point on the parent component and applied as a rotation or translation to a node. Nodes are read from vehicle.suspensions.suspension in the vehicle XML and are only updated within a configurable distance.

- **Suspensions** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Suspensions.prerequisitesPresent(specializations: any)` | 19 | ✍ Always returns true: no prerequisite specialization. |
| `Suspensions.initSpecialization()` | 25 | ✍ Registers the XML schema of a suspension node (node, character torso, weight, rotation/translation limits, velocity difference, X/Y/Z spring parameters, inversion, server-only) and vehicle.suspensions#maxUpdateDistance. |
| `Suspensions.registerFunctions(vehicleType: any)` | 53 | ✍ Registers loadSuspensionNodeFromXML, getSuspensionNodeFromIndex, getIsSuspensionNodeActive and setSuspensionNodeCharacter. |
| `Suspensions.registerEventListeners(vehicleType: any)` | 62 | ✍ Subscribes to onLoad, onUpdate, onEnterVehicle and onVehicleCharacterChanged. |
| `Suspensions:onLoad(savegame: any)` | 71 | ✍ Client only: loads every suspension node (skipping server-only ones on pure clients), reads the max update distance and flags suspensions available. Disabled with a warning where the platform forbids suspension nodes. Removes update/enter/character listeners when none are available. |
| `Suspensions:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 114 | ✍ For vehicles within the max update distance, computes the acceleration of each node's reference point, then integrates a spring/damper per axis with an implicit Euler step (physics dt on the server, frame dt otherwise), clamps to the limits and applies rotation or translation. |
| `Suspensions:loadSuspensionNodeFromXML(xmlFile: any, key: any, suspensionNode: any)` | 240 | ✍ Fills a suspension node table from XML: node and parent component, weight, limits, spring parameters (multiplied by 1000), flags. Returns false if the node is unusable or has no rotation or translation limits. |
| `Suspensions:getSuspensionNodeFromIndex(suspensionIndex: any)` | 314 | ✍ Returns the suspension node table at the given index, or nil if no suspension is available. |
| `Suspensions:getIsSuspensionNodeActive(suspensionNode: any)` | 325 | ✍ Returns true if the suspension node has both a node and a parent component. |
| `Suspensions:setSuspensionNodeCharacter(suspensionNode: any, character: any)` | 331 | ✍ For nodes using the character torso, points the node to the character model's third-person suspension node and recomputes its parent component and reference offset. |
| `Suspensions:onEnterVehicle(isControlling: any)` | 347 | ✍ When someone enters the vehicle, binds the vehicle character (if any) to every suspension node. |
| `Suspensions:onVehicleCharacterChanged(character: any)` | 361 | ✍ For character-torso nodes, rebinds the new character or clears the node when the character is removed. |
| `Suspensions.subCollisionErrorFunction(collisionNode: any, xmlFile: any, nodeName: any)` | 376 | ✍ Debug-time check callback: logs an XML error when a collision shape is a child of a suspension node, which can keep the vehicle from sleeping. It is only referenced from a debug-only block. |
| `Suspensions:getSuspensionModfier()` | 384 | ✍ Returns the current vertical translation of the seat suspension (node 2 if it is a non-rotational, non-torso node, else node 1), or 0 if rotational or missing. Note: the name is spelled 'Modfier' in the source. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadSuspensionNodeFromXML` | 54 |
| registerFunction | `getSuspensionNodeFromIndex` | 55 |
| registerFunction | `getIsSuspensionNodeActive` | 56 |
| registerFunction | `setSuspensionNodeCharacter` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onUpdate` | 64 |
| registerEventListener | `onEnterVehicle` | 65 |
| registerEventListener | `onVehicleCharacterChanged` | 66 |
