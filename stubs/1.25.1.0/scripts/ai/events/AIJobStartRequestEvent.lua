---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStartRequestEvent.lua (generated stub, FS25 Lua Atlas)

--- Two-way event for starting an AI job. A client sends job and farm id; the server checks `getIsStartable`, answers with a state code and, if startable, starts the job through `aiSystem:startJob`. The client then publishes the answer on the message center.
---@class AIJobStartRequestEvent : Event
AIJobStartRequestEvent = {}

--- Creates an empty event for stream reconstruction.
function AIJobStartRequestEvent.emptyNew() end

--- Creates the client-to-server request for a job and farm id.
---@param job any
---@param startFarmId any
function AIJobStartRequestEvent.new(job, startFarmId) end

--- Creates the server reply carrying a state code (0 is sent when the job is accepted) and the job type index.
---@param state any
---@param jobTypeIndex any
function AIJobStartRequestEvent.newServerToClient(state, jobTypeIndex) end

--- On the server reads farm id, job type (uint16) and job data; on a client reads the state (uint8) and job type index. Then runs the event.
---@param streamId any
---@param connection any
function AIJobStartRequestEvent:readStream(streamId, connection) end

--- Mirror of `readStream`: a client writes farm id, job type and job data; the server writes state and job type index.
---@param streamId any
---@param connection any
function AIJobStartRequestEvent:writeStream(streamId, connection) end

--- Server side: calls `job:getIsStartable(connection)`, sends the state back, and only if startable starts the job with `aiSystem:startJob`. Client side: publishes `AIJobStartRequestEvent` with state and job type on `g_messageCenter`.
---@param connection any
function AIJobStartRequestEvent:run(connection) end
