---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Motorbike.lua (generated stub, FS25 Lua Atlas)

--- Specialization for motorbikes. It requires AnimatedVehicle and Motorized. It tilts a node in corners, plays a foot animation at low speed and a backward-walking animation in reverse, and reduces the steering range at higher speeds; on leaving, a fallen bike is stood up again on the server.
---@class Motorbike
Motorbike = {}

--- Returns true only if the vehicle type has both AnimatedVehicle and Motorized.
---@param specializations any
function Motorbike.prerequisitesPresent(specializations) end

--- Registers the XML paths under vehicle.motorbike: tilt (node, maxTilt, idleTilt, backwardTilt, tiltSpeed), foot and backward animations, and steering high-speed scale and threshold.
function Motorbike.initSpecialization() end

--- Empty: registers no new vehicle functions.
---@param vehicleType any
function Motorbike.registerFunctions(vehicleType) end

--- Empty: overrides no vehicle functions.
---@param vehicleType any
function Motorbike.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, post-load, update and leave-vehicle events.
---@param vehicleType any
function Motorbike.registerEventListeners(vehicleType) end

--- Reads the XML tilt, animation and steering settings, converts tiltSpeed to per millisecond, applies the idle tilt to the node and stores the motor's maximum backward speed. Note: the tilt node is used without a nil check.
---@param savegame any
function Motorbike:onLoad(savegame) end

--- Stores the vehicle's original steering limits (minRotTime, maxRotTime, wheelSteeringDuration) as the reference for later speed scaling.
---@param savegame any
function Motorbike:onPostLoad(savegame) end

--- Each frame it moves the tilt node toward a target based on speed and steering (idle or backward values when slow or reversing), toggles the foot and backward animations, and scales the steering limits down as speed rises.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorbike:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Server only: if the bike's up axis points mostly sideways or down (Y below 0.5), it is removed from physics and repositioned at the same spot with only its heading kept, so it stands upright again.
function Motorbike:onLeaveVehicle() end
