---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildRequestEvent.lua (stub généré, atlas Lua FS25)

---@class OrchardBuildRequestEvent : Event
OrchardBuildRequestEvent = {}

---@return OrchardBuildRequestEvent
function OrchardBuildRequestEvent.emptyNew() end

---@param requestId table
---@param fencePlaceable table
---@param templateId table?
---@param courseSegments table
---@param boundaryLine table
---@param optionStates table?
---@return OrchardBuildRequestEvent
function OrchardBuildRequestEvent.new(requestId, fencePlaceable, templateId, courseSegments, boundaryLine, optionStates) end

---@param streamId integer
---@param connection Connection
function OrchardBuildRequestEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function OrchardBuildRequestEvent:writeStream(streamId, connection) end

---@param connection Connection
function OrchardBuildRequestEvent:run(connection) end
