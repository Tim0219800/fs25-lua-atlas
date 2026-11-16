# vehicles/specializations/VariableWorkWidth.lua

*[Version française](../../../fr/scripts/vehicles/specializations/VariableWorkWidth.md)*

Source: `dataS/scripts/vehicles/specializations/VariableWorkWidth.lua` — FS25 1.25.1.0

✍ Specialization that lets the player (or the AI) narrow or widen the working width of an implement by switching sections on the left and right side. Sections can deactivate work areas and effects, and section nodes are moved or rotated to match the chosen width. It adds a configuration type `variableWorkWidth`, saves the left/right state in the savegame, syncs it with `VariableWorkWidthStateEvent`, and shows a HUD extension. Note: `onDraw` and `onDelete` listeners are registered but no such functions are defined in this file (UNVERIFIED whether other code provides them).

- **VariableWorkWidth** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `VariableWorkWidth.prerequisitesPresent(specializations: any)` | 22 | ✍ Always returns true: no prerequisites. |
| `VariableWorkWidth.initSpecialization()` | 28 | ✍ Adds the `variableWorkWidth` configuration type, registers the XML paths (sections, section nodes, reference work area, default and AI states, work area `section#index`) and the savegame attributes `leftSide` and `rightSide`. |
| `VariableWorkWidth.registerSectionPaths(schema: any, basePath: any)` | 57 | ✍ Registers the XML paths for sections (side, center flag, width, max width node, effects) and section nodes (min/max translation or rotation, work area index) under the given base path. |
| `VariableWorkWidth.registerEvents(vehicleType: any)` | 77 | ✍ Registers the event `onVariableWorkWidthSectionChanged`, raised each time the sections are recomputed. |
| `VariableWorkWidth.registerFunctions(vehicleType: any)` | 83 | ✍ Adds the public functions (setSectionsActive, updateSections, getVariableWorkWidth, getEffectByNode, and others) to the vehicle type. |
| `VariableWorkWidth.registerOverwrittenFunctions(vehicleType: any)` | 96 | ✍ Overrides `loadWorkAreaFromXML` and `getIsWorkAreaActive` so work areas can be tied to a section. |
| `VariableWorkWidth.registerEventListeners(vehicleType: any)` | 103 | ✍ Subscribes to onPostLoad, read/write stream, register action events, AI start events, onDraw and onDelete. |
| `VariableWorkWidth:onPostLoad(savegame: any)` | 116 | ✍ Loads sections and section nodes from the selected configuration (or the base key), links section effects, computes each section's relative and absolute width from its max-width node, sorts sides by width, reads default/AI states, applies saved states, and creates the HUD extension. Removes listeners that are useless without sections or on a server. |
| `VariableWorkWidth:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 294 | ✍ Writes `leftSide` and `rightSide` section states to the savegame when the vehicle has sections. |
| `VariableWorkWidth:onReadStream(streamId: integer, connection: Connection)` | 306 | ✍ Client join: reads the left and right states (fixed bit count `SEND_NUM_BITS`) and applies them without sending an event. |
| `VariableWorkWidth:onWriteStream(streamId: integer, connection: Connection)` | 316 | ✍ Server side on join: writes the left and right states into the stream. |
| `VariableWorkWidth:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 331 | ✍ Registers the actions VARIABLE_WORK_WIDTH_LEFT, _RIGHT and _TOGGLE when the feature is active, and records whether any of them has a binding so the input help is drawn. |
| `VariableWorkWidth.actionEventWorkWidthLeft(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 355 | ✍ Input callback: changes the left side state by the input value (subtracts it). |
| `VariableWorkWidth.actionEventWorkWidthRight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 362 | ✍ Input callback: changes the right side state by the input value (subtracts it). |
| `VariableWorkWidth.actionEventWorkWidthToggle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 369 | ✍ Input callback: lowers both sides to one step below the smaller current state, wrapping back to the maximum when it falls under the minimum state. |
| `VariableWorkWidth:onAIFieldWorkerStart()` | 383 | ✍ Server only: when the AI field worker starts and `aiKeepCurrentWidth` is false, applies the configured AI left/right states. |
| `VariableWorkWidth:onAIImplementStart()` | 394 | ✍ Server only: same as the field worker start, applies the AI states when the implement starts under AI control. |
| `VariableWorkWidth:setVariableWorkWidthActive(isActive: any)` | 405 | ✍ Enables or disables the feature. On the server, disabling resets both sides to their maximum. Requests an action event refresh. |
| `VariableWorkWidth:setSectionsActive(leftSide: any, rightSide: any, noEventSend: any)` | 420 | ✍ Sets the left and right states (clamped between 0 and the side maximum). If something changed, recomputes sections and sends `VariableWorkWidthStateEvent` unless `noEventSend`. |
| `VariableWorkWidth:setSectionNodePercentage(sectionNodes: any, percentage: any)` | 437 | ✍ Moves/rotates each given section node by linear interpolation between its min and max values (translation, X translation, rotation) at the given 0..1 percentage, then updates the linked work area width. |
| `VariableWorkWidth:updateSections()` | 464 | ✍ Refreshes the active flags of both sides, positions the section nodes from the width of the current section (0 when the side is off) and raises `onVariableWorkWidthSectionChanged`. |
| `VariableWorkWidth:updateSectionStates(sections: any, state: any)` | 481 | ✍ Marks sections up to the given state as active and stops any running effect of sections that became inactive. |
| `VariableWorkWidth:getEffectByNode(node: integer)` | 501 | ✍ Empty hook returning nothing; other specializations that own effects are expected to override it (UNVERIFIED from this file alone). |
| `VariableWorkWidth:getVariableWorkWidth(isLeft: boolean) → number, number, boolean` | 511 | ✍ For the left or right side returns the current absolute width, the max width and whether sections exist. Without sections it returns 1, 1, false. |
| `VariableWorkWidth:getVariableWorkWidthUsage() → number` | 533 | ✍ Returns nil by default, meaning no usage value is shown; other specializations can override it. |
| `VariableWorkWidth:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 539 | ✍ Override: reads the optional `section#index` of the work area, then calls the previous implementation. |
| `VariableWorkWidth:getIsWorkAreaActive(superFunc: any, workArea: any)` | 547 | ✍ Override: a work area linked to an inactive section is inactive; otherwise the previous result applies. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onVariableWorkWidthSectionChanged` | 78 |
| registerFunction | `setVariableWorkWidthActive` | 84 |
| registerFunction | `setSectionsActive` | 85 |
| registerFunction | `setSectionNodePercentage` | 86 |
| registerFunction | `updateSections` | 87 |
| registerFunction | `updateSectionStates` | 88 |
| registerFunction | `getEffectByNode` | 89 |
| registerFunction | `getVariableWorkWidth` | 90 |
| registerFunction | `getVariableWorkWidthUsage` | 91 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 97 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 98 |
| registerEventListener | `onPostLoad` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onRegisterActionEvents` | 107 |
| registerEventListener | `onAIFieldWorkerStart` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |
| registerEventListener | `onDraw` | 110 |
| registerEventListener | `onDelete` | 111 |
