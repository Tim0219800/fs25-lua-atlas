---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AttachableStartDetachEvent.lua (stub généré, atlas Lua FS25)

---@class AttachableStartDetachEvent : Event
AttachableStartDetachEvent = {}

---@return table
function AttachableStartDetachEvent.emptyNew() end

---@param vehicle table
---@param state integer
---@param segmentIndex any
---@param segmentIsLeft any
function AttachableStartDetachEvent.new(vehicle, state, segmentIndex, segmentIsLeft) end

---@param streamId integer
---@param connection Connection
function AttachableStartDetachEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AttachableStartDetachEvent:writeStream(streamId, connection) end

---@param connection Connection
function AttachableStartDetachEvent:run(connection) end

---@param vehicle table
---@param noEventSend boolean
function AttachableStartDetachEvent.sendEvent(vehicle, noEventSend) end
