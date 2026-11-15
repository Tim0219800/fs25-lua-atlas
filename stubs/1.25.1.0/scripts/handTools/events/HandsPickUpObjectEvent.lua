---@meta
-- FS25 1.25.1.0 : handTools/events/HandsPickUpObjectEvent.lua (generated stub, FS25 Lua Atlas)

---@class HandsPickUpObjectEvent : Event
HandsPickUpObjectEvent = {}

---@return table
function HandsPickUpObjectEvent.emptyNew() end

---@param hands HandTool
---@param target table
---@return table
function HandsPickUpObjectEvent.new(hands, target) end

---@param streamId integer
---@param connection table
function HandsPickUpObjectEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function HandsPickUpObjectEvent:writeStream(streamId, connection) end

---@param connection table
function HandsPickUpObjectEvent:run(connection) end

---@param hands HandTool
---@param target table
---@param noEventSend boolean?
function HandsPickUpObjectEvent.sendEvent(hands, target, noEventSend) end

---@param target table?
---@return table?
function HandsPickUpObjectEvent.getTargetGhostObject(target) end
