---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyCombine.lua (generated stub, FS25 Lua Atlas)

--- AI drive strategy (subclass of AIDriveStrategy) that supervises combines and forage harvesters during AI field work. It collects every vehicle with the Combine specialization in the root vehicle tree, manages pipe state, beacon lights, full-tank notifications, slow-down near full and a wait-for-straw mode in headland turns. It runs next to the field course strategy and only returns a drive override (stop, speed cap or a target point) from getDriveData.
---@class AIDriveStrategyCombine : AIDriveStrategy
AIDriveStrategyCombine = {}

--- Constructor. Initialises the combine list, notification and beacon flags, the slow-down thresholds (fill level 200, start speed 20) and the wait-for-straw state variables.
---@param reconstructionData any
---@param customMt any
function AIDriveStrategyCombine.new(reconstructionData, customMt) end

--- Calls the parent method, then walks all child vehicles of the root vehicle and stores those that have the Combine specialization in self.combines.
---@param vehicle any
function AIDriveStrategyCombine:setAIVehicle(vehicle) end

--- For pipe-equipped units whose discharge capacity is infinite (forage harvesters) and while not turning, picks a forced fill type from the nearest trailer in the pipe triggers, or clears it when the harvester already holds a fill type. Per frame.
---@param dt any
function AIDriveStrategyCombine:update(dt) end

--- Main logic. Forage harvesters wait until a trailer is in reach and the pipe hits it. Grain combines open or fold the pipe, flash beacons and warn at 80 percent fill, show a full-tank notification, slow down near capacity, and stop when full or while unloading. Returns a stop, a speed cap, or a rear or return target point.
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyCombine:getDriveData(dt, vX, vY, vZ) end

--- Empty override, does nothing in this class.
---@param dt any
function AIDriveStrategyCombine:updateDriving(dt) end
