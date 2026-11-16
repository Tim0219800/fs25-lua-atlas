---@meta
-- FS25 1.25.1.0 : vehicles/specializations/RidgeMarker.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements that carry folding ridge markers (marker arms that scratch a guide line in the soil). It requires AnimatedVehicle and WorkArea, adds a "ridgeMarker" configuration type and a "ridgemarker" work area type, and cycles through marker states with an input action. The state is saved, streamed to joining clients and synchronised through RidgeMarkerSetStateEvent; the soil marking is done on the density map.
---@class RidgeMarker
RidgeMarker = {}

--- Registers the "ridgeMarker" configuration type and the "ridgemarker" work area type, then declares the vehicle XML schema paths (including per-configuration ones, the work area child node and the speed rotating part attributes) and the savegame `ridgeMarker#state` attribute.
function RidgeMarker.initSpecialization() end

--- Declares the XML schema entries under a base key: input button, the list of `marker` entries (animation, work limits, lifted animation time, work area index), fold limits, fold disable direction, only-active-when-lowered flag and direction node.
---@param schema any
---@param baseKey any
function RidgeMarker.registerRidgeMarkerXMLPaths(schema, baseKey) end

--- Declares the `ridgeMarkerArea` schema entries of a work area: the node around which the marking area is built, the area size (default 0.25) and the test area offset along +z (default 0.2).
---@param schema any
---@param baseKey any
function RidgeMarker.registerRidgeMarkerAreaXMLPaths(schema, baseKey) end

--- Returns true only if the vehicle type has both the AnimatedVehicle and WorkArea specializations.
---@param specializations table
---@return boolean
function RidgeMarker.prerequisitesPresent(specializations) end

--- Registers the specialization functions on the vehicle type: `loadRidgeMarker`, `setRidgeMarkerState`, `canFoldRidgeMarker` and `processRidgeMarkerArea`.
---@param vehicleType any
function RidgeMarker.registerFunctions(vehicleType) end

--- Overrides `loadWorkAreaFromXML`, `getIsWorkAreaActive`, `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive` and `getCanBeSelected` on the vehicle type.
---@param vehicleType any
function RidgeMarker.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdateTick, onRegisterActionEvents, onSetLowered, onFoldStateChanged and onAIImplementStart.
---@param vehicleType any
function RidgeMarker.registerEventListeners(vehicleType) end

--- Picks the ridge marker configuration (falls back to `vehicle.ridgeMarker`), reads the input action, the `marker` entries (capped by MAX_NUM_RIDGEMARKERS - 1), fold limits and direction node, and sets state 0. On non-clients it removes the onUpdateTick listener.
---@param savegame table
function RidgeMarker:onLoad(savegame) end

--- When loading a savegame with markers defined, restores the saved state and jumps the matching animation to its end.
---@param savegame any
function RidgeMarker:onPostLoad(savegame) end

--- Writes the current ridge marker state to the savegame, only if the vehicle has at least one marker.
---@param xmlFile any
---@param key any
---@param usedModNames any
function RidgeMarker:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the ridge marker state from the stream, applies it without sending an event and fast-forwards the animation if the state is not 0.
---@param streamId integer
---@param connection Connection
function RidgeMarker:onReadStream(streamId, connection) end

--- Server side on join: writes the current ridge marker state to the stream when markers exist.
---@param streamId integer
---@param connection Connection
function RidgeMarker:onWriteStream(streamId, connection) end

--- Client-only tick that refreshes the visibility of the toggle action event.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function RidgeMarker:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Reads one `marker` entry (animation name, min/max work limits, lifted animation time, work area index). Returns false with an XML warning if `workAreaIndex` is missing.
---@param xmlFile any
---@param key any
---@param ridgeMarker any
function RidgeMarker:loadRidgeMarker(xmlFile, key, ridgeMarker) end

--- Switches the active marker: sends RidgeMarkerSetStateEvent, folds the previous marker's animation backwards, then unfolds the new one (stopping at the lifted time if the tool is raised). State 0 means all folded.
---@param state integer
---@param noEventSend boolean
function RidgeMarker:setRidgeMarkerState(state, noEventSend) end

--- Returns whether the given state may be selected, based on the fold animation time being inside the configured limits and on the disabled fold direction. Used by the toggle and by the action text visibility.
---@param state integer
---@return boolean
function RidgeMarker:canFoldRidgeMarker(state) end

--- Work area callback: if the test node lies on a field ground type, erases tire tracks and applies a plow or cultivator density map update on the marker area (cultivator if the ground is plowed). Clients far away skip the density update. Returns 0, 0.
---@param workArea any
---@param dt any
function RidgeMarker:processRidgeMarkerArea(workArea, dt) end

--- Overrides work area loading: builds start/width/height/test transform nodes around `ridgeMarkerArea#node`, calls the parent, and turns a DEFAULT work area into RIDGEMARKER type when the node exists. Warns if a RIDGEMARKER area has no node.
---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RidgeMarker:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Extends speed rotating part loading with the `ridgeMarkerAnim` name and `ridgeMarkerAnimTimeMax` (default 0.99) attributes.
---@param superFunc table
---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function RidgeMarker:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- Returns false while the linked ridge marker animation has not reached its max time (marker not fully unfolded); otherwise defers to the parent.
---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function RidgeMarker:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Always returns true, so the implement stays selectable.
---@param superFunc any
function RidgeMarker:getCanBeSelected(superFunc) end

--- For RIDGEMARKER work areas, returns false if there are no markers, if the marker animation is outside its min/max work limits, or if it must be lowered and is not; otherwise defers to the parent.
---@param superFunc table
---@param workArea table
---@return boolean
function RidgeMarker:getIsWorkAreaActive(superFunc, workArea) end

--- Client side: registers the powered action event that toggles ridge markers (text `action_toggleRidgeMarker`) when active for input and markers exist.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function RidgeMarker:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Adjusts markers that define a lifted animation time: when lowered, resumes the animation if it is parked at that time; when raised, plays it back down to that time if it is further unfolded.
---@param lowered boolean
function RidgeMarker:onSetLowered(lowered) end

--- Resets the ridge marker state to 0 (no event sent) when the implement starts folding in a positive direction and is not moving to the middle position.
---@param direction integer
---@param moveToMiddle boolean
function RidgeMarker:onFoldStateChanged(direction, moveToMiddle) end

--- Resets the ridge marker state to 0 (no event sent) when an AI job starts with this implement.
function RidgeMarker:onAIImplementStart() end

--- Input callback: computes the next state (cycling through 0..numMarkers) and applies it with `setRidgeMarkerState` if `canFoldRidgeMarker` allows it.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function RidgeMarker.actionEventToggleRidgeMarkers(self, actionName, inputValue, callbackState, isAnalog) end

--- Shows or hides the toggle action depending on whether markers exist and the next state may be selected.
---@param self any
function RidgeMarker.updateActionEvents(self) end
