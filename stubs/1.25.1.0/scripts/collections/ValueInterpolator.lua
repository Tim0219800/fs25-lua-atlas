---@meta
-- FS25 1.25.1.0 : collections/ValueInterpolator.lua (generated stub, FS25 Lua Atlas)

--- Helper that moves a list of numeric values toward targets over time. It reads current values through a getter, writes them back through a setter every update and registers itself as an updateable on g_currentMission under a custom key. It removes itself when every value reaches its target and can run update and finished callbacks. The updateable mechanism is part of the mission class, which is not in this dump (UNVERIFIED).
---@class ValueInterpolator
ValueInterpolator = {}

--- Starts an interpolation: current values come from get(), and speeds are derived from duration (ms) or from speed per second (default 1). Returns nil if all speeds are near zero; otherwise registers as an updateable with customKey and returns itself.
---@param customKey any
---@param get function
---@param set function
---@param target array
---@param duration number?
---@param speed number?
---@param customMt table?
---@return ValueInterpolator?
function ValueInterpolator.new(customKey, get, set, target, duration, speed, customMt) end

--- Sets a callback run after each update step, called as func(target, ...) with the extra arguments given here.
---@param updateFunc any
---@param updateTarget any
function ValueInterpolator:setUpdateFunc(updateFunc, updateTarget, ...) end

--- Sets a callback run once when all values have reached their targets, called as func(target, ...) with the extra arguments given here.
---@param finishedFunc any
---@param finishedTarget any
function ValueInterpolator:setFinishedFunc(finishedFunc, finishedTarget, ...) end

--- If the object derives from Object, registers a delete listener so the interpolator stops (onDeleteParent) when that object is deleted. Other values are ignored.
---@param object any
function ValueInterpolator:setDeleteListenerObject(object) end

--- Empty function that exists to satisfy the updateable interface.
function ValueInterpolator:delete() end

--- Returns the table of target values.
function ValueInterpolator:getTarget() end

--- Recomputes per-value speeds as remaining distance divided by remaining duration, when duration is a number; otherwise uses the duration value itself as the speed table.
function ValueInterpolator:updateSpeed() end

--- Advances every value toward its target by speed times dt (ms) without overshooting, calls the setter and update callback, and shortens the remaining duration (minimum 1). When all values arrive it removes the updateable and calls the finished callback.
---@param dt any
function ValueInterpolator:update(dt) end

--- Removes the updateable registered under the given key from the current mission, if there is one.
---@param key any
function ValueInterpolator.removeInterpolator(key) end

--- Returns whether the current mission still has an updateable registered under the given key.
---@param key any
function ValueInterpolator.hasInterpolator(key) end

--- Delete-listener callback that removes this interpolator's updateable from the mission when the watched parent object is deleted.
function ValueInterpolator:onDeleteParent() end
