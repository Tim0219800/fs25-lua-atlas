---@meta
-- FS25 1.25.1.0 : misc/Timer.lua (generated stub, FS25 Lua Atlas)

--- Small countdown timer object driven by the mission update loop: while running it is registered as an updateable on g_currentMission and subtracts the frame delta (optionally scaled) from the time left. Durations are in milliseconds. A finish callback can be set, and the remaining time can be sent over a network stream.
---@class Timer
Timer = {}

--- Creates a timer with the given duration (ms), no callback, not running, with the full duration as time left.
---@param duration any
function Timer.new(duration) end

--- Cleans up the timer by calling reset, which unregisters it from the mission updateables.
function Timer:delete() end

--- Removes the timer from the mission updateables and marks it as not running. Time left is not restored.
function Timer:reset() end

--- Starts the timer and registers it for updates. Time left is reset to the full duration unless noReset is true. Logs an error with a callstack and does nothing if no duration is set.
---@param noReset any
function Timer:start(noReset) end

--- Calls start only when the timer is not already running, so a running countdown is not restarted.
function Timer:startIfNotRunning() end

--- Unregisters the timer from the mission updateables and marks it as stopped, keeping the time left (a later start with noReset can resume).
function Timer:stop() end

--- Ends the timer: unregisters it, sets time left to 0, marks it stopped and invokes the finish callback with the timer as argument, if any.
function Timer:finish() end

--- Returns whether the timer is currently running.
function Timer:getIsRunning() end

--- Sets the function called when the timer finishes and returns the timer itself for chaining.
---@param callback any
function Timer:setFinishCallback(callback) end

--- Returns the elapsed time in milliseconds, computed as duration minus time left.
function Timer:getTimePassed() end

--- Per-frame update called by the mission while running: subtracts dt multiplied by the optional scaleFunc() result from the time left and calls finish when it reaches 0 or below.
---@param dt any
function Timer:update(dt) end

--- Creates and starts a timer that calls callback once after the duration, then deletes itself. Note: it calls timer:setScaleFunction, which is not defined in this file (UNVERIFIED, would error if absent elsewhere); scaleFunc is nominally an optional time-scale getter.
---@param duration any
---@param callback any
---@param scaleFunc any
function Timer.createOneshot(duration, callback, scaleFunc) end

--- Returns the configured duration in milliseconds.
function Timer:getDuration() end

--- Sets the duration (ms), effective at the next start, and returns the timer for chaining.
---@param duration any
function Timer:setDuration(duration) end

--- Writes the time left to a network stream as a 32-bit integer (fractional part is not preserved).
---@param streamId any
function Timer:writeUpdateStream(streamId) end

--- Reads the time left from a network stream as a 32-bit integer.
---@param streamId any
function Timer:readUpdateStream(streamId) end
