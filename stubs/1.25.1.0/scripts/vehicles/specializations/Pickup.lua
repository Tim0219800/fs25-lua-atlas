---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Pickup.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements with a pickup that can be lowered on its own (forage wagon, baler and similar). It requires AnimatedVehicle. It stores the lowered state, plays a configurable lift or lower animation, syncs the state through PickupSetStateEvent, adds a LOWER_IMPLEMENT action, registers a controlled action for the root vehicle's action controller, and raises dirt and wear while the pickup is lowered and working.
---@class Pickup
Pickup = {}

--- Returns true only if the vehicle type has the AnimatedVehicle specialization.
---@param specializations any
function Pickup.prerequisitesPresent(specializations) end

--- Registers the XML paths of the pickup animation (name, lowerSpeed, liftSpeed, isDefaultLowered) under the key held in Pickup.PICKUP_XML_KEY, which is defined outside the lines visible in this dump (UNVERIFIED value).
function Pickup.initSpecialization() end

--- Registers allowPickingUp, setPickupState, loadPickupFromXML and getCanChangePickupState on the vehicle type.
---@param vehicleType any
function Pickup.registerFunctions(vehicleType) end

--- Overrides getIsLowered, dirt and wear multipliers, both lowering action event registrations, and the ground and object discharge checks.
---@param vehicleType any
function Pickup.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, stream read/write, lower-all, root vehicle changed and fold time changed events.
---@param vehicleType any
function Pickup.registerEventListeners(vehicleType) end

--- Loads the pickup settings from the vehicle.pickup XML key into the spec via loadPickupFromXML.
---@param savegame any
function Pickup:onLoad(savegame) end

--- If an animation exists, jumps it to its end position at once: lowered when default-lowered is set (and marks the state lowered), lifted otherwise.
---@param savegame any
function Pickup:onPostLoad(savegame) end

--- Client on join: reads the lowered flag and applies it with setPickupState without sending an event.
---@param streamId any
---@param connection any
function Pickup:onReadStream(streamId, connection) end

--- Server on join: writes the current lowered flag.
---@param streamId any
---@param connection any
function Pickup:onWriteStream(streamId, connection) end

--- Follows the lower-all command of the vehicle chain by setting the pickup state to the requested lowering value.
---@param doLowering any
---@param jointDescIndex any
function Pickup:onSetLoweredAll(doLowering, jointDescIndex) end

--- Registers (or re-parents) a lowerPickup controlled action on the new root vehicle's action controller, saved with AI line-start and end listeners if the AI needs lowering; removes it when no controller applies. Skipped when there is no animation.
---@param rootVehicle table
function Pickup:onRootVehicleChanged(rootVehicle) end

--- Refreshes the lowering action event text and availability when the fold time changes.
---@param foldAnimTime number
function Pickup:onFoldTimeChanged(foldAnimTime) end

--- Action controller callback: lowers the pickup when the direction is positive, lifts it otherwise, and returns true.
---@param direction any
function Pickup:actionControllerLowerPickupEvent(direction) end

--- Changes the lowered state if it differs, sends PickupSetStateEvent unless noEventSend, plays the lower or lift animation from the current time and refreshes the action event.
---@param isPickupLowered any
---@param noEventSend any
function Pickup:setPickupState(isPickupLowered, noEventSend) end

--- Returns true while the pickup is lowered, meaning crop can be picked up.
function Pickup:allowPickingUp() end

--- Returns the pickup's own lowered state, ignoring the default argument and the parent.
---@param superFunc any
---@param default any
function Pickup:getIsLowered(superFunc, default) end

--- Reads the animation name and speeds from a given key into the given spec table. If the animation is missing, the name is cleared and the state is lowered. The lift speed defaults to the negated lower speed. Always returns true.
---@param xmlFile any
---@param key any
---@param spec any
function Pickup:loadPickupFromXML(xmlFile, key, spec) end

--- Hook that always returns true; it takes the spec table and the new state as arguments and can be overridden by other code to restrict toggling.
---@param spec any
---@param newState any
function Pickup:getCanChangePickupState(spec, newState) end

--- While the pickup is lowered and the vehicle is on (or cannot be turned on), adds the work dirt multiplier scaled by speed over the speed limit to the parent value.
---@param superFunc any
function Pickup:getDirtMultiplier(superFunc) end

--- While the pickup is lowered and the vehicle is on (or cannot be turned on), adds the work wear multiplier scaled by speed over the speed limit to the parent value.
---@param superFunc any
function Pickup:getWearMultiplier(superFunc) end

--- When an animation exists, registers a powered LOWER_IMPLEMENT toggle action for the pickup and skips the parent registration if that input is the requested one; otherwise calls the parent.
---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
function Pickup:registerLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName) end

--- Delegates to the same logic as registerLoweringActionEvent.
---@param superFunc any
---@param actionEventsTable any
---@param inputAction any
---@param target any
---@param callback any
---@param triggerUp any
---@param triggerDown any
---@param triggerAlways any
---@param startActive any
---@param callbackState any
---@param customIconName any
---@param ignoreCollisions any
function Pickup:registerSelfLoweringActionEvent(superFunc, actionEventsTable, inputAction, target, callback, triggerUp, triggerDown, triggerAlways, startActive, callbackState, customIconName, ignoreCollisions) end

--- Returns false while the pickup is lowered, unless spec_pickup.allowWhileTipping is set (not set anywhere in this file); otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function Pickup:getCanDischargeToGround(superFunc, dischargeNode) end

--- Returns false while the pickup is lowered, unless spec_pickup.allowWhileTipping is set (not set anywhere in this file); otherwise defers to the parent.
---@param superFunc any
---@param dischargeNode any
function Pickup:getCanDischargeToObject(superFunc, dischargeNode) end

--- Static helper: sets the lift or lower text on the LOWER_IMPLEMENT action and enables it according to getCanChangePickupState; only when an animation exists.
---@param self any
function Pickup.updateActionEvents(self) end

--- Input callback: toggles the pickup state if getCanChangePickupState allows it.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Pickup.actionEventTogglePickup(self, actionName, inputValue, callbackState, isAnalog) end
