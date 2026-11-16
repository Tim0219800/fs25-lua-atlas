---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkMode.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements that offer several selectable work modes, each bundling its own animations, work areas, windrower effects, AI setup, moving-tool limits and variable work width. It requires WorkArea and AnimatedVehicle, reads the `vehicle.workModes` XML block (optionally per `workMode` configuration), and saves the current mode in the savegame. The mode is synchronized to clients (join stream and a server-to-client update stream for windrow effects) and changed through SetWorkModeEvent. It raises `onWorkModeChanged`.
---@class WorkMode
WorkMode = {}

--- Returns true only if the vehicle type also has the WorkArea and AnimatedVehicle specializations.
---@param specializations table
---@return boolean
function WorkMode.prerequisitesPresent(specializations) end

--- Registers the `workMode` configuration type and the XML schema paths under `vehicle.workModes` and each configuration entry, plus the savegame attribute `workMode#state` (default 1).
function WorkMode.initSpecialization() end

--- Declares every XML key of a work-mode block: fold limits, change permissions, per-mode animations, work/drop areas, moving-tool limit, variable work width, windrower effect, animation nodes and AI. Also adds `workModeIndex` for spray types and `allowWhileChangingWorkMode` for moving tools.
---@param schema any
---@param basePath any
function WorkMode.registerWorkModeXMLPaths(schema, basePath) end

--- Registers the vehicle event `onWorkModeChanged`.
---@param vehicleType table
function WorkMode.registerEvents(vehicleType) end

--- Adds loadWorkModeFromXML, setWorkMode, getWorkMode, getIsWorkModeChangeAllowed and deactivateWindrowerEffects to the vehicle type. Note: `WorkMode:getWorkMode` is registered here but no definition appears in this file (UNVERIFIED where it comes from).
---@param vehicleType any
function WorkMode.registerFunctions(vehicleType) end

--- Overrides getIsWorkAreaActive, getCanBeSelected, getAllowsLowering, loadSprayTypeFromXML, getIsSprayTypeActive, loadMovingToolFromXML, getIsMovingToolActive and getAreEffectsVisible.
---@param vehicleType any
function WorkMode.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to load, delete, network stream, update, draw, turn on/off, deactivate, lowering, fold-state and action-event registration callbacks.
---@param vehicleType any
function WorkMode.registerEventListeners(vehicleType) end

--- Reads the work-mode definitions (using the vehicle's `workMode` configuration if present), applies the default mode, creates the HUD extension and allocates the dirty flag. If no mode is defined, it removes all the other event listeners to avoid any cost. Prints an error if the mode count exceeds what the network bit width can carry.
---@param savegame table
function WorkMode:onLoad(savegame) end

--- Restores the saved mode from the savegame (clamped to the valid range), fast-forwards the animations to their end state and, for foldable tools that are not moving, sets the fold direction from the current fold time.
---@param savegame any
function WorkMode:onPostLoad(savegame) end

--- Writes the current work mode index to the savegame key `#state`.
---@param xmlFile any
---@param key any
---@param usedModNames any
function WorkMode:saveToXMLFile(xmlFile, key, usedModNames) end

--- Deletes the windrower effects and animation nodes of every mode and the HUD extension.
function WorkMode:onDelete() end

--- Client side on join: reads the current mode index from the stream and applies it without sending an event.
---@param streamId integer
---@param connection Connection
function WorkMode:onReadStream(streamId, connection) end

--- Server side on join: writes the current mode index to the stream.
---@param streamId integer
---@param connection Connection
function WorkMode:onWriteStream(streamId, connection) end

--- Client only: when the dirty bit was sent, reads for each windrower effect of the active mode whether it was recently charged, and reads the accumulated fruit type.
---@param streamId integer
---@param timestamp integer
---@param connection table
function WorkMode:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: when the dirty flag is set, writes for each windrower effect of the active mode whether it was charged in the last 500 ms, then the accumulated fruit type.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function WorkMode:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Client: fades turned-on animations in and out, starts or stops windrower effects according to the last charge time and fruit type, and enables the work-mode input actions depending on whether a change is allowed. Server: tracks the fruit type and pickup activity of the active mode's work areas and raises the dirty flag.
---@param dt number
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkMode:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- When the tool is fully unfolded (or at its middle fold position), restarts mode animations flagged to repeat after unfolding and runs a lowering animation that was postponed during folding.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function WorkMode:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Adds the work-mode HUD help extension to the HUD each frame when one exists.
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WorkMode:onDraw(isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stops the windrower effects when the vehicle is deactivated.
function WorkMode:onDeactivate() end

--- Client only: stops the windrower effects of every work mode.
function WorkMode:deactivateWindrowerEffects() end

--- Fills a mode table from XML: name, input action, default flag, turned-on and lowering animations (only if the animation exists), work and drop areas, mode-change animations, moving-tool limit, variable work width, windrower effects, animation nodes and AI setup. Always returns true.
---@param xmlFile any
---@param key any
---@param workMode any
function WorkMode:loadWorkModeFromXML(xmlFile, key, workMode) end

--- Switches to the given mode: unless `noEventSend` is set, it sends SetWorkModeEvent (broadcast from the server, request from a client). Then it swaps animations, effects, variable work width, work-area drop indices and moving-tool limits, and raises `onWorkModeChanged`. Silently returns for an invalid index.
---@param state integer
---@param noEventSend boolean
function WorkMode:setWorkMode(state, noEventSend) end

--- Returns false for a work area that the active mode maps to drop area 0; otherwise defers to the parent implementation.
---@param superFunc any
---@param workArea any
function WorkMode:getIsWorkAreaActive(superFunc, workArea) end

--- Always returns true, so the implement can be selected whatever the parent logic says.
---@param superFunc any
function WorkMode:getCanBeSelected(superFunc) end

--- Returns the parent result, or true if the active mode defines lowering animations; the warning from the parent is passed through.
---@param superFunc any
function WorkMode:getAllowsLowering(superFunc) end

--- Reads the optional `#workModeIndex` of a spray type, then calls the parent loader.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param sprayType any
function WorkMode:loadSprayTypeFromXML(superFunc, xmlFile, key, sprayType) end

--- Returns false when the spray type is bound to a work mode other than the current one; otherwise defers to the parent.
---@param superFunc any
---@param sprayType any
function WorkMode:getIsSprayTypeActive(superFunc, sprayType) end

--- Calls the parent loader and, if it succeeds, reads `#allowWhileChangingWorkMode` (default true) into the moving tool entry.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param entry any
function WorkMode:loadMovingToolFromXML(superFunc, xmlFile, key, entry) end

--- Returns false for a moving tool that forbids movement during mode changes while any mode-change animation is playing; otherwise defers to the parent.
---@param superFunc any
---@param movingTool any
function WorkMode:getIsMovingToolActive(superFunc, movingTool) end

--- Returns false while any mode-change animation is playing or if the parent says effects are hidden; otherwise true.
---@param superFunc any
function WorkMode:getAreEffectsVisible(superFunc) end

--- Returns false if the fold position lies outside the configured fold limits, or if changing while lowered is forbidden and the implement's attacher joint is moving down; otherwise true.
---@return boolean
function WorkMode:getIsWorkModeChangeAllowed() end

--- Client only: stops windrower effects, sets the turned-on animations to fade out and stops the mode's animation nodes.
function WorkMode:onTurnedOff() end

--- Client only: sets the turned-on animations to fade in and starts the animation nodes of the active mode.
function WorkMode:onTurnedOn() end

--- Plays or reverses the active mode's lowering animations when the tool is lowered or raised. If the tool is mid-fold the request is postponed. Note: it compares against `self.foldMiddleAnimTime`, whereas other code uses `spec_foldable.foldMiddleAnimTime`, which looks inconsistent.
---@param lowered boolean
function WorkMode:onSetLowered(lowered) end

--- When unfolding starts, re-arms the repeat flag of the mode animations and asks the attacher vehicle to raise the implement if it is still lowered.
---@param direction integer
---@param moveToMiddle any
function WorkMode:onFoldStateChanged(direction, moveToMiddle) end

--- Client only: registers the cycle action `TOGGLE_WORKMODE` and one direct action per mode with an input binding; all start inactive and are enabled later by onUpdate.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function WorkMode:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that moves to the next mode, wrapping back to the first one, and applies it via setWorkMode (which sends the event).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WorkMode.actionEventWorkModeChange(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback that selects the mode bound to the triggered action, if it differs from the current one.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function WorkMode.actionEventWorkModeChangeDirect(self, actionName, inputValue, callbackState, isAnalog) end
