---@meta
-- FS25 1.25.1.0 : ai/tasks/AITask.lua (generated stub, FS25 Lua Atlas)

--- Base class of all AI job tasks. A task knows whether it runs on the server, which job owns it, and keeps running, finished and mark-as-finished flags; subclasses override start, stop, update and validate. Jobs run their tasks in sequence and read getIsFinished to advance.
---@class AITask
AITask = {}

--- Creates a task bound to the isServer flag and its owning job, initially not running and not finished.
---@param isServer any
---@param job any
---@param customMt any
function AITask.new(isServer, job, customMt) end

--- Empty hook for subclasses to release resources.
function AITask:delete() end

--- Empty per-frame hook; the dt argument is the frame time step. Subclasses implement their logic here.
---@param dt any
function AITask:update(dt) end

--- Marks the task as running and not finished. If skip was requested earlier (markAsFinished), the task is immediately flagged finished and the request is cleared.
function AITask:start() end

--- Finishes the task right away if it is running; otherwise remembers the request so the task completes as soon as it starts.
function AITask:skip() end

--- Marks the task as no longer running and clears any pending skip request. The wasJobStopped argument is unused here.
---@param wasJobStopped any
function AITask:stop(wasJobStopped) end

--- Clears the finished flag so the task can be run again. Subclasses extend it to clear their own references.
function AITask:reset() end

--- Base check that always succeeds, returning true and no error. Subclasses can return false with a message; ignoreUnsetParameters is unused here.
---@param ignoreUnsetParameters any
function AITask:validate(ignoreUnsetParameters) end

--- Returns whether the task has finished.
function AITask:getIsFinished() end
