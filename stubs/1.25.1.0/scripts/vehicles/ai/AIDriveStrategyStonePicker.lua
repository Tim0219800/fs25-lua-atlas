---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyStonePicker.lua (generated stub, FS25 Lua Atlas)

--- AI drive strategy (subclass of AIDriveStrategy) that stops the AI helper when a stone picker is full or busy discharging. It collects the vehicle and attached AI implements that have the StonePicker specialization, shows a full-tank notification and starts or stops discharge to a target object.
---@class AIDriveStrategyStonePicker : AIDriveStrategy
AIDriveStrategyStonePicker = {}

--- Constructor. Creates the empty stone picker list and the full-tank notification flag.
---@param reconstructionData any
---@param customMt any
function AIDriveStrategyStonePicker.new(reconstructionData, customMt) end

--- Calls the parent method, then stores the vehicle itself and each attached AI implement that has the StonePicker specialization.
---@param vehicle any
function AIDriveStrategyStonePicker:setAIVehicle(vehicle) end

--- Empty override, does nothing.
---@param dt any
function AIDriveStrategyStonePicker:update(dt) end

--- Forbids driving while discharging, while the tip state is not closed, or when full. When full it notifies once and starts discharge if a target exists; discharge stops with no target or an empty tank. Returns a stop (0, 1, true, 0, huge) or only an unlimited speed.
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyStonePicker:getDriveData(dt, vX, vY, vZ) end

--- Empty override, does nothing.
---@param dt any
function AIDriveStrategyStonePicker:updateDriving(dt) end
