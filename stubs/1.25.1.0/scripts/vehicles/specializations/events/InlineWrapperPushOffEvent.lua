---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/InlineWrapperPushOffEvent.lua (stub généré, atlas Lua FS25)

---@class InlineWrapperPushOffEvent : Event
InlineWrapperPushOffEvent = {}

---@return table
function InlineWrapperPushOffEvent.emptyNew() end

---@param inlineWrapper table
---@return table
function InlineWrapperPushOffEvent.new(inlineWrapper) end

---@param streamId integer
---@param connection Connection
function InlineWrapperPushOffEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function InlineWrapperPushOffEvent:writeStream(streamId, connection) end

---@param connection Connection
function InlineWrapperPushOffEvent:run(connection) end
