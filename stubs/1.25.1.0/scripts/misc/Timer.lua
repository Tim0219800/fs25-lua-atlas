---@meta
-- FS25 1.25.1.0 : misc/Timer.lua (stub généré, atlas Lua FS25)

---@class Timer
Timer = {}

---@param duration any
function Timer.new(duration) end

function Timer:delete() end

function Timer:reset() end

---@param noReset any
function Timer:start(noReset) end

function Timer:startIfNotRunning() end

function Timer:stop() end

function Timer:finish() end

function Timer:getIsRunning() end

---@param callback any
function Timer:setFinishCallback(callback) end

function Timer:getTimePassed() end

---@param dt any
function Timer:update(dt) end

---@param duration any
---@param callback any
---@param scaleFunc any
function Timer.createOneshot(duration, callback, scaleFunc) end

function Timer:getDuration() end

---@param duration any
function Timer:setDuration(duration) end

---@param streamId any
function Timer:writeUpdateStream(streamId) end

---@param streamId any
function Timer:readUpdateStream(streamId) end
