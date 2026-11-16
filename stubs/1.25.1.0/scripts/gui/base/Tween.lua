---@meta
-- FS25 1.25.1.0 : gui/base/Tween.lua (generated stub, FS25 Lua Atlas)

--- Linear interpolation of one number from a start to an end value over a duration in milliseconds, pushed to a setter callback on every update. The easing can be swapped through a curve function (default Tween.CURVE.LINEAR, defined elsewhere). Base class of TweenSequence.
---@class Tween
Tween = {}

--- Creates a tween calling setterFunction with the interpolated value. A duration of 0 makes it finished immediately; customMt lets subclasses reuse it.
---@param setterFunction function
---@param startValue number
---@param endValue number
---@param duration number
---@param customMt table?
function Tween.new(setterFunction, startValue, endValue, duration, customMt) end

--- Returns the duration in milliseconds.
function Tween:getDuration() end

--- Returns true once the tween has reached its end.
function Tween:getFinished() end

--- Rewinds elapsed time to 0 so the tween can play again; it is finished at once only if the duration is 0.
function Tween:reset() end

--- Sets a table passed as first argument to the setter; the setter must then accept (target, value).
---@param target any
function Tween:setTarget(target) end

--- Advances by dt milliseconds, computes the value and calls the setter; on reaching the duration it applies the exact end value and marks the tween finished. Does nothing once finished.
---@param dt any
function Tween:update(dt) end

--- Returns the value at normalised time t (0..1): a lerp between start and end after passing t through the curve function.
---@param t any
function Tween:tweenValue(t) end

--- Calls the setter with the value, prefixed by the target if one was set.
---@param newValue any
function Tween:applyValue(newValue) end

--- Sets the easing function applied to normalised time; nil restores the linear curve.
---@param func any
function Tween:setCurve(func) end
