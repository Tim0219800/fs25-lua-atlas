---@meta
-- FS25 1.25.1.0 : objects/BunkerSiloCloseEvent.lua (stub généré, atlas Lua FS25)

---@class BunkerSiloCloseEvent : Event
BunkerSiloCloseEvent = {}

---@return table
function BunkerSiloCloseEvent.emptyNew() end

---@param bunkerSilo table
---@return table
function BunkerSiloCloseEvent.new(bunkerSilo) end

---@param streamId integer
---@param connection Connection
function BunkerSiloCloseEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BunkerSiloCloseEvent:writeStream(streamId, connection) end

---@param connection Connection
function BunkerSiloCloseEvent:run(connection) end
