---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TensionBeltsRefreshEvent.lua (generated stub, FS25 Lua Atlas)

---@class TensionBeltsRefreshEvent : Event
TensionBeltsRefreshEvent = {}

---@return table
function TensionBeltsRefreshEvent.emptyNew() end

---@param object table
function TensionBeltsRefreshEvent.new(object) end

---@param streamId integer
---@param connection Connection
function TensionBeltsRefreshEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TensionBeltsRefreshEvent:writeStream(streamId, connection) end

---@param connection Connection
function TensionBeltsRefreshEvent:run(connection) end
