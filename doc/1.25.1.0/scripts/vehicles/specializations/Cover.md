# vehicles/specializations/Cover.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Cover.md)*

Source: `dataS/scripts/vehicles/specializations/Cover.lua` — FS25 1.25.1.0

✍ Specialization adding one or several animated covers (tarps) to a vehicle, tied to fill units. A cover has a numbered state (0 = all closed, N = cover N open), toggled by the player, opened automatically while tipping or when a fill trigger is in range, and synchronized through SetCoverStateEvent. Requires AnimatedVehicle; loads its covers from the 'cover' configuration, saves the state per vehicle, and also gates pipe state changes and some tool types.

- **Cover** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Cover.prerequisitesPresent(specializations: any)` | 21 | ✍ Returns true only if the vehicle type has the AnimatedVehicle specialization, which the cover animations rely on. |
| `Cover.initSpecialization()` | 27 | ✍ Registers the 'cover' vehicle configuration type and the XML schema entries for cover animations, fill unit indices, blocked tool types, texts, pipe cover limits, plus the savegame key for the cover state. |
| `Cover.registerFunctions(vehicleType: any)` | 62 | ✍ Registers the cover functions on the vehicle type: XML loading, state change and permission checks, animation playback and lookup of a cover by fill unit. |
| `Cover.registerOverwrittenFunctions(vehicleType: any)` | 73 | ✍ Registers overrides of fill unit tool support, selection, pipe loading and pipe state permission, the AI loading/discharge hooks, and the fill-unit-in-trigger-range callback. |
| `Cover.registerEventListeners(vehicleType: any)` | 86 | ✍ Subscribes the specialization to load, post-load, stream read/write, update, action event registration, tipping, back door and fill trigger events. |
| `Cover:onLoad(savegame: any)` | 101 | ✍ Reads the covers of the selected 'cover' configuration, builds the fill-unit-to-covers map, loads options and texts, and removes the update/network/input listeners when the vehicle has no valid cover. |
| `Cover:onPostLoad(savegame: any)` | 165 | ✍ Restores the cover state from the savegame, or from the 'openOnBuy' flag for a new vehicle, applies it and fast-forwards all pending cover animations to their end so the visuals are immediately correct. |
| `Cover:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 197 | ✍ Writes the current cover state to the savegame when the vehicle has covers. |
| `Cover:onReadStream(streamId: any, connection: any)` | 207 | ✍ Client side on join: reads the cover state from the stream, applies it without sending an event and completes the animations instantly. |
| `Cover:onWriteStream(streamId: any, connection: any)` | 224 | ✍ Server side: writes the current cover state into the stream for a joining client. |
| `Cover:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 232 | ✍ Drives the queue of cover animations (replaces a repeated animation, starts the next one when the current ends). If 'closeCoverIfNotAllowed' is set, closes the cover when the next state is not allowed. |
| `Cover:loadCoverFromXML(xmlFile: any, key: any, cover: any)` | 275 | ✍ Loads one cover entry into the given table (animations, start/stop times, open on buy, tip and trigger behaviour, fill unit indices, blocked tool types). Returns false with a warning if the open animation or the fill unit indices are missing. |
| `Cover:setCoverState(state: any, noEventSend: any)` | 314 | ✍ Changes the cover state (0 closes all). Sends SetCoverStateEvent unless noEventSend, queues the close animation of the previous cover and the open animation of the new one, then refreshes the action text. Ignored if the state is invalid or unchanged. |
| `Cover:playCoverAnimation(animation: any)` | 357 | ✍ Plays a queued cover animation entry: optionally jumps to its start time, sets the stop time and plays it forward or backward depending on where the animation currently is. |
| `Cover:getCoverByFillUnitIndex(fillUnitIndex: any)` | 369 | ✍ Returns the first cover assigned to the given fill unit index, or nil if none. |
| `Cover:getIsNextCoverStateAllowed(nextState: any)` | 380 | ✍ Default permission check: a state change is allowed unless more than one animation is already queued. Meant to be overridden by other specializations. |
| `Cover:getIsNextCoverStateAllowedWarning(nextState: any)` | 391 | ✍ Returns the warning text to show when a state change is refused; the default returns nil (no warning). Hook for overrides. |
| `Cover:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 397 | ✍ Returns false for a tool type listed in the cover's blocked tool types while that fill unit's cover is not open; otherwise defers to the parent implementation. |
| `Cover:getCanBeSelected(superFunc: any)` | 425 | ✍ Always returns true, so a vehicle with this specialization can be selected. |
| `Cover:loadPipeNodes(superFunc: any, pipeNodes: any, xmlFile: any, baseKey: any)` | 431 | ✍ After the parent loads pipe nodes, reads the min and max cover state allowed for pipe changes from 'vehicle.pipe' (max defaults to the number of covers) and stores them in the pipe spec. |
| `Cover:getIsPipeStateChangeAllowed(superFunc: any, nextPipeState: any, ...: any)` | 441 | ✍ Refuses a pipe state change when the current cover state lies outside the configured min/max range, in addition to the parent's checks. |
| `Cover:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 457 | ✍ Client only: registers the TOGGLE_COVER input (falling back to IMPLEMENT_EXTRA4 if unavailable) when the vehicle is active for input, and sets its text. |
| `Cover:onStartTipping(tipSide: any)` | 476 | ✍ When 'openCoverWhileTipping' is enabled, opens the cover of the fill unit belonging to the tip side's discharge node, without sending an event. |
| `Cover:onOpenBackDoor(tipSide: any)` | 492 | ✍ When 'openCoverWhileTipping' is enabled, opens the cover matching the tip side's discharge fill unit as the back door opens. Same logic as onStartTipping. |
| `Cover:finishedAIDischarge(superFunc: any)` | 508 | ✍ Closes all covers once an AI discharge ends, then calls the parent. |
| `Cover:aiPrepareLoading(superFunc: any, fillUnitIndex: any, task: any)` | 519 | ✍ Opens the cover of the fill unit the AI is about to load, then calls the parent. |
| `Cover:aiFinishLoading(superFunc: any, fillUnitIndex: any, task: any)` | 530 | ✍ Closes all covers once AI loading is finished, then calls the parent. |
| `Cover:setFillUnitInTriggerRange(superFunc: any, fillUnitIndex: any, isInRange: any)` | 541 | ✍ After the parent, auto-opens the fill unit's cover when it enters a trigger range (if 'autoReactToTrigger' and the change is allowed), and closes it again on leaving if it was opened automatically. |
| `Cover:onFillUnitTriggerChanged(fillTrigger: any, fillTypeIndex: any, fillUnitIndex: any, numTriggers: any)` | 570 | ✍ When a fill trigger changes for a fill unit with covers, opens its cover automatically if auto reaction is enabled and the change is allowed, and remembers it was set automatically. |
| `Cover:onRemovedFillUnitTrigger(numTriggers: any)` | 589 | ✍ When the last fill trigger is removed, closes the cover if it had been opened automatically and auto reaction is enabled. |
| `Cover.updateActionText(self: any)` | 602 | ✍ Updates the toggle action label: open text at state 0, close text at the last state, next-cover text in between. Does nothing if no action event is registered. |
| `Cover.actionEventToggleCover(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 621 | ✍ Input callback: cycles to the next state (wrapping to 0) if allowed, and clears the automatic flag; otherwise shows the blinking warning returned by getIsNextCoverStateAllowedWarning, if any. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadCoverFromXML` | 63 |
| registerFunction | `getIsNextCoverStateAllowed` | 64 |
| registerFunction | `getIsNextCoverStateAllowedWarning` | 65 |
| registerFunction | `setCoverState` | 66 |
| registerFunction | `playCoverAnimation` | 67 |
| registerFunction | `getCoverByFillUnitIndex` | 68 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 74 |
| registerOverwrittenFunction | `getCanBeSelected` | 75 |
| registerOverwrittenFunction | `loadPipeNodes` | 76 |
| registerOverwrittenFunction | `getIsPipeStateChangeAllowed` | 77 |
| registerOverwrittenFunction | `aiPrepareLoading` | 78 |
| registerOverwrittenFunction | `aiFinishLoading` | 79 |
| registerOverwrittenFunction | `finishedAIDischarge` | 80 |
| registerOverwrittenFunction | `setFillUnitInTriggerRange` | 81 |
| registerEventListener | `onLoad` | 87 |
| registerEventListener | `onPostLoad` | 88 |
| registerEventListener | `onReadStream` | 89 |
| registerEventListener | `onWriteStream` | 90 |
| registerEventListener | `onUpdate` | 91 |
| registerEventListener | `onRegisterActionEvents` | 92 |
| registerEventListener | `onStartTipping` | 93 |
| registerEventListener | `onOpenBackDoor` | 94 |
| registerEventListener | `onFillUnitTriggerChanged` | 95 |
| registerEventListener | `onRemovedFillUnitTrigger` | 96 |
