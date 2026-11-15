---@meta
-- FS25 1.25.1.0 : ai/tasks/AITask.lua (generated stub, FS25 Lua Atlas)

---@class AITask
AITask = {}

---@param isServer any
---@param job any
---@param customMt any
function AITask.new(isServer, job, customMt) end

function AITask:delete() end

---@param dt any
function AITask:update(dt) end

function AITask:start() end

function AITask:skip() end

---@param wasJobStopped any
function AITask:stop(wasJobStopped) end

function AITask:reset() end

---@param ignoreUnsetParameters any
function AITask:validate(ignoreUnsetParameters) end

function AITask:getIsFinished() end
