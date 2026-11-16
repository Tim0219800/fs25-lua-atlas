# vehicles/specializations/ConnectedAttributes.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ConnectedAttributes.md)*

Source: `dataS/scripts/vehicles/specializations/ConnectedAttributes.lua` — FS25 1.25.1.0

✍ Specialization that copies values from source nodes (for example a node position, rotation or scale) to target nodes, optionally combining them with sum, average, subtract, multiply or divide. Each vehicle.connectedAttributes.attribute entry declares sources, targets, combine rules, animation or Cylindered prerequisites and update triggers (every frame when isActiveDirty, on animation start/run/stop, or from Cylindered moving parts via connectedAttributeIndices). The source and target type classes (TYPES, TYPES_BY_NAME, COMBINE_OPERATION) are not defined in this dump, which ends with an empty LocalOffset class: their exact contents are UNVERIFIED.

- **LocalOffset** (l.634)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConnectedAttributes.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Always returns true: no other specialization is required. |
| `ConnectedAttributes.initSpecialization()` | 32 | ✍ Registers the XML schema for connectedAttributes.attribute: each type class adds its own source and target paths, and Cylindered movingTool/movingPart entries get a connectedAttributeIndices list through delayed registration. |
| `ConnectedAttributes.registerFunctions(vehicleType: any)` | 85 | ✍ Empty hook, registers no new vehicle functions. |
| `ConnectedAttributes.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Overrides loadExtraDependentParts and updateExtraDependentParts (provided by another specialization, UNVERIFIED which one). |
| `ConnectedAttributes.registerEventListeners(vehicleType: any)` | 97 | ✍ Registers onLoad, onLoadFinished, onUpdate, onUpdateEnd, onPlayAnimation, onUpdateAnimation and onFinishAnimation. |
| `ConnectedAttributes:onLoad(savegame: any)` | 109 | ✍ Parses every attribute from XML: animation triggers, animation-time prerequisites, sources, combine rules and targets, where target values may be scaled (*, /) or offset (+, -) or constant. Invalid entries log XML warnings; an attribute needs at least one source and one target. Unused listeners (update, animation events) are removed afterwards. |
| `ConnectedAttributes:onLoadFinished(savegame: any)` | 384 | ✍ Forces an update of every attribute once, so targets start with the values computed from the sources. |
| `ConnectedAttributes:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 393 | ✍ Each frame, updates the attributes flagged isActiveDirty, skipping those whose maxUpdateDistance is smaller than the vehicle update distance. |
| `ConnectedAttributes:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 405 | ✍ Runs onUpdate once with a very large dt, so dirty attributes are refreshed one last time. |
| `ConnectedAttributes:onPlayAnimation(animationName: any)` | 413 | ✍ When an animation starts, forces an update of each attribute that lists that animation with onStart enabled. |
| `ConnectedAttributes:onUpdateAnimation(animationName: any)` | 429 | ✍ While an animation runs, forces an update of each attribute that lists that animation with onRun enabled. |
| `ConnectedAttributes:onFinishAnimation(animationName: any)` | 445 | ✍ When an animation finishes, forces an update of each attribute that lists that animation with onStop enabled. |
| `ConnectedAttributes.updateAttribute(attribute: any, forceUpdate: any)` | 461 | ✍ Static. Checks the animation prerequisites, reads all sources, evaluates the combine rules (average, sum, subtract, multiply, divide) and, if something changed or forceUpdate is set, writes the scaled values to every target. Divide has no zero check. |
| `ConnectedAttributes:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 544 | ✍ Calls the parent, then reads connectedAttributeIndices on the moving part and stores the list on the entry. Returns false if the parent fails. |
| `ConnectedAttributes:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 559 | ✍ Calls the parent, then updates each attribute whose index is listed on the moving part, ignoring unknown indices. |
| `ConnectedAttributes:updateDebugValues(values: any)` | 575 | ✍ Appends debug rows to the given list: prerequisite results, source data, current named values and target data of every attribute. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `loadExtraDependentParts` | 91 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onLoadFinished` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateEnd` | 101 |
| registerEventListener | `onPlayAnimation` | 102 |
| registerEventListener | `onUpdateAnimation` | 103 |
| registerEventListener | `onFinishAnimation` | 104 |
