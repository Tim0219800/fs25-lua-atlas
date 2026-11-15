---@meta
-- FS25 1.25.1.0 : handTools/events/HandsPickUpFailedEvent.lua (stub généré, atlas Lua FS25)

---@class HandsPickUpFailedEvent : Event
HandsPickUpFailedEvent = {}

---@return table
function HandsPickUpFailedEvent.emptyNew() end

---@param hands any
function HandsPickUpFailedEvent.new(hands) end

---@param streamId integer
---@param connection Connection
function HandsPickUpFailedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function HandsPickUpFailedEvent:writeStream(streamId, connection) end

---@param connection Connection
function HandsPickUpFailedEvent:run(connection) end
