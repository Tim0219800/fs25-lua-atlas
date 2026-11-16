---@meta
-- FS25 1.25.1.0 : construction/events/OrchardBuildRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event sent by a client to ask the server to build an orchard on a fence placeable from rows the client already computed. It carries the fence placeable, an optional fence segment template, the row segments, the boundary polyline and the selected brush option indices. The server reads it with size limits, validates it and hands it to `orchardBuildManager`; the constants `MAX_ROWS`, `MAX_BOUNDARY_POINTS`, `MIN_BOUNDARY_POINTS`, `OFFSET_LINE_INDEX_NUM_BITS` and the method `getHasValidTemplate` are not in the dump (UNVERIFIED).
---@class OrchardBuildRequestEvent : Event
OrchardBuildRequestEvent = {}

--- Creates an empty event on the main network channel, used when reading from a stream.
---@return OrchardBuildRequestEvent
function OrchardBuildRequestEvent.emptyNew() end

--- Creates a request from run id, fence placeable, template id (nil allowed), course segments, boundary line and option states. Boundary and options default to empty tables.
---@param requestId table
---@param fencePlaceable table
---@param templateId table?
---@param courseSegments table
---@param boundaryLine table
---@param optionStates table?
---@return OrchardBuildRequestEvent
function OrchardBuildRequestEvent.new(requestId, fencePlaceable, templateId, courseSegments, boundaryLine, optionStates) end

--- Server side: reads the request id, fence node object, optional template index (converted to an id via the fence), rows (compressed XZ start/end plus offset line index), boundary points and option bytes, then calls `run`. Counts above the limits are read to keep the stream aligned but flagged `isTooLarge` and not stored.
---@param streamId integer
---@param connection Connection
function OrchardBuildRequestEvent:readStream(streamId, connection) end

--- Client side: writes the same fields in the layout `readStream` expects. Only each segment's first and last position are sent, in compressed XZ; heights are not sent because the server samples the terrain itself.
---@param streamId integer
---@param connection Connection
function OrchardBuildRequestEvent:writeStream(streamId, connection) end

--- Server only, and only if `orchardBuildManager` exists. Rejects with `STATUS.INVALID_REQUEST` when the data is oversized, lacks rows or enough boundary points, or the template is invalid; otherwise calls `manager:addRequest`.
---@param connection Connection
function OrchardBuildRequestEvent:run(connection) end
