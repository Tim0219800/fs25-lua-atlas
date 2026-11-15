---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodContainerWrongLengthEvent.lua (generated stub, FS25 Lua Atlas)

---@class WoodContainerWrongLengthEvent : Event
WoodContainerWrongLengthEvent = {}

---@return table
function WoodContainerWrongLengthEvent.emptyNew() end

---@param object table
---@param state table
---@param x any
---@param y any
---@param z any
---@return table
function WoodContainerWrongLengthEvent.new(object, state, x, y, z) end

---@param streamId integer
---@param connection integer
function WoodContainerWrongLengthEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection integer
function WoodContainerWrongLengthEvent:writeStream(streamId, connection) end

---@param connection integer
function WoodContainerWrongLengthEvent:run(connection) end
