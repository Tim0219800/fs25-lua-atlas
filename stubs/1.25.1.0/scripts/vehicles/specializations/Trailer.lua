---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Trailer.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tipping trailers. It manages one or more 'tip sides' (discharge node, tip animation, optional back door animation, tipping loop animation), the tip state machine (closed, opening, open, closing), side selection and optional manual tip/door toggles. It requires FillUnit, Dischargeable and AnimatedVehicle, is configured through the `trailer` configuration type, and raises events such as onStartTipping and onEndTipping. Network sync uses streams plus the Trailer*Event classes (defined elsewhere).
---@class Trailer
Trailer = {}

--- Returns true only if the vehicle type has the FillUnit, Dischargeable and AnimatedVehicle specializations.
---@param specializations any
function Trailer.prerequisitesPresent(specializations) end

--- Registers the `trailer` configuration type and the XML schema for tip sides (animations, manual tip/door toggles, fill-level limits, sounds, object changes), plus extra keys for animation parts, external vehicle control, pickups and turned-on animations. Also registers the savegame keys.
function Trailer.initSpecialization() end

--- Registers the vehicle events onStartTipping, onOpenBackDoor, onStopTipping, onCloseBackDoor and onEndTipping.
---@param vehicleType any
function Trailer.registerEvents(vehicleType) end

--- Registers the specialization's public vehicle functions (tip side loading and selection, start/stop/end tipping, door state, tip state, automatic redischarge).
---@param vehicleType any
function Trailer.registerFunctions(vehicleType) end

--- Registers overrides of functions from other specializations: discharge empty factor, ground/object discharge checks, cover state, selection, AI discharge, pickup state, turned-on animation, power requirement and manual discharge state.
---@param vehicleType any
function Trailer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onPostLoad, onLoadFinished, onDelete, stream read/write, onUpdate, action events, onDischargeStateChanged, onDeactivate, animation value types, external action events and fill level changes.
---@param vehicleType any
function Trailer.registerEventListeners(vehicleType) end

--- Reads all `tipSide` entries of the selected `trailer` configuration through `loadTipSide`, builds the discharge-node-to-tip-side lookup and initialises tip state (closed), redischarge data and the dirty flag.
---@param savegame any
function Trailer:onLoad(savegame) end

--- Warns about tip sides pointing to unknown discharge nodes. Restores tip side, door state, tip state and tip animation time from the savegame, or selects the default tip side for a new vehicle.
---@param savegame any
function Trailer:onPostLoad(savegame) end

--- With several tip sides, marks the side selection for update when the preferred side is not currently available (fill level out of its range).
---@param savegame any
function Trailer:onLoadFinished(savegame) end

--- Deletes the animation nodes and unload sound sample of every tip side.
function Trailer:onDelete() end

--- Client side on join: reads preferred tip side, tip state, current tip side, door state and the tip/door animation times and playing direction, then applies them to the animations.
---@param streamId integer
---@param connection Connection
function Trailer:onReadStream(streamId, connection) end

--- Server side on join: writes the same data that `onReadStream` expects (tip side, tip state, door state, animation times and playing direction).
---@param streamId integer
---@param connection Connection
function Trailer:onWriteStream(streamId, connection) end

--- Per frame: updates the tip-side toggle and manual tip/door input texts, applies a pending side change once closed, advances the tip state machine from animation time, and on the server drives automatic redischarge for uncontrolled vehicles.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Trailer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one tip side from XML (name, discharge node index, manual toggles, tip/door/tipping animations, fill-level range, animation nodes, sound, object changes). Returns false with a warning if the name or an animation is missing or unknown.
---@param xmlFile any
---@param key any
---@param entry any
function Trailer:loadTipSide(xmlFile, key, entry) end

--- Saves the preferred tip side (if several), door state, tip animation time and tip state to the savegame.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Trailer:saveToXMLFile(xmlFile, key, usedModNames) end

--- Returns true when the tip state is closed and at least one tip side exists, so the preferred side may be changed.
function Trailer:getCanTogglePreferdTipSide() end

--- Returns true if the given tip side exists and, when it has a fill-level condition, the fill unit percentage lies within its min/max range.
---@param sideIndex any
function Trailer:getIsTipSideAvailable(sideIndex) end

--- Cycles from the given index to the next available tip side and returns its index, or the given index if none is available.
---@param index any
function Trailer:getNextAvailableTipSide(index) end

--- Selects the preferred tip side (clamped to the valid range), stopping any tipping in progress. Sends TrailerToggleTipSideEvent unless `noEventSend`, applies object changes, closes the old door if needed and switches the current discharge node.
---@param index any
---@param noEventSend any
function Trailer:setPreferedTipSide(index, noEventSend) end

--- Flags that the tip side must be re-evaluated once the trailer is closed again.
function Trailer:setTipSideUpdateDirty() end

--- Starts the tip animation (and door/tipping animations, animation nodes and unload sound on the client), sets the state to opening and raises onStartTipping. The `noEventSend` parameter is not used in the body.
---@param tipSideIndex any
---@param noEventSend any
function Trailer:startTipping(tipSideIndex, noEventSend) end

--- Plays the tip animation backwards (or stops it if the close speed is zero), closes the door unless delayed, stops effects, sets the state to closing and raises onStopTipping. `noEventSend` is not used in the body.
---@param noEventSend any
function Trailer:stopTipping(noEventSend) end

--- Finishes the closing: applies a delayed door closing if configured, resets the state to closed, clears the current tip side and raises onEndTipping.
---@param noEventSend any
function Trailer:endTipping(noEventSend) end

--- Opens or closes the back door of a tip side (toggles if `state` is nil), optionally jumping to the end instantly, raises onOpenBackDoor/onCloseBackDoor for manual doors and sends TrailerToggleManualDoorEvent.
---@param tipSideIndex any
---@param state any
---@param noEventSend any
---@param instantUpdate any
function Trailer:setTrailerDoorState(tipSideIndex, state, noEventSend, instantUpdate) end

--- Returns whether the manual door may be toggled now: refused when the fill unit is filled and not allowed, when closing while tipping, or when reset-while-tipping applies.
---@param tipSideIndex any
function Trailer:getAllowTrailerDoorToggle(tipSideIndex) end

--- Returns the current tip state constant (closed, opening, open or closing).
function Trailer:getTipState() end

--- Puts the current tip side directly into the open or closed pose (used when loading), playing its animations and fast-forwarding them to the end.
---@param isOpen any
function Trailer:setTipState(isOpen) end

--- Server logic that restarts discharge to an object when the trailer stayed within 1.5 m of the last discharge position, still targets the same object, has fill left and the target has enough free capacity. Resets the memory otherwise.
function Trailer:updateTrailerAutomaticRedischarge() end

--- Override: returns 0 until the tip or door animation passes its configured start time, then the tip side's current empty factor. Falls back to the parent function for nodes without tip side.
---@param superFunc any
---@param dischargeNode any
function Trailer:getDischargeNodeEmptyFactor(superFunc, dischargeNode) end

--- Override: after the parent check, forbids ground discharge when the active tip side has `canTip` false, or is empty while `canTipIfEmpty` is false.
---@param superFunc any
---@param dischargeNode any
function Trailer:getCanDischargeToGround(superFunc, dischargeNode) end

--- Override: after the parent check, forbids discharge to an object when the active tip side has `canTip` set to false.
---@param superFunc any
---@param dischargeNode any
function Trailer:getCanDischargeToObject(superFunc, dischargeNode) end

--- Override: while a tip side is tipping or its manual door is open, only the cover state matching the discharge node's cover is allowed; otherwise defers to the parent.
---@param superFunc any
---@param nextState any
function Trailer:getIsNextCoverStateAllowed(superFunc, nextState) end

--- Override that always returns true, so the trailer can be selected.
---@param superFunc any
function Trailer:getCanBeSelected(superFunc) end

--- Client only: registers the tip side toggle action (if several sides) and the manual tip and manual door actions of the preferred side.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Trailer:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Starts tipping when discharge goes to ground or object and stops it when discharge turns off. Also remembers the target object and node position for automatic redischarge.
---@param dischargeState any
function Trailer:onDischargeStateChanged(dischargeState) end

--- Stops a manually started tipping when the vehicle is deactivated, if the tip side has `stopOnDeactivate` enabled.
function Trailer:onDeactivate() end

--- Override: returns false while the tip state is not closed, otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function Trailer:getAIHasFinishedDischarge(superFunc, dischargeNode) end

--- Override: selects the tip side linked to the AI's discharge node before calling the parent function.
---@param superFunc any
---@param dischargeNode any
---@param task any
function Trailer:startAIDischarge(superFunc, dischargeNode, task) end

--- Override: additionally reads the pickup attribute `allowWhileTipping` (default true) before calling the parent.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param spec any
function Trailer:loadPickupFromXML(superFunc, xmlFile, key, spec) end

--- Override: refuses a pickup state change while tipping when the pickup has `allowWhileTipping` false.
---@param superFunc any
---@param spec any
---@param newState any
function Trailer:getCanChangePickupState(superFunc, spec, newState) end

--- Override: additionally reads the turned-on animation attribute `playWhileTipping` (default false).
---@param superFunc any
---@param xmlFile any
---@param key any
---@param turnedOnAnimation any
function Trailer:loadTurnedOnAnimationFromXML(superFunc, xmlFile, key, turnedOnAnimation) end

--- Override: returns true while the trailer is opening or closing its tip, else the parent's value.
---@param superFunc any
function Trailer:getRequiresPower(superFunc) end

--- Override: when discharge is switched off manually, clears the stored redischarge target so no automatic redischarge follows, then calls the parent.
---@param superFunc any
---@param state any
---@param noEventSend any
function Trailer:setManualDischargeState(superFunc, state, noEventSend) end

--- Override: for animations flagged `playWhileTipping`, also active while tipping and the discharge empty factor is above 0.
---@param superFunc any
---@param turnedOnAnimation any
function Trailer:getIsTurnedOnAnimationActive(superFunc, turnedOnAnimation) end

--- Registers two animation value types usable in AnimatedVehicle parts: `tipSideEmptyFactor` (drives a tip side's empty factor via a discharge node) and `doorAnimationMaxTime` (limits and re-plays the door animation).
function Trailer:onRegisterAnimationValueTypes() end

--- Registers the external action event `trailerDoorToggle` for triggers, storing the tip side index read from the XML (default 1).
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Trailer:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- Registers the input action that toggles the manual door from outside the vehicle; selects the tip side first if available. Does nothing when the side has no manual door.
---@param data any
---@param vehicle any
function Trailer.externalActionEventDoorToggleRegister(data, vehicle) end

--- Updates the displayed text of the external door action (open or close) according to the door animation state.
---@param data any
---@param vehicle any
function Trailer.externalActionEventDoorToggleUpdate(data, vehicle) end

--- Re-selects the tip side when fill-level-dependent sides become unavailable (deferred if tipping). On the server, closes a manual door when the fill unit receives product and filled opening is disallowed.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Trailer:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Input callback: switches to the next available tip side when toggling is currently allowed.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventToggleTipSide(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: starts tipping if closed or closing, otherwise stops it, and sends TrailerToggleManualTipEvent.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventManualToggleTip(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the manual door when allowed, otherwise shows a blinking 'not allowed now' warning for 5 seconds.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Trailer.actionEventManualToggleDoor(self, actionName, inputValue, callbackState, isAnalog) end
