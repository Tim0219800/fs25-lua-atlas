---@meta
-- FS25 1.25.1.0 : events/InlineBaleOpenEvent.lua (stub généré, atlas Lua FS25)

---@class InlineBaleOpenEvent : Event
InlineBaleOpenEvent = {}

---@return table
function InlineBaleOpenEvent.emptyNew() end

---@param inlineBale table
---@param x number
---@param y number
---@param z number
---@return table
function InlineBaleOpenEvent.new(inlineBale, x, y, z) end

---@param streamId integer
---@param connection Connection
function InlineBaleOpenEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function InlineBaleOpenEvent:writeStream(streamId, connection) end

---@param connection Connection
function InlineBaleOpenEvent:run(connection) end
