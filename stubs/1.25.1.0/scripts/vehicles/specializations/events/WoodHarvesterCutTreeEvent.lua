---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/WoodHarvesterCutTreeEvent.lua (generated stub, FS25 Lua Atlas)

---@class WoodHarvesterCutTreeEvent : Event
WoodHarvesterCutTreeEvent = {}

---@return table
function WoodHarvesterCutTreeEvent.emptyNew() end

---@param object table
---@param length number
function WoodHarvesterCutTreeEvent.new(object, length) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterCutTreeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function WoodHarvesterCutTreeEvent:writeStream(streamId, connection) end

---@param connection Connection
function WoodHarvesterCutTreeEvent:run(connection) end

---@param object table
---@param length number
---@param noEventSend boolean
function WoodHarvesterCutTreeEvent.sendEvent(object, length, noEventSend) end
