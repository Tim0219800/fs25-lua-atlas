---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ExternalVehicleControl.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that lets an on-foot player operate vehicle functions from outside the vehicle. Player triggers are declared under vehicle.externalVehicleControl; other specializations answer the onRegisterExternalActionEvents event to add actions per trigger. A helper class, ExternalVehicleControlActivatable, plugs each trigger into the activatable-objects system and handles input registration. Note: the file does not create the ExternalVehicleControl table or FUNCTION_XML_PATH itself (UNVERIFIED where they are defined).
---@class ExternalVehicleControlActivatable
ExternalVehicleControlActivatable = {}

--- Always returns true: no prerequisite specialization is needed.
---@param specializations table
---@return boolean
function ExternalVehicleControl.prerequisitesPresent(specializations) end

--- Registers the trigger node XML key (vehicle.externalVehicleControl.trigger(?)#node) and the delayed function path with its name attribute, so other specializations can add their own sub-keys.
function ExternalVehicleControl.initSpecialization() end

--- Declares the custom vehicle event onRegisterExternalActionEvents.
---@param vehicleType table
function ExternalVehicleControl.registerEvents(vehicleType) end

--- Registers the vehicle function registerExternalActionEvent.
---@param vehicleType table
function ExternalVehicleControl.registerFunctions(vehicleType) end

--- Empty: this specialization overrides no vehicle function.
---@param vehicleType table
function ExternalVehicleControl.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoadFinished, onDelete and onUpdateTick.
---@param vehicleType table
function ExternalVehicleControl.registerEventListeners(vehicleType) end

--- Builds the trigger list from XML (warns if the node lacks the PLAYER collision bit), adds each trigger, raises onRegisterExternalActionEvents for every named function and creates its activatable. With no trigger, it removes the onDelete and onUpdateTick listeners.
---@param savegame table
function ExternalVehicleControl:onLoadFinished(savegame) end

--- Removes each trigger from the engine and its activatable from the activatable-objects system.
function ExternalVehicleControl:onDelete() end

--- For every trigger with the player in range, refreshes the activatable text and keeps the vehicle awake with raiseActive.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ExternalVehicleControl:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Adds an action entry (registration callback and optional text-update callback) to a trigger's control function list and returns that entry. Meant to be called from onRegisterExternalActionEvents listeners.
---@param trigger any
---@param name any
---@param registerFunc any
---@param updateFunc any
function ExternalVehicleControl:registerExternalActionEvent(trigger, name, registerFunc, updateFunc) end

--- Trigger callback: only reacts to the local player's root node. On enter it marks the player in range and adds the activatable; on any other state it clears the flag and removes it.
---@param trigger integer
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function ExternalVehicleControl.onExternalVehicleControlTriggerCallback(trigger, triggerId, otherId, onEnter, onLeave, onStay) end

--- Constructor: stores the vehicle and trigger, initializes an empty activate text and calls updateText once.
---@param vehicle any
---@param trigger any
function ExternalVehicleControlActivatable.new(vehicle, trigger) end

--- Calls each registered control function's registration callback with the vehicle, but only in the on-foot player input context, to avoid failed registrations when tabbing into the vehicle.
---@param inputContext any
function ExternalVehicleControlActivatable:registerCustomInput(inputContext) end

--- Removes the input action events registered for each control function of the trigger.
---@param inputContext any
function ExternalVehicleControlActivatable:removeCustomInput(inputContext) end

--- Returns true if the player may access the vehicle (access handler) and is inside the trigger.
function ExternalVehicleControlActivatable:getIsActivatable() end

--- Empty: activation does nothing by itself, actions come from the registered input events.
function ExternalVehicleControlActivatable:run() end

--- Returns the distance from the given world position to the trigger node.
---@param x any
---@param y any
---@param z any
function ExternalVehicleControlActivatable:getDistance(x, y, z) end

--- Calls each control function's update callback (if any) with the vehicle so action texts and states stay current.
function ExternalVehicleControlActivatable:updateText() end
