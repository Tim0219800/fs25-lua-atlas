---@meta
-- FS25 1.25.1.0 : events/BaleOpenEvent.lua (generated stub, FS25 Lua Atlas)

---@class BaleOpenEvent : Event
BaleOpenEvent = {}

---@return table
function BaleOpenEvent.emptyNew() end

---@param bale table
---@return table
function BaleOpenEvent.new(bale) end

---@param streamId integer
---@param connection Connection
function BaleOpenEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleOpenEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleOpenEvent:run(connection) end
