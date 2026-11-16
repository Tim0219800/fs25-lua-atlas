# vehicles/specializations/SlopeCompensation.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SlopeCompensation.md)*

Source: `dataS/scripts/vehicles/specializations/SlopeCompensation.lua` — FS25 1.25.1.0

✍ Specialization that tilts parts of a vehicle to follow the slope, either from the height difference between two groups of wheels (raycasts under the wheels) or from a reference node angle. It requires Wheels, adds a "slopeCompensation" configuration type, drives an animation, a rotation node and/or animation parts per compensation node, and saves the last angle. It also registers an animation value type "slopeCompensationLevel". Note: `updateSlopeCompensationAngle` is registered as a vehicle function and called every update, but no function of that name is defined in this file (its body is absent from the dump); where it is defined is UNVERIFIED.

- **SlopeCompensation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SlopeCompensation.prerequisitesPresent(specializations: any)` | 19 | ✍ Returns true only if the vehicle type has the Wheels specialization. |
| `SlopeCompensation.initSpecialization()` | 25 | ✍ Registers the "slopeCompensation" configuration type, the XML schema (base and per-configuration), the delayed AnimatedVehicle part attributes (`slopeCompensationNodeIndex`, start/end level) and the savegame `lastAngle` per compensation node. |
| `SlopeCompensation.registerXMLPaths(schema: any, basePath: any)` | 48 | ✍ Declares the schema under a base path: update threshold, high update frequency flag, and each `compensationNode` (wheels or wheel nodes, angle limits, speed, inversion, heights, animation name, reference and rotation nodes with axes, animation parts with min/max rotation and translation). |
| `SlopeCompensation.registerFunctions(vehicleType: any)` | 88 | ✍ Registers `loadSlopeCompensationWheels`, `loadSlopeCompensationNodeFromXML`, `getSlopeCompensationAngle`, `getSlopeCompensationAngleScale`, `updateSlopeCompensationAngle` and `setSlopeCompensationNodeAngle`. |
| `SlopeCompensation.registerEventListeners(vehicleType: any)` | 99 | ✍ Subscribes to onLoad, onLoadFinished, onUpdate, onUpdateTick and onRegisterAnimationValueTypes. |
| `SlopeCompensation:onLoad(savegame: any)` | 109 | ✍ Reads the threshold and update frequency, loads the compensation nodes from the base XML and from the selected configuration (which can override threshold and frequency). Removes unused listeners: all if no node, onUpdateTick if high frequency, otherwise onUpdate. |
| `SlopeCompensation:onLoadFinished(savegame: any)` | 154 | ✍ Primes each node's animation by stepping it through times 0, 1 and 0.5, then restores the saved angle of each node from the savegame, or sets 0 for a new vehicle. |
| `SlopeCompensation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 180 | ✍ Saves the last applied angle of each compensation node. |
| `SlopeCompensation:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 189 | ✍ For each node, clamps the detected angle to its limits, scales it, optionally inverts it, updates the target when the change exceeds the threshold, moves the current angle toward the target at the node speed (with an easing factor) and applies it, then calls `updateSlopeCompensationAngle`. |
| `SlopeCompensation:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 218 | ✍ Runs the same logic as onUpdate (used when high update frequency is off). |
| `SlopeCompensation:onRegisterAnimationValueTypes()` | 224 | ✍ Registers the animation value type "slopeCompensationLevel" (float): it reads or writes the `compensationLevel` of the node chosen by `slopeCompensationNodeIndex` and reapplies the current angle when it changes. |
| `SlopeCompensation:loadSlopeCompensationWheels(xmlFile: any, key: any, indexName: any, nodeName: any, nodesName: any)` | 265 | ✍ Resolves one side's wheels from a wheel index, a wheel node and/or a list of wheel nodes. Returns true, the list of wheel drive nodes and the largest wheel radius, or false with a warning if a wheel is not found or none is defined. |
| `SlopeCompensation:loadSlopeCompensationNodeFromXML(compensationNode: any, xmlFile: any, key: any)` | 316 | ✍ Loads one compensation node: if both wheel groups resolve, sets up raycast callbacks that compute the ground angle between the two groups (static bodies only); also reads reference and rotation nodes, angle limits (swapped and inverted if min is above max), speed, animation, heights and animation parts. Always returns true. |
| `SlopeCompensation:getSlopeCompensationAngle(compensationNode: any)` | 438 | ✍ Returns the last detected slope angle of the given compensation node. |
| `SlopeCompensation:getSlopeCompensationAngleScale(compensationNode: any)` | 444 | ✍ Returns 1 by default; meant to be overridden to scale the compensation of a node. |
| `SlopeCompensation:setSlopeCompensationNodeAngle(compensationNode: any, angle: any)` | 484 | ✍ Applies an angle to a node: maps it to a 0..1 position between min and max, drives the animation, sets the rotation node on its axis, and moves animation parts (rotation and/or translation, side-dependent, blended with the compensation level). Stores it as the node's last angle. |
| `SlopeCompensation:updateDebugValues(values: any)` | 542 | ✍ Debug helper: adds one line per compensation node with its clamped detected angle in degrees. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadSlopeCompensationWheels` | 89 |
| registerFunction | `loadSlopeCompensationNodeFromXML` | 90 |
| registerFunction | `getSlopeCompensationAngle` | 91 |
| registerFunction | `getSlopeCompensationAngleScale` | 92 |
| registerFunction | `updateSlopeCompensationAngle` | 93 |
| registerFunction | `setSlopeCompensationNodeAngle` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onLoadFinished` | 101 |
| registerEventListener | `onUpdate` | 102 |
| registerEventListener | `onUpdateTick` | 103 |
| registerEventListener | `onRegisterAnimationValueTypes` | 104 |
