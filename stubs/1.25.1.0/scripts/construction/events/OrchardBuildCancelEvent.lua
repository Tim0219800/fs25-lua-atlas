---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildCancelEvent.lua (stub généré, atlas Lua FS25)

---@class OrchardBuildCancelEvent : Event
OrchardBuildCancelEvent = {}

---@return OrchardBuildCancelEvent
function OrchardBuildCancelEvent.emptyNew() end

---@param requestId integer
---@return OrchardBuildCancelEvent
function OrchardBuildCancelEvent.new(requestId) end

---@param streamId integer
---@param connection Connection
function OrchardBuildCancelEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function OrchardBuildCancelEvent:writeStream(streamId, connection) end

---@param connection Connection
function OrchardBuildCancelEvent:run(connection) end
