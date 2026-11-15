---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/JumpEvent.lua (generated stub, FS25 Lua Atlas)

---@class JumpEvent : Event
JumpEvent = {}

---@return table
function JumpEvent.emptyNew() end

---@param object table
function JumpEvent.new(object) end

---@param streamId integer
---@param connection Connection
function JumpEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function JumpEvent:writeStream(streamId, connection) end

---@param connection Connection
function JumpEvent:run(connection) end
