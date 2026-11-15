---@meta
-- FS25 1.25.1.0 : gui/base/MultiValueTween.lua (generated stub, FS25 Lua Atlas)

---@class MultiValueTween : Tween
MultiValueTween = {}

---@param setterFunction function
---@param startValues table
---@param endValues table
---@param duration number
---@param customMt number
function MultiValueTween.new(setterFunction, startValues, endValues, duration, customMt) end

---@param target any
function MultiValueTween:setTarget(target) end

---@param t any
function MultiValueTween:tweenValue(t) end

function MultiValueTween:applyValue() end
