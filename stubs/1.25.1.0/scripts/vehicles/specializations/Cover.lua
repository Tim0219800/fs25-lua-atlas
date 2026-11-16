---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cover.lua (generated stub, FS25 Lua Atlas)

--- Specialization adding one or several animated covers (tarps) to a vehicle, tied to fill units. A cover has a numbered state (0 = all closed, N = cover N open), toggled by the player, opened automatically while tipping or when a fill trigger is in range, and synchronized through SetCoverStateEvent. Requires AnimatedVehicle; loads its covers from the 'cover' configuration, saves the state per vehicle, and also gates pipe state changes and some tool types.
---@class Cover
Cover = {}

--- Returns true only if the vehicle type has the AnimatedVehicle specialization, which the cover animations rely on.
---@param specializations any
function Cover.prerequisitesPresent(specializations) end

--- Registers the 'cover' vehicle configuration type and the XML schema entries for cover animations, fill unit indices, blocked tool types, texts, pipe cover limits, plus the savegame key for the cover state.
function Cover.initSpecialization() end

--- Registers the cover functions on the vehicle type: XML loading, state change and permission checks, animation playback and lookup of a cover by fill unit.
---@param vehicleType any
function Cover.registerFunctions(vehicleType) end

--- Registers overrides of fill unit tool support, selection, pipe loading and pipe state permission, the AI loading/discharge hooks, and the fill-unit-in-trigger-range callback.
---@param vehicleType any
function Cover.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to load, post-load, stream read/write, update, action event registration, tipping, back door and fill trigger events.
---@param vehicleType any
function Cover.registerEventListeners(vehicleType) end

--- Reads the covers of the selected 'cover' configuration, builds the fill-unit-to-covers map, loads options and texts, and removes the update/network/input listeners when the vehicle has no valid cover.
---@param savegame any
function Cover:onLoad(savegame) end

--- Restores the cover state from the savegame, or from the 'openOnBuy' flag for a new vehicle, applies it and fast-forwards all pending cover animations to their end so the visuals are immediately correct.
---@param savegame any
function Cover:onPostLoad(savegame) end

--- Writes the current cover state to the savegame when the vehicle has covers.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Cover:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the cover state from the stream, applies it without sending an event and completes the animations instantly.
---@param streamId any
---@param connection any
function Cover:onReadStream(streamId, connection) end

--- Server side: writes the current cover state into the stream for a joining client.
---@param streamId any
---@param connection any
function Cover:onWriteStream(streamId, connection) end

--- Drives the queue of cover animations (replaces a repeated animation, starts the next one when the current ends). If 'closeCoverIfNotAllowed' is set, closes the cover when the next state is not allowed.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cover:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one cover entry into the given table (animations, start/stop times, open on buy, tip and trigger behaviour, fill unit indices, blocked tool types). Returns false with a warning if the open animation or the fill unit indices are missing.
---@param xmlFile any
---@param key any
---@param cover any
function Cover:loadCoverFromXML(xmlFile, key, cover) end

--- Changes the cover state (0 closes all). Sends SetCoverStateEvent unless noEventSend, queues the close animation of the previous cover and the open animation of the new one, then refreshes the action text. Ignored if the state is invalid or unchanged.
---@param state any
---@param noEventSend any
function Cover:setCoverState(state, noEventSend) end

--- Plays a queued cover animation entry: optionally jumps to its start time, sets the stop time and plays it forward or backward depending on where the animation currently is.
---@param animation any
function Cover:playCoverAnimation(animation) end

--- Returns the first cover assigned to the given fill unit index, or nil if none.
---@param fillUnitIndex any
function Cover:getCoverByFillUnitIndex(fillUnitIndex) end

--- Default permission check: a state change is allowed unless more than one animation is already queued. Meant to be overridden by other specializations.
---@param nextState any
function Cover:getIsNextCoverStateAllowed(nextState) end

--- Returns the warning text to show when a state change is refused; the default returns nil (no warning). Hook for overrides.
---@param nextState any
function Cover:getIsNextCoverStateAllowedWarning(nextState) end

--- Returns false for a tool type listed in the cover's blocked tool types while that fill unit's cover is not open; otherwise defers to the parent implementation.
---@param superFunc any
---@param fillUnitIndex any
---@param toolType any
function Cover:getFillUnitSupportsToolType(superFunc, fillUnitIndex, toolType) end

--- Always returns true, so a vehicle with this specialization can be selected.
---@param superFunc any
function Cover:getCanBeSelected(superFunc) end

--- After the parent loads pipe nodes, reads the min and max cover state allowed for pipe changes from 'vehicle.pipe' (max defaults to the number of covers) and stores them in the pipe spec.
---@param superFunc any
---@param pipeNodes any
---@param xmlFile any
---@param baseKey any
function Cover:loadPipeNodes(superFunc, pipeNodes, xmlFile, baseKey) end

--- Refuses a pipe state change when the current cover state lies outside the configured min/max range, in addition to the parent's checks.
---@param superFunc any
---@param nextPipeState any
function Cover:getIsPipeStateChangeAllowed(superFunc, nextPipeState, ...) end

--- Client only: registers the TOGGLE_COVER input (falling back to IMPLEMENT_EXTRA4 if unavailable) when the vehicle is active for input, and sets its text.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Cover:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- When 'openCoverWhileTipping' is enabled, opens the cover of the fill unit belonging to the tip side's discharge node, without sending an event.
---@param tipSide any
function Cover:onStartTipping(tipSide) end

--- When 'openCoverWhileTipping' is enabled, opens the cover matching the tip side's discharge fill unit as the back door opens. Same logic as onStartTipping.
---@param tipSide any
function Cover:onOpenBackDoor(tipSide) end

--- Closes all covers once an AI discharge ends, then calls the parent.
---@param superFunc any
function Cover:finishedAIDischarge(superFunc) end

--- Opens the cover of the fill unit the AI is about to load, then calls the parent.
---@param superFunc any
---@param fillUnitIndex any
---@param task any
function Cover:aiPrepareLoading(superFunc, fillUnitIndex, task) end

--- Closes all covers once AI loading is finished, then calls the parent.
---@param superFunc any
---@param fillUnitIndex any
---@param task any
function Cover:aiFinishLoading(superFunc, fillUnitIndex, task) end

--- After the parent, auto-opens the fill unit's cover when it enters a trigger range (if 'autoReactToTrigger' and the change is allowed), and closes it again on leaving if it was opened automatically.
---@param superFunc any
---@param fillUnitIndex any
---@param isInRange any
function Cover:setFillUnitInTriggerRange(superFunc, fillUnitIndex, isInRange) end

--- When a fill trigger changes for a fill unit with covers, opens its cover automatically if auto reaction is enabled and the change is allowed, and remembers it was set automatically.
---@param fillTrigger any
---@param fillTypeIndex any
---@param fillUnitIndex any
---@param numTriggers any
function Cover:onFillUnitTriggerChanged(fillTrigger, fillTypeIndex, fillUnitIndex, numTriggers) end

--- When the last fill trigger is removed, closes the cover if it had been opened automatically and auto reaction is enabled.
---@param numTriggers any
function Cover:onRemovedFillUnitTrigger(numTriggers) end

--- Updates the toggle action label: open text at state 0, close text at the last state, next-cover text in between. Does nothing if no action event is registered.
---@param self any
function Cover.updateActionText(self) end

--- Input callback: cycles to the next state (wrapping to 0) if allowed, and clears the automatic flag; otherwise shows the blinking warning returned by getIsNextCoverStateAllowedWarning, if any.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Cover.actionEventToggleCover(self, actionName, inputValue, callbackState, isAnalog) end
