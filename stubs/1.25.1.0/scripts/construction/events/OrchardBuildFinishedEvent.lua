---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildFinishedEvent.lua (generated stub, FS25 Lua Atlas)

---@class OrchardBuildFinishedEvent : Event
OrchardBuildFinishedEvent = {}

---@return OrchardBuildFinishedEvent
function OrchardBuildFinishedEvent.emptyNew() end

---@param requestId integer
---@param statusCode integer
---@param builtSteps integer
---@return OrchardBuildFinishedEvent
function OrchardBuildFinishedEvent.new(requestId, statusCode, builtSteps) end

---@param streamId integer
---@param connection Connection
function OrchardBuildFinishedEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function OrchardBuildFinishedEvent:writeStream(streamId, connection) end

---@param connection Connection
function OrchardBuildFinishedEvent:run(connection) end
