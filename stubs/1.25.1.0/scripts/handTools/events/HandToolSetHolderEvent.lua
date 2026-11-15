---@meta
-- FS25 1.25.1.0 : handTools/events/HandToolSetHolderEvent.lua (generated stub, FS25 Lua Atlas)

---@class HandToolSetHolderEvent : Event
HandToolSetHolderEvent = {}

---@return table
function HandToolSetHolderEvent.emptyNew() end

---@param handTool any
---@param holder any
function HandToolSetHolderEvent.new(handTool, holder) end

---@param streamId integer
---@param connection Connection
function HandToolSetHolderEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function HandToolSetHolderEvent:writeStream(streamId, connection) end

---@param connection Connection
function HandToolSetHolderEvent:run(connection) end

---@param handTool table
---@param holder table
---@param noEventSend boolean
function HandToolSetHolderEvent.sendEvent(handTool, holder, noEventSend) end
