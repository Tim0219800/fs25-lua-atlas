---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyBaler.lua (generated stub, FS25 Lua Atlas)

--- AI drive strategy (extends `AIDriveStrategy`) for balers. It collects the baler vehicle and attached AI implements that have the `Baler` specialization, slows the AI as the bale chamber fills and stops it while a bale is full or unloading. For balers with non-stop baling it only caps speed during platform drops.
---@class AIDriveStrategyBaler : AIDriveStrategy
AIDriveStrategyBaler = {}

--- Constructor; initializes the baler list and the slow-down settings (free capacity threshold 200, start speed 20).
---@param reconstructionData any
---@param customMt any
function AIDriveStrategyBaler.new(reconstructionData, customMt) end

--- Calls the parent, then collects the vehicle and its attached AI implements that carry the `Baler` specialization into the baler list.
---@param vehicle any
function AIDriveStrategyBaler:setAIVehicle(vehicle) end

--- Empty per-frame override.
---@param dt any
function AIDriveStrategyBaler:update(dt) end

--- For each baler, limits speed to 2 km/h plus a share of the start speed when free capacity is low, and forbids driving when full or unloading. Returns a stop request (0, 1, true, 0, math.huge) if blocked, else only a max speed.
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyBaler:getDriveData(dt, vX, vY, vZ) end

--- Empty override.
---@param dt any
function AIDriveStrategyBaler:updateDriving(dt) end
