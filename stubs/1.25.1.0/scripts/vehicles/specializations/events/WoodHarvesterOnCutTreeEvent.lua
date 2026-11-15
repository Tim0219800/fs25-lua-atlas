---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterOnCutTreeEvent.lua (generated stub, FS25 Lua Atlas)

---@class WoodHarvesterOnCutTreeEvent : Event
WoodHarvesterOnCutTreeEvent = {}

---@return table
function WoodHarvesterOnCutTreeEvent.emptyNew() end

---@param object table
---@param radius number
function WoodHarvesterOnCutTreeEvent.new(object, radius) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterOnCutTreeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterOnCutTreeEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterOnCutTreeEvent:run(connection) end
