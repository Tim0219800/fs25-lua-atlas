---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HookLiftContainer.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for containers carried by a hooklift trailer. It requires AnimatedVehicle and Attachable. It cooperates with HookLiftTrailer: it blocks discharge and detaching unless the trailer allows them, makes the trailer tilt when the container tips, forwards physics add/remove to the trailer, and toggles a lock visual and connection hoses. It defines visual roll reference nodes read by the trailer.
---@class HookLiftContainer
HookLiftContainer = {}

--- Returns true only if the vehicle type has both AnimatedVehicle and Attachable.
---@param specializations table
---@return boolean
function HookLiftContainer.prerequisitesPresent(specializations) end

--- Registers the XML keys: tiltContainerOnDischarge, the visualRollReference start and end nodes (bottom of the container) and the object changes of containerLock.
function HookLiftContainer.initSpecialization() end

--- Registers onHookLiftContainerLockChanged as a vehicle function, called by the trailer.
---@param vehicleType any
function HookLiftContainer.registerFunctions(vehicleType) end

--- Overrides getCanDischargeToObject, getCanDischargeToGround, isDetachAllowed, addToPhysics, removeFromPhysics and getBrakeForce.
---@param vehicleType any
function HookLiftContainer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onStartTipping and onStopTipping.
---@param vehicleType any
function HookLiftContainer.registerEventListeners(vehicleType) end

--- Reads the tilt option, the visual reference nodes and the lock object changes (set to off), and switches connection hoses off if the vehicle has them.
---@param savegame table
function HookLiftContainer:onLoad(savegame) end

--- Returns false when the carrying trailer says tipping is not allowed (getIsTippingAllowed), otherwise defers to the parent check.
---@param superFunc any
---@param dischargeNode any
function HookLiftContainer:getCanDischargeToObject(superFunc, dischargeNode) end

--- Same rule as for objects: ground discharge is refused while the carrying trailer does not allow tipping, otherwise the parent decides.
---@param superFunc any
---@param dischargeNode any
function HookLiftContainer:getCanDischargeToGround(superFunc, dischargeNode) end

--- Returns false (with nil as second value) unless the trailer reports it can detach the container, otherwise defers to the parent.
---@param superFunc any
function HookLiftContainer:isDetachAllowed(superFunc) end

--- If tiltContainerOnDischarge is enabled, asks the carrying trailer to start its tipping animation.
---@param tipSideIndex any
function HookLiftContainer:onStartTipping(tipSideIndex) end

--- If tiltContainerOnDischarge is enabled, asks the carrying trailer to play its tipping animation back.
function HookLiftContainer:onStopTipping() end

--- Called by the trailer when the lock state changes: switches the container's connection hoses (if attached) and applies the containerLock object changes. Assumes an attacher vehicle exists.
---@param state any
function HookLiftContainer:onHookLiftContainerLockChanged(state) end

--- After the parent adds the container to physics, notifies the carrying trailer (setHookLiftContainerPhysicsState true). Returns false if the parent failed.
---@param superFunc any
function HookLiftContainer:addToPhysics(superFunc) end

--- Notifies the carrying trailer first (physics state false), then lets the parent remove the container. Returns false if the parent failed.
---@param superFunc any
---@return boolean
function HookLiftContainer:removeFromPhysics(superFunc) end

--- Returns 0 while the container is attached to a vehicle (no own braking), otherwise the parent value.
---@param superFunc any
function HookLiftContainer:getBrakeForce(superFunc) end
