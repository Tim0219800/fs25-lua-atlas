---@meta
-- FS25 1.25.1.0 : objects/BunkerSiloOpenEvent.lua (generated stub, FS25 Lua Atlas)

---@class BunkerSiloOpenEvent : Event
BunkerSiloOpenEvent = {}

---@return table
function BunkerSiloOpenEvent.emptyNew() end

---@param bunkerSilo table
---@param x number
---@param y number
---@param z number
---@return table
function BunkerSiloOpenEvent.new(bunkerSilo, x, y, z) end

---@param streamId integer
---@param connection Connection
function BunkerSiloOpenEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BunkerSiloOpenEvent:writeStream(streamId, connection) end

---@param connection Connection
function BunkerSiloOpenEvent:run(connection) end
