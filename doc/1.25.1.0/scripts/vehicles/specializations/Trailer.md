# vehicles/specializations/Trailer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Trailer.md)*

Source: `dataS/scripts/vehicles/specializations/Trailer.lua` — FS25 1.25.1.0

✍ Specialization for tipping trailers. It manages one or more 'tip sides' (discharge node, tip animation, optional back door animation, tipping loop animation), the tip state machine (closed, opening, open, closing), side selection and optional manual tip/door toggles. It requires FillUnit, Dischargeable and AnimatedVehicle, is configured through the `trailer` configuration type, and raises events such as onStartTipping and onEndTipping. Network sync uses streams plus the Trailer*Event classes (defined elsewhere).

- **Trailer** (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `Trailer.prerequisitesPresent(specializations: any)` | 27 | ✍ Returns true only if the vehicle type has the FillUnit, Dischargeable and AnimatedVehicle specializations. |
| `Trailer.initSpecialization()` | 35 | ✍ Registers the `trailer` configuration type and the XML schema for tip sides (animations, manual tip/door toggles, fill-level limits, sounds, object changes), plus extra keys for animation parts, external vehicle control, pickups and turned-on animations. Also registers the savegame keys. |
| `Trailer.registerEvents(vehicleType: any)` | 114 | ✍ Registers the vehicle events onStartTipping, onOpenBackDoor, onStopTipping, onCloseBackDoor and onEndTipping. |
| `Trailer.registerFunctions(vehicleType: any)` | 124 | ✍ Registers the specialization's public vehicle functions (tip side loading and selection, start/stop/end tipping, door state, tip state, automatic redischarge). |
| `Trailer.registerOverwrittenFunctions(vehicleType: any)` | 143 | ✍ Registers overrides of functions from other specializations: discharge empty factor, ground/object discharge checks, cover state, selection, AI discharge, pickup state, turned-on animation, power requirement and manual discharge state. |
| `Trailer.registerEventListeners(vehicleType: any)` | 161 | ✍ Subscribes the specialization to onLoad, onPostLoad, onLoadFinished, onDelete, stream read/write, onUpdate, action events, onDischargeStateChanged, onDeactivate, animation value types, external action events and fill level changes. |
| `Trailer:onLoad(savegame: any)` | 179 | ✍ Reads all `tipSide` entries of the selected `trailer` configuration through `loadTipSide`, builds the discharge-node-to-tip-side lookup and initialises tip state (closed), redischarge data and the dirty flag. |
| `Trailer:onPostLoad(savegame: any)` | 234 | ✍ Warns about tip sides pointing to unknown discharge nodes. Restores tip side, door state, tip state and tip animation time from the savegame, or selects the default tip side for a new vehicle. |
| `Trailer:onLoadFinished(savegame: any)` | 278 | ✍ With several tip sides, marks the side selection for update when the preferred side is not currently available (fill level out of its range). |
| `Trailer:onDelete()` | 289 | ✍ Deletes the animation nodes and unload sound sample of every tip side. |
| `Trailer:onReadStream(streamId: integer, connection: Connection)` | 303 | ✍ Client side on join: reads preferred tip side, tip state, current tip side, door state and the tip/door animation times and playing direction, then applies them to the animations. |
| `Trailer:onWriteStream(streamId: integer, connection: Connection)` | 358 | ✍ Server side on join: writes the same data that `onReadStream` expects (tip side, tip state, door state, animation times and playing direction). |
| `Trailer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 392 | ✍ Per frame: updates the tip-side toggle and manual tip/door input texts, applies a pending side change once closed, advances the tip state machine from animation time, and on the server drives automatic redischarge for uncontrolled vehicles. |
| `Trailer:loadTipSide(xmlFile: any, key: any, entry: any)` | 488 | ✍ Loads one tip side from XML (name, discharge node index, manual toggles, tip/door/tipping animations, fill-level range, animation nodes, sound, object changes). Returns false with a warning if the name or an animation is missing or unknown. |
| `Trailer:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 580 | ✍ Saves the preferred tip side (if several), door state, tip animation time and tip state to the savegame. |
| `Trailer:getCanTogglePreferdTipSide()` | 598 | ✍ Returns true when the tip state is closed and at least one tip side exists, so the preferred side may be changed. |
| `Trailer:getIsTipSideAvailable(sideIndex: any)` | 605 | ✍ Returns true if the given tip side exists and, when it has a fill-level condition, the fill unit percentage lies within its min/max range. |
| `Trailer:getNextAvailableTipSide(index: any)` | 624 | ✍ Cycles from the given index to the next available tip side and returns its index, or the given index if none is available. |
| `Trailer:setPreferedTipSide(index: any, noEventSend: any)` | 648 | ✍ Selects the preferred tip side (clamped to the valid range), stopping any tipping in progress. Sends TrailerToggleTipSideEvent unless `noEventSend`, applies object changes, closes the old door if needed and switches the current discharge node. |
| `Trailer:setTipSideUpdateDirty()` | 700 | ✍ Flags that the tip side must be re-evaluated once the trailer is closed again. |
| `Trailer:startTipping(tipSideIndex: any, noEventSend: any)` | 707 | ✍ Starts the tip animation (and door/tipping animations, animation nodes and unload sound on the client), sets the state to opening and raises onStartTipping. The `noEventSend` parameter is not used in the body. |
| `Trailer:stopTipping(noEventSend: any)` | 746 | ✍ Plays the tip animation backwards (or stops it if the close speed is zero), closes the door unless delayed, stops effects, sets the state to closing and raises onStopTipping. `noEventSend` is not used in the body. |
| `Trailer:endTipping(noEventSend: any)` | 785 | ✍ Finishes the closing: applies a delayed door closing if configured, resets the state to closed, clears the current tip side and raises onEndTipping. |
| `Trailer:setTrailerDoorState(tipSideIndex: any, state: any, noEventSend: any, instantUpdate: any)` | 805 | ✍ Opens or closes the back door of a tip side (toggles if `state` is nil), optionally jumping to the end instantly, raises onOpenBackDoor/onCloseBackDoor for manual doors and sends TrailerToggleManualDoorEvent. |
| `Trailer:getAllowTrailerDoorToggle(tipSideIndex: any)` | 836 | ✍ Returns whether the manual door may be toggled now: refused when the fill unit is filled and not allowed, when closing while tipping, or when reset-while-tipping applies. |
| `Trailer:getTipState()` | 865 | ✍ Returns the current tip state constant (closed, opening, open or closing). |
| `Trailer:setTipState(isOpen: any)` | 871 | ✍ Puts the current tip side directly into the open or closed pose (used when loading), playing its animations and fast-forwarding them to the end. |
| `Trailer:updateTrailerAutomaticRedischarge()` | 897 | ✍ Server logic that restarts discharge to an object when the trailer stayed within 1.5 m of the last discharge position, still targets the same object, has fill left and the target has enough free capacity. Resets the memory otherwise. |
| `Trailer:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 945 | ✍ Override: returns 0 until the tip or door animation passes its configured start time, then the tip side's current empty factor. Falls back to the parent function for nodes without tip side. |
| `Trailer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 974 | ✍ Override: after the parent check, forbids ground discharge when the active tip side has `canTip` false, or is empty while `canTipIfEmpty` is false. |
| `Trailer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 997 | ✍ Override: after the parent check, forbids discharge to an object when the active tip side has `canTip` set to false. |
| `Trailer:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1015 | ✍ Override: while a tip side is tipping or its manual door is open, only the cover state matching the discharge node's cover is allowed; otherwise defers to the parent. |
| `Trailer:getCanBeSelected(superFunc: any)` | 1048 | ✍ Override that always returns true, so the trailer can be selected. |
| `Trailer:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1054 | ✍ Client only: registers the tip side toggle action (if several sides) and the manual tip and manual door actions of the preferred side. |
| `Trailer:onDischargeStateChanged(dischargeState: any)` | 1083 | ✍ Starts tipping when discharge goes to ground or object and stops it when discharge turns off. Also remembers the target object and node position for automatic redischarge. |
| `Trailer:onDeactivate()` | 1106 | ✍ Stops a manually started tipping when the vehicle is deactivated, if the tip side has `stopOnDeactivate` enabled. |
| `Trailer:getAIHasFinishedDischarge(superFunc: any, dischargeNode: any)` | 1121 | ✍ Override: returns false while the tip state is not closed, otherwise defers to the parent. |
| `Trailer:startAIDischarge(superFunc: any, dischargeNode: any, task: any)` | 1131 | ✍ Override: selects the tip side linked to the AI's discharge node before calling the parent function. |
| `Trailer:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1143 | ✍ Override: additionally reads the pickup attribute `allowWhileTipping` (default true) before calling the parent. |
| `Trailer:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1151 | ✍ Override: refuses a pickup state change while tipping when the pickup has `allowWhileTipping` false. |
| `Trailer:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1165 | ✍ Override: additionally reads the turned-on animation attribute `playWhileTipping` (default false). |
| `Trailer:getRequiresPower(superFunc: any)` | 1173 | ✍ Override: returns true while the trailer is opening or closing its tip, else the parent's value. |
| `Trailer:setManualDischargeState(superFunc: any, state: any, noEventSend: any)` | 1184 | ✍ Override: when discharge is switched off manually, clears the stored redischarge target so no automatic redischarge follows, then calls the parent. |
| `Trailer:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1198 | ✍ Override: for animations flagged `playWhileTipping`, also active while tipping and the discharge empty factor is above 0. |
| `Trailer:onRegisterAnimationValueTypes()` | 1208 | ✍ Registers two animation value types usable in AnimatedVehicle parts: `tipSideEmptyFactor` (drives a tip side's empty factor via a discharge node) and `doorAnimationMaxTime` (limits and re-plays the door animation). |
| `Trailer:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1299 | ✍ Registers the external action event `trailerDoorToggle` for triggers, storing the tip side index read from the XML (default 1). |
| `Trailer.externalActionEventDoorToggleRegister(data: any, vehicle: any)` | 1308 | ✍ Registers the input action that toggles the manual door from outside the vehicle; selects the tip side first if available. Does nothing when the side has no manual door. |
| `Trailer.externalActionEventDoorToggleUpdate(data: any, vehicle: any)` | 1330 | ✍ Updates the displayed text of the external door action (open or close) according to the door animation state. |
| `Trailer:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1357 | ✍ Re-selects the tip side when fill-level-dependent sides become unavailable (deferred if tipping). On the server, closes a manual door when the fill unit receives product and filled opening is disallowed. |
| `Trailer.actionEventToggleTipSide(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1387 | ✍ Input callback: switches to the next available tip side when toggling is currently allowed. |
| `Trailer.actionEventManualToggleTip(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1397 | ✍ Input callback: starts tipping if closed or closing, otherwise stops it, and sends TrailerToggleManualTipEvent. |
| `Trailer.actionEventManualToggleDoor(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1410 | ✍ Input callback: toggles the manual door when allowed, otherwise shows a blinking 'not allowed now' warning for 5 seconds. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartTipping` | 115 |
| registerEvent | `onOpenBackDoor` | 116 |
| registerEvent | `onStopTipping` | 117 |
| registerEvent | `onCloseBackDoor` | 118 |
| registerEvent | `onEndTipping` | 119 |
| registerFunction | `loadTipSide` | 125 |
| registerFunction | `getCanTogglePreferdTipSide` | 126 |
| registerFunction | `getIsTipSideAvailable` | 127 |
| registerFunction | `getNextAvailableTipSide` | 128 |
| registerFunction | `setPreferedTipSide` | 129 |
| registerFunction | `setTipSideUpdateDirty` | 130 |
| registerFunction | `startTipping` | 131 |
| registerFunction | `stopTipping` | 132 |
| registerFunction | `endTipping` | 133 |
| registerFunction | `setTrailerDoorState` | 134 |
| registerFunction | `getAllowTrailerDoorToggle` | 135 |
| registerFunction | `getTipState` | 136 |
| registerFunction | `setTipState` | 137 |
| registerFunction | `updateTrailerAutomaticRedischarge` | 138 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 144 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 145 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 146 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 147 |
| registerOverwrittenFunction | `getCanBeSelected` | 148 |
| registerOverwrittenFunction | `getAIHasFinishedDischarge` | 149 |
| registerOverwrittenFunction | `startAIDischarge` | 150 |
| registerOverwrittenFunction | `loadPickupFromXML` | 151 |
| registerOverwrittenFunction | `getCanChangePickupState` | 152 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 153 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 154 |
| registerOverwrittenFunction | `getRequiresPower` | 155 |
| registerOverwrittenFunction | `setManualDischargeState` | 156 |
| registerEventListener | `onLoad` | 162 |
| registerEventListener | `onPostLoad` | 163 |
| registerEventListener | `onLoadFinished` | 164 |
| registerEventListener | `onDelete` | 165 |
| registerEventListener | `onReadStream` | 166 |
| registerEventListener | `onWriteStream` | 167 |
| registerEventListener | `onUpdate` | 168 |
| registerEventListener | `onRegisterActionEvents` | 169 |
| registerEventListener | `onDischargeStateChanged` | 170 |
| registerEventListener | `onDeactivate` | 171 |
| registerEventListener | `onRegisterAnimationValueTypes` | 172 |
| registerEventListener | `onRegisterExternalActionEvents` | 173 |
| registerEventListener | `onFillUnitFillLevelChanged` | 174 |
