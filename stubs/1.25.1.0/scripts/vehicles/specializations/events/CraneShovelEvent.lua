---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/CraneShovelEvent.lua (stub généré, atlas Lua FS25)

---@class CraneShovelEvent : Event
CraneShovelEvent = {}

---@return table
function CraneShovelEvent.emptyNew() end

---@param object table
---@param state any
function CraneShovelEvent.new(object, state) end

---@param streamId integer
---@param connection Connection
function CraneShovelEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function CraneShovelEvent:writeStream(streamId, connection) end

---@param connection Connection
function CraneShovelEvent:run(connection) end

---@param object table
---@param state boolean
---@param noEventSend boolean
function CraneShovelEvent.sendEvent(object, state, noEventSend) end
