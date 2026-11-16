---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ReverseDriving.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for tractors with a reversible driver seat (reverse driving). Requires Drivable, Enterable and AnimatedVehicle. A named animation (default reverseDriving) turns the cab, the steering wheel and character IK targets are swapped, the reverser direction and light direction follow, and the AI uses a dedicated steering node. The state is saved (isActive), sent to joining clients in the stream and synchronised by ReverseDrivingSetStateEvent. Raises onStartReverseDirectionChange and onReverseDirectionChanged.
---@class ReverseDriving
ReverseDriving = {}

--- Returns true only if Drivable, Enterable and AnimatedVehicle are all present on the vehicle type.
---@param specializations table
---@return boolean
function ReverseDriving.prerequisitesPresent(specializations) end

--- Registers XML schema entries under vehicle.reverseDriving (IK targets, steering wheel, animation name, character hiding, inverse transmission, initial state, disabling attacher joints, AI nodes), a dashboard group flag, per-light enableDirection, and the savegame isActive key.
function ReverseDriving.initSpecialization() end

--- For every vehicle configuration type, registers the optional reverseDriving#isAllowed boolean (default true) so a configuration can forbid reverse driving.
function ReverseDriving.postInitSpecialization() end

--- Declares the events onStartReverseDirectionChange and onReverseDirectionChanged on the vehicle type.
---@param vehicleType any
function ReverseDriving.registerEvents(vehicleType) end

--- Registers reverseDirectionChanged, setIsReverseDriving and getIsReverseDrivingAllowed on the vehicle type.
---@param vehicleType any
function ReverseDriving.registerFunctions(vehicleType) end

--- Overrides steering wheel and direction, character visibility, AI start and AI node getters, dashboard group loading and activity, selection, additional light attributes and light activity.
---@param vehicleType any
function ReverseDriving.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onVehicleCharacterChanged and onRegisterActionEvents.
---@param vehicleType any
function ReverseDriving.registerEventListeners(vehicleType) end

--- Reads XML settings (reversed IK targets, steering wheel, animation name, options, AI steering node and collision trigger) and applies configuration restrictions. hasReverseDriving is true only if the animation exists and no configuration forbids it; otherwise most listeners are removed.
---@param savegame table
function ReverseDriving:onLoad(savegame) end

--- Caches the default character IK targets, restores the saved isActive state (or the initial one) and applies it with setIsReverseDriving without sending an event and with a forced update.
---@param savegame table
function ReverseDriving:onPostLoad(savegame) end

--- Writes the reverse driving state to the savegame, only if the vehicle supports reverse driving.
---@param xmlFile any
---@param key any
---@param usedModNames any
function ReverseDriving:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads a bool from the stream and applies it as the reverse driving state without sending an event.
---@param streamId integer
---@param connection Connection
function ReverseDriving:onReadStream(streamId, connection) end

--- Server side on join: writes the current reverse driving state as a bool.
---@param streamId integer
---@param connection Connection
function ReverseDriving:onWriteStream(streamId, connection) end

--- While the direction is changing: hides the character if configured, fast-forwards the animation for a vehicle nobody sits in, calls reverseDirectionChanged when the animation ends, and moves smoothReverserDirection toward the target.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ReverseDriving:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Ends the change: sets the reverser direction (-1 reversed, 1 normal), restores the proper IK targets and character visibility, refreshes the light mask and raises onReverseDirectionChanged with the given direction.
---@param direction number
function ReverseDriving:reverseDirectionChanged(direction) end

--- Switches reverse driving: plays the animation forward or backward, freezes character IK updates, optionally inverts the transmission direction, zeroes the reverser, raises onStartReverseDirectionChange, sends ReverseDrivingSetStateEvent unless noEventSend, and marks the AI root node dirty. Runs also when forceUpdate is set, completing the animation instantly.
---@param isReverseDriving boolean
---@param noEventSend boolean
---@param forceUpdate any
function ReverseDriving:setIsReverseDriving(isReverseDriving, noEventSend, forceUpdate) end

--- Returns false when asked to enable reverse driving while an implement is attached on one of the disabling attacher joints; true otherwise.
---@param newState any
function ReverseDriving:getIsReverseDrivingAllowed(newState) end

--- Overridden: when reversed, uses the dedicated reverse steering wheel (if defined) and negates the steering direction before calling the parent.
---@param superFunc any
---@param steeringWheel any
---@param dt any
---@param direction any
function ReverseDriving:updateSteeringWheel(superFunc, steeringWheel, dt, direction) end

--- Overridden: returns the smoothed reverser direction when reverse driving is supported, else the parent value.
---@param superFunc any
function ReverseDriving:getSteeringDirection(superFunc) end

--- Overridden: the parent result, but false while the direction is changing if the character is configured to be hidden during the change.
---@param superFunc any
function ReverseDriving:getAllowCharacterVisibilityUpdate(superFunc) end

--- Overridden: if the vehicle has no AI steering node but supports reverse driving, the AI cannot start while reversed or while changing direction. Otherwise defers to the parent.
---@param superFunc any
---@param jobClass any
function ReverseDriving:getCanStartAIVehicle(superFunc, jobClass) end

--- Overridden: after the parent loads a dashboard group, also reads its isReverseDriving condition. Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function ReverseDriving:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Overridden: a group with an isReverseDriving condition is inactive when it does not match the current state; otherwise the parent decides.
---@param superFunc any
---@param group any
function ReverseDriving:getIsDashboardGroupActive(superFunc, group) end

--- Overridden to always return true.
---@param superFunc any
function ReverseDriving:getCanBeSelected(superFunc) end

--- Overridden: after the parent, reads the optional enableDirection attribute of a light. Returns false if the parent fails.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param light any
function ReverseDriving:loadAdditionalLightAttributesFromXML(superFunc, xmlFile, key, light) end

--- Overridden: a light with enableDirection is inactive unless it equals the current reverser direction; otherwise the parent decides.
---@param superFunc any
---@param light any
function ReverseDriving:getIsLightActive(superFunc, light) end

--- Overridden: while reversed returns the AI steering node if defined, else the parent node.
---@param superFunc any
function ReverseDriving:getAIDirectionNode(superFunc) end

--- Overridden: while reversed returns the AI steering node if defined, else the parent node.
---@param superFunc any
function ReverseDriving:getAIRootNode(superFunc) end

--- Overridden: while reversed returns the reverse AI collision trigger if one was loaded, else the parent trigger.
---@param superFunc any
function ReverseDriving:getAIImplementCollisionTrigger(superFunc) end

--- When a character is set, finishes any pending animation update and assigns the reversed or default IK targets to it.
---@param character any
function ReverseDriving:onVehicleCharacterChanged(character) end

--- On clients, registers the CHANGE_DRIVING_DIRECTION action (powered action event) when active for input, with its label.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ReverseDriving:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: toggles reverse driving if getIsReverseDrivingAllowed accepts the new state.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function ReverseDriving.actionEventToggleReverseDriving(self, actionName, inputValue, callbackState, isAnalog) end
