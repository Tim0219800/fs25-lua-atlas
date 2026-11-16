---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategy.lua (generated stub, FS25 Lua Atlas)

--- Base class for AI drive strategies. It stores the controlled vehicle and defines empty hooks (`update`, `getDriveData`, `updateDriving`) that concrete strategies override. `getDriveData` is expected to return five values, all nil here, meaning no override.
---@class AIDriveStrategy
AIDriveStrategy = {}

--- Constructor; creates the strategy table with the given metatable (the reconstruction data argument is unused here).
---@param reconstructionData any
---@param customMt any
function AIDriveStrategy.new(reconstructionData, customMt) end

--- Empty cleanup hook for subclasses.
function AIDriveStrategy:delete() end

--- Stores the AI vehicle this strategy controls.
---@param vehicle any
function AIDriveStrategy:setAIVehicle(vehicle) end

--- Empty per-frame hook for subclasses.
---@param dt any
function AIDriveStrategy:update(dt) end

--- Default drive data query returning five nils (no steering, speed or stop request). Subclasses override it to return their driving targets.
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategy:getDriveData(dt, vX, vY, vZ) end

--- Empty hook called while driving, for subclasses.
---@param dt any
function AIDriveStrategy:updateDriving(dt) end

--- Prints a formatted debug line prefixed with AI DEBUG, only when the vehicle debug state is the AI mode.
---@param text any
function AIDriveStrategy:debugPrint(text, ...) end
