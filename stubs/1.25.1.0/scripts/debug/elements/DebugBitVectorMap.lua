---@meta
-- FS25 1.25.1.0 : debug/elements/DebugBitVectorMap.lua (generated stub, FS25 Lua Atlas)

---@class DebugBitVectorMap
DebugBitVectorMap = {}

---@param customMt table?
---@return DebugBitVectorMap
function DebugBitVectorMap.new(customMt) end

function DebugBitVectorMap:draw() end

---@param vehicle table
---@return DebugBitVectorMap
function DebugBitVectorMap:createWithAIVehicle(vehicle) end

---@param customFunc function
---@return DebugBitVectorMap
function DebugBitVectorMap:createWithCustomFunc(customFunc) end

---@param drawInfoFunc function
---@return DebugBitVectorMap
function DebugBitVectorMap:setAdditionalDrawInfoFunc(drawInfoFunc) end

---@param startWorldX any
---@param startWorldZ any
---@param widthWorldX any
---@param widthWorldZ any
---@param heightWorldX any
---@param heightWorldZ any
function DebugBitVectorMap:aiAreaCheck(startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ) end
