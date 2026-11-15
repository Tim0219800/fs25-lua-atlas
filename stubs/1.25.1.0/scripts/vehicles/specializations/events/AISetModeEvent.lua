---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AISetModeEvent.lua (stub généré, atlas Lua FS25)

---@class AISetModeEvent : Event
AISetModeEvent = {}

---@return table
function AISetModeEvent.emptyNew() end

---@param vehicle table
---@param aiMode integer
function AISetModeEvent.new(vehicle, aiMode) end

---@param streamId integer
---@param connection Connection
function AISetModeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AISetModeEvent:writeStream(streamId, connection) end

---@param connection Connection
function AISetModeEvent:run(connection) end

---@param vehicle table
---@param aiMode integer
---@param noEventSend boolean
function AISetModeEvent.sendEvent(vehicle, aiMode, noEventSend) end
