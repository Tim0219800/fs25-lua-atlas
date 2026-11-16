# vehicles/specializations/RidgeMarker.lua

*[Version française](../../../fr/scripts/vehicles/specializations/RidgeMarker.md)*

Source: `dataS/scripts/vehicles/specializations/RidgeMarker.lua` — FS25 1.25.1.0

✍ Specialization for implements that carry folding ridge markers (marker arms that scratch a guide line in the soil). It requires AnimatedVehicle and WorkArea, adds a "ridgeMarker" configuration type and a "ridgemarker" work area type, and cycles through marker states with an input action. The state is saved, streamed to joining clients and synchronised through RidgeMarkerSetStateEvent; the soil marking is done on the density map.

- **RidgeMarker** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `RidgeMarker.initSpecialization()` | 21 | ✍ Registers the "ridgeMarker" configuration type and the "ridgemarker" work area type, then declares the vehicle XML schema paths (including per-configuration ones, the work area child node and the speed rotating part attributes) and the savegame `ridgeMarker#state` attribute. |
| `RidgeMarker.registerRidgeMarkerXMLPaths(schema: any, baseKey: any)` | 47 | ✍ Declares the XML schema entries under a base key: input button, the list of `marker` entries (animation, work limits, lifted animation time, work area index), fold limits, fold disable direction, only-active-when-lowered flag and direction node. |
| `RidgeMarker.registerRidgeMarkerAreaXMLPaths(schema: any, baseKey: any)` | 65 | ✍ Declares the `ridgeMarkerArea` schema entries of a work area: the node around which the marking area is built, the area size (default 0.25) and the test area offset along +z (default 0.2). |
| `RidgeMarker.prerequisitesPresent(specializations: table) → boolean` | 75 | ✍ Returns true only if the vehicle type has both the AnimatedVehicle and WorkArea specializations. |
| `RidgeMarker.registerFunctions(vehicleType: any)` | 81 | ✍ Registers the specialization functions on the vehicle type: `loadRidgeMarker`, `setRidgeMarkerState`, `canFoldRidgeMarker` and `processRidgeMarkerArea`. |
| `RidgeMarker.registerOverwrittenFunctions(vehicleType: any)` | 90 | ✍ Overrides `loadWorkAreaFromXML`, `getIsWorkAreaActive`, `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive` and `getCanBeSelected` on the vehicle type. |
| `RidgeMarker.registerEventListeners(vehicleType: any)` | 100 | ✍ Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdateTick, onRegisterActionEvents, onSetLowered, onFoldStateChanged and onAIImplementStart. |
| `RidgeMarker:onLoad(savegame: table)` | 115 | ✍ Picks the ridge marker configuration (falls back to `vehicle.ridgeMarker`), reads the input action, the `marker` entries (capped by MAX_NUM_RIDGEMARKERS - 1), fold limits and direction node, and sets state 0. On non-clients it removes the onUpdateTick listener. |
| `RidgeMarker:onPostLoad(savegame: any)` | 173 | ✍ When loading a savegame with markers defined, restores the saved state and jumps the matching animation to its end. |
| `RidgeMarker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 | ✍ Writes the current ridge marker state to the savegame, only if the vehicle has at least one marker. |
| `RidgeMarker:onReadStream(streamId: integer, connection: Connection)` | 199 | ✍ Client side on join: reads the ridge marker state from the stream, applies it without sending an event and fast-forwards the animation if the state is not 0. |
| `RidgeMarker:onWriteStream(streamId: integer, connection: Connection)` | 214 | ✍ Server side on join: writes the current ridge marker state to the stream when markers exist. |
| `RidgeMarker:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 223 | ✍ Client-only tick that refreshes the visibility of the toggle action event. |
| `RidgeMarker:loadRidgeMarker(xmlFile: any, key: any, ridgeMarker: any)` | 229 | ✍ Reads one `marker` entry (animation name, min/max work limits, lifted animation time, work area index). Returns false with an XML warning if `workAreaIndex` is missing. |
| `RidgeMarker:setRidgeMarkerState(state: integer, noEventSend: boolean)` | 249 | ✍ Switches the active marker: sends RidgeMarkerSetStateEvent, folds the previous marker's animation backwards, then unfolds the new one (stopping at the lifted time if the tool is raised). State 0 means all folded. |
| `RidgeMarker:canFoldRidgeMarker(state: integer) → boolean` | 279 | ✍ Returns whether the given state may be selected, based on the fold animation time being inside the configured limits and on the disabled fold direction. Used by the toggle and by the action text visibility. |
| `RidgeMarker:processRidgeMarkerArea(workArea: any, dt: any)` | 299 | ✍ Work area callback: if the test node lies on a field ground type, erases tire tracks and applies a plow or cultivator density map update on the marker area (cultivator if the ground is plowed). Clients far away skip the density update. Returns 0, 0. |
| `RidgeMarker:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 351 | ✍ Overrides work area loading: builds start/width/height/test transform nodes around `ridgeMarkerArea#node`, calls the parent, and turns a DEFAULT work area into RIDGEMARKER type when the node exists. Warns if a RIDGEMARKER area has no node. |
| `RidgeMarker:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 403 | ✍ Extends speed rotating part loading with the `ridgeMarkerAnim` name and `ridgeMarkerAnimTimeMax` (default 0.99) attributes. |
| `RidgeMarker:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 418 | ✍ Returns false while the linked ridge marker animation has not reached its max time (marker not fully unfolded); otherwise defers to the parent. |
| `RidgeMarker:getCanBeSelected(superFunc: any)` | 428 | ✍ Always returns true, so the implement stays selectable. |
| `RidgeMarker:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 436 | ✍ For RIDGEMARKER work areas, returns false if there are no markers, if the marker animation is outside its min/max work limits, or if it must be lowered and is not; otherwise defers to the parent. |
| `RidgeMarker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 463 | ✍ Client side: registers the powered action event that toggles ridge markers (text `action_toggleRidgeMarker`) when active for input and markers exist. |
| `RidgeMarker:onSetLowered(lowered: boolean)` | 479 | ✍ Adjusts markers that define a lifted animation time: when lowered, resumes the animation if it is parked at that time; when raised, plays it back down to that time if it is further unfolded. |
| `RidgeMarker:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 507 | ✍ Resets the ridge marker state to 0 (no event sent) when the implement starts folding in a positive direction and is not moving to the middle position. |
| `RidgeMarker:onAIImplementStart()` | 515 | ✍ Resets the ridge marker state to 0 (no event sent) when an AI job starts with this implement. |
| `RidgeMarker.actionEventToggleRidgeMarkers(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 521 | ✍ Input callback: computes the next state (cycling through 0..numMarkers) and applies it with `setRidgeMarkerState` if `canFoldRidgeMarker` allows it. |
| `RidgeMarker.updateActionEvents(self: any)` | 532 | ✍ Shows or hides the toggle action depending on whether markers exist and the next state may be selected. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadRidgeMarker` | 82 |
| registerFunction | `setRidgeMarkerState` | 83 |
| registerFunction | `canFoldRidgeMarker` | 84 |
| registerFunction | `processRidgeMarkerArea` | 85 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 91 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 92 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 93 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 94 |
| registerOverwrittenFunction | `getCanBeSelected` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onPostLoad` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onUpdateTick` | 105 |
| registerEventListener | `onRegisterActionEvents` | 106 |
| registerEventListener | `onSetLowered` | 107 |
| registerEventListener | `onFoldStateChanged` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |
