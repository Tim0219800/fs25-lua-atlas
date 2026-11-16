---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HydraulicHammer.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization for a hydraulic hammer that breaks destructible map objects. It requires TurnOnVehicle and AnimatedVehicle. While turned on, it periodically casts a short ray from a work node, asks the mission's destructible map object system for the destructible hit, checks land access for the owner farm and adds damage per hit. On clients it plays effects, sounds (pitch shifted by progress), animation nodes and an optional hit animation. The destructible system class itself is not in this dump (UNVERIFIED).
---@class HydraulicHammer
HydraulicHammer = {}

--- Returns true only if the vehicle type has both TurnOnVehicle and AnimatedVehicle.
---@param specializations table
---@return boolean
function HydraulicHammer.prerequisitesPresent(specializations) end

--- Registers the XML schema under vehicle.hydraulicHammer: work node (raycast node, aligned node, damage, hit interval, raycast distance, supported types), effects, start/stop/idle/work sounds with a progress pitch factor, animation nodes and a hit animation.
function HydraulicHammer.initSpecialization() end

--- Registers hydraulicHammerRaycastCallback as a vehicle function.
---@param vehicleType any
function HydraulicHammer.registerFunctions(vehicleType) end

--- Overrides getDirtMultiplier, getWearMultiplier and getConsumingLoad to account for recent hammering.
---@param vehicleType any
function HydraulicHammer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn and onTurnedOff.
---@param vehicleType any
function HydraulicHammer.registerEventListeners(vehicleType) end

--- Loads the work node settings (damage per hit, hit interval range in ms, ray distance, supported destructible types), the static-object collision mask and, on clients, effects, sounds, animation nodes and the hit animation. Note: code defaults (damage 1, distance 0.4) differ from the schema defaults (5, 0.3).
---@param savegame table
function HydraulicHammer:onLoad(savegame) end

--- Deletes the sound samples, animation nodes and work node effects.
function HydraulicHammer:onDelete() end

--- While turned on and once the next hit time is reached, stops effects and fires a closest-hit raycast down the work node's -Y axis against static objects. The callback handles the hit.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function HydraulicHammer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Raycast callback. Finds the destructible at the hit, refuses (with a warning to the driver) if the farm has no land access or the type is unsupported, otherwise adds damage and plays hit animation, pitch-shifted sound and effects, then schedules the next hit. Returns false to stop further callbacks when handled.
---@param actorId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function HydraulicHammer:hydraulicHammerRaycastCallback(actorId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Client only: stops the work node effects when the vehicle is deactivated.
function HydraulicHammer:onDeactivate() end

--- Client only: stops all sounds, plays the start sound then the idle sound after it, and starts the animation nodes.
function HydraulicHammer:onTurnedOn() end

--- Client only: stops effects, sounds, animation nodes and the hit animation, and plays the stop sound.
function HydraulicHammer:onTurnedOff() end

--- Adds the work dirt multiplier to the parent value if a hit occurred in the last 500 ms.
---@param superFunc any
---@return number
function HydraulicHammer:getDirtMultiplier(superFunc) end

--- Adds the work wear multiplier to the parent value if a hit occurred in the last 500 ms.
---@param superFunc any
---@return number
function HydraulicHammer:getWearMultiplier(superFunc) end

--- Adds one unit of load (value and count) to the parent result while a hit occurred in the last 500 ms.
---@param superFunc any
function HydraulicHammer:getConsumingLoad(superFunc) end
