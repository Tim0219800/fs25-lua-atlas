---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BalerSetIsUnloadingBaleEvent.lua (stub généré, atlas Lua FS25)

---@class BalerSetIsUnloadingBaleEvent : Event
BalerSetIsUnloadingBaleEvent = {}

---@return table
function BalerSetIsUnloadingBaleEvent.emptyNew() end

---@param object table
---@param isUnloadingBale boolean
function BalerSetIsUnloadingBaleEvent.new(object, isUnloadingBale) end

---@param streamId integer
---@param connection Connection
function BalerSetIsUnloadingBaleEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BalerSetIsUnloadingBaleEvent:writeStream(streamId, connection) end

---@param connection Connection
function BalerSetIsUnloadingBaleEvent:run(connection) end

---@param object table
---@param isUnloadingBale boolean
---@param noEventSend boolean
function BalerSetIsUnloadingBaleEvent.sendEvent(object, isUnloadingBale, noEventSend) end
