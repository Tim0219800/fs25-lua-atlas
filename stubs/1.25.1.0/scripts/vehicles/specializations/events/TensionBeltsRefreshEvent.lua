---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TensionBeltsRefreshEvent.lua (stub généré, atlas Lua FS25)

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
