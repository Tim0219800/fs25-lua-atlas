---@meta
-- FS25 1.25.1.0 : gui/base/MultiValueTween.lua (generated stub, FS25 Lua Atlas)

--- Subclass of Tween that animates several numeric values at once. Start and end values are arrays and the setter receives them unpacked, optionally preceded by a target object. Used for UI animations such as position or size.
---@class MultiValueTween : Tween
MultiValueTween = {}

--- Creates the tween through `Tween.new` and keeps a working copy of the start values. The setter is called as setter(v1..vn), or setter(target, v1..vn) when a target is set; duration is in milliseconds.
---@param setterFunction function
---@param startValues table
---@param endValues table
---@param duration number
---@param customMt number
function MultiValueTween.new(setterFunction, startValues, endValues, duration, customMt) end

--- Sets or clears the callback target and keeps the values array in sync by inserting, removing or replacing the target as first entry. The setter must then accept the target first.
---@param target any
function MultiValueTween:setTarget(target) end

--- Interpolates each start/end pair linearly with the factor shaped by the curve function at progress t, stores it in the values array (after the target slot if any) and returns that array.
---@param t any
function MultiValueTween:tweenValue(t) end

--- Calls the setter with the current values unpacked, including the target as first argument when one was set.
function MultiValueTween:applyValue() end
