---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/HonkEvent.lua (stub généré, atlas Lua FS25)

---@class HonkEvent : Event
HonkEvent = {}

---@return table
function HonkEvent.emptyNew() end

---@param object table
---@param isPlaying boolean
function HonkEvent.new(object, isPlaying) end

---@param streamId integer
---@param connection Connection
function HonkEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function HonkEvent:writeStream(streamId, connection) end

---@param connection Connection
function HonkEvent:run(connection) end

---@param vehicle table
---@param isPlaying boolean
---@param noEventSend boolean
function HonkEvent.sendEvent(vehicle, isPlaying, noEventSend) end
