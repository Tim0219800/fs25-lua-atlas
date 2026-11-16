---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LiftableAxle.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function LiftableAxle.prerequisitesPresent(specializations) end

--- Registers the `liftableAxle` configuration type, the XML paths (base and per configuration) and the savegame attributes `state` and `height`.
function LiftableAxle.initSpecialization() end

--- Registers the XML paths of one liftable axle block: input action, animation name and speed, default state, fill unit and threshold, dependent (input) attacher joints with min/max joint heights, and lift/lower texts.
---@param schema any
---@param basePath any
function LiftableAxle.registerXMLPaths(schema, basePath) end

--- Registers `setLiftableAxleState` and `getLiftableAxleAttacherJointHeight` on the vehicle type.
---@param vehicleType table
function LiftableAxle.registerFunctions(vehicleType) end

--- Overrides `getIsSmoothAttachUpdateAllowed`.
---@param vehicleType table
function LiftableAxle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onFillUnitFillLevelChanged, onPreAttachImplement, onPreDetachImplement, onPreAttach, onPreDetach and onRegisterActionEvents.
---@param vehicleType table
function LiftableAxle.registerEventListeners(vehicleType) end

--- Picks the configuration block and loads animation, fill unit trigger, dependent joint data and texts. A numeric `defaultState` other than 0/1 becomes a fixed height. Removes every listener that is not needed (no animation, client/server role, missing data).
---@param savegame table
function LiftableAxle:onLoad(savegame) end

--- Restores the saved state and height (unless vehicles are reset) and applies them immediately without animation and without sending an event.
---@param savegame any
function LiftableAxle:onPostLoad(savegame) end

--- Saves the axle state and, if set, the fixed height; does nothing when no animation is configured.
---@param xmlFile any
---@param key any
---@param usedModNames any
function LiftableAxle:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client join: reads the state and optional fixed height and applies them instantly.
---@param streamId any
---@param connection any
function LiftableAxle:onReadStream(streamId, connection) end

--- Server join: writes the state and the optional fixed height.
---@param streamId any
---@param connection any
function LiftableAxle:onWriteStream(streamId, connection) end

--- Server only, once the vehicle is synchronised: when the watched fill unit changes, lifts the axle if its fill percentage exceeds the threshold, lowers it otherwise.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function LiftableAxle:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- When an implement is attached to a listed joint, computes the axle fraction that matches the implement's attacher height and sets it as a fixed height.
---@param object any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param loadFromSavegame any
function LiftableAxle:onPreAttachImplement(object, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

--- When an implement leaves a listed joint, deactivates it; if no listed joint remains active, returns to the default state or default fixed height.
---@param implement any
function LiftableAxle:onPreDetachImplement(implement) end

--- When this vehicle is attached via a listed input joint, reads the parent's hitch height (via `getLiftableAxleAttacherJointHeight` or the mean of its upper and lower distance) and sets the matching fixed height.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function LiftableAxle:onPreAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- When detached from the parent through a listed input joint, deactivates it and restores the default state or height if no such joint remains active.
---@param attacherVehicle any
---@param implement any
function LiftableAxle:onPreDetach(attacherVehicle, implement) end

--- Client: registers the configured input action (high text priority) while the vehicle is active for input, and refreshes its label.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function LiftableAxle:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: toggles the axle state.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function LiftableAxle.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

--- Sets the input hint to the lift or lower text depending on the current state.
---@param self any
function LiftableAxle.updateActionEvents(self) end

--- Sets the lift state, optionally a fixed height (0 to 1, which also forces state to height >= 0.5), and plays the animation, or skips it. Always calls `LiftableAxleEvent.sendEvent` for multiplayer sync unless `noEventSend` is set.
---@param state any
---@param fixedHeight any
---@param skipAnimation any
---@param noEventSend any
function LiftableAxle:setLiftableAxleState(state, fixedHeight, skipAnimation, noEventSend) end

--- Returns the current hitch height for an attacher joint covered by an active dependent joint entry, or nil otherwise.
---@param attacherJointIndex any
function LiftableAxle:getLiftableAxleAttacherJointHeight(attacherJointIndex) end

--- Override: smooth attach updating is refused while the axle animation is playing.
---@param superFunc any
---@param implement any
function LiftableAxle:getIsSmoothAttachUpdateAllowed(superFunc, implement) end
