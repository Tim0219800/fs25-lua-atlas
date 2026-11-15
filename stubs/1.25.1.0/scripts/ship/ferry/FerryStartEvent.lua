---@meta
-- FS25 1.25.1.0 : ship/ferry/FerryStartEvent.lua (stub généré, atlas Lua FS25)

---@class FerryStartEvent : Event
FerryStartEvent = {}

---@return table
function FerryStartEvent.emptyNew() end

---@param ferry table
---@return table
function FerryStartEvent.new(ferry) end

---@param streamId integer
---@param connection Connection
function FerryStartEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function FerryStartEvent:writeStream(streamId, connection) end

---@param connection Connection
function FerryStartEvent:run(connection) end
