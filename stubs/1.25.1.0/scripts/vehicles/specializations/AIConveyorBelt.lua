---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIConveyorBelt.lua (generated stub, FS25 Lua Atlas)

--- Specialization that lets a motorized conveyor belt vehicle be started as an AI job (AIJobType.CONVEYOR): the vehicle swings back and forth around its starting heading within a configurable angle. It requires AIFieldWorker and Motorized, and is only active when the XML contains a vehicle.ai.conveyorBelt node (minAngle, maxAngle, stepSize, speed, direction). The current angle is saved with the vehicle and synced with AIConveyorBeltSetAngleEvent.
---@class AIConveyorBelt
AIConveyorBelt = {}

--- Returns true only if the vehicle type has both the AIFieldWorker and Motorized specializations.
---@param specializations table
---@return boolean
function AIConveyorBelt.prerequisitesPresent(specializations) end

--- Registers the XML keys minAngle (default 5), maxAngle (45), stepSize (5), speed (1) and direction (-1) under vehicle.ai.conveyorBelt, plus the savegame attribute currentAngle.
function AIConveyorBelt.initSpecialization() end

--- Adds setAIConveyorBeltAngle and getDirectionAndSpeedToTargetAngle to the vehicle type.
---@param vehicleType any
function AIConveyorBelt.registerFunctions(vehicleType) end

--- Overrides the AI start checks and job getters, getCanBeSelected and getAINeedsTrafficCollisionBox for conveyor belts.
---@param vehicleType any
function AIConveyorBelt.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, stream, update, update-tick, onAIFieldWorkerStart and action-event registration callbacks.
---@param vehicleType any
function AIConveyorBelt.registerEventListeners(vehicleType) end

--- Reads the XML settings, marks the belt as AI-capable only if the vehicle.ai.conveyorBelt node exists, starts at the maximum angle and creates the conveyor job from the AI job type manager. Removes onUpdate on non-servers and onUpdateTick on non-clients.
---@param savegame table
function AIConveyorBelt:onLoad(savegame) end

--- Restores the saved currentAngle from the savegame unless vehicles are being reset.
---@param savegame any
function AIConveyorBelt:onPostLoad(savegame) end

--- Writes currentAngle to the vehicle's savegame entry.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIConveyorBelt:saveToXMLFile(xmlFile, key, usedModNames) end

--- Client side on join: reads the angle as an int8 and applies it without sending an event.
---@param streamId integer
---@param connection Connection
function AIConveyorBelt:onReadStream(streamId, connection) end

--- Server side on join: writes the current angle as an int8 (so the value is truncated to whole degrees in the signed 8-bit range).
---@param streamId integer
---@param connection Connection
function AIConveyorBelt:onWriteStream(streamId, connection) end

--- Server only, while the AI is active: computes the sweep direction and speed toward the target heading, limits the motor speed and drives the wheel physics accordingly.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIConveyorBelt:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client side: enables the IMPLEMENT_EXTRA3 action while the vehicle is input-active and sets its label to show the current angle in degrees.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIConveyorBelt:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stores the new sweep angle and, unless noEventSend is true, sends or broadcasts AIConveyorBeltSetAngleEvent so all peers agree.
---@param angle any
---@param noEventSend any
function AIConveyorBelt:setAIConveyorBeltAngle(angle, noEventSend) end

--- Compares the first component's current Y rotation to the min or max target and returns a direction and a speed: it reverses with speed 0 when the limit is passed, otherwise speed scales with the remaining angle (0.1 to 1). Angles are in radians.
---@param direction any
---@param minAngle any
---@param maxAngle any
function AIConveyorBelt:getDirectionAndSpeedToTargetAngle(direction, minAngle, maxAngle) end

--- Override: returns the parent result and additionally requires the vehicle.ai.conveyorBelt node to be present in the XML.
---@param superFunc any
function AIConveyorBelt:getCanStartAIVehicle(superFunc) end

--- Returns the same value as getCanStartAIVehicle.
function AIConveyorBelt:getCanStartFieldWork() end

--- Override: if the belt can start, fills the cached conveyor job from the current vehicle state and the local player's farm, and returns it when validation succeeds; otherwise returns nil.
---@param superFunc any
function AIConveyorBelt:getStartableAIJob(superFunc) end

--- Override that always returns true.
---@param superFunc any
function AIConveyorBelt:getHasStartableAIJob(superFunc) end

--- Override that always returns true, so the belt can be selected.
---@param superFunc any
function AIConveyorBelt:getCanBeSelected(superFunc) end

--- Override that returns false: the AI does not need a traffic collision box for this vehicle.
---@param superFunc any
function AIConveyorBelt:getAINeedsTrafficCollisionBox(superFunc) end

--- When the AI job starts, records the current heading and sets the sweep limits to half the current angle on each side, starting in the positive direction.
function AIConveyorBelt:onAIFieldWorkerStart() end

--- Client side: registers the IMPLEMENT_EXTRA3 action to change the angle, only for an input-active vehicle with AI conveyor settings in its XML.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AIConveyorBelt:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback that adds one step to the angle and wraps back to the minimum when the maximum is exceeded.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AIConveyorBelt.actionEventChangeAngle(self, actionName, inputValue, callbackState, isAnalog) end
