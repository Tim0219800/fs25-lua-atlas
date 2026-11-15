---@meta
-- FS25 1.25.1.0 : vehicles/VehicleStateRecorder.lua (generated stub, FS25 Lua Atlas)

---@class VehicleStateRecorder
VehicleStateRecorder = {}

---@param vehicle any
---@param name any
---@param duration any
---@param animationName any
function VehicleStateRecorder.new(vehicle, name, duration, animationName) end

---@param dt any
function VehicleStateRecorder:update(dt) end

function VehicleStateRecorder:finish() end

function VehicleStateRecorder:recordVehicle() end

---@param node any
---@param indexPath any
---@param separator any
function VehicleStateRecorder:recordNode(node, indexPath, separator) end

---@param unusedSelf any
---@param name any
---@param duration any
function VehicleStateRecorder.consoleCommand(unusedSelf, name, duration) end

---@param unusedSelf any
---@param animationName any
function VehicleStateRecorder.consoleCommandAnimation(unusedSelf, animationName) end
