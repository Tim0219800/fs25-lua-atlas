---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/CombineStrawEnableEvent.lua (stub généré, atlas Lua FS25)

---@class CombineStrawEnableEvent : Event
CombineStrawEnableEvent = {}

---@return table
function CombineStrawEnableEvent.emptyNew() end

---@param vehicle table
---@param isSwathActive boolean
function CombineStrawEnableEvent.new(vehicle, isSwathActive) end

---@param streamId integer
---@param connection Connection
function CombineStrawEnableEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function CombineStrawEnableEvent:writeStream(streamId, connection) end

---@param connection Connection
function CombineStrawEnableEvent:run(connection) end

---@param vehicle table
---@param isSwathActive boolean
---@param noEventSend boolean
function CombineStrawEnableEvent.sendEvent(vehicle, isSwathActive, noEventSend) end
