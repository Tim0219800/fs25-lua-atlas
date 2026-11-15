---@meta
-- FS25 1.25.1.0 : gui/base/Tween.lua (stub généré, atlas Lua FS25)

---@class Tween
Tween = {}

---@param setterFunction function
---@param startValue number
---@param endValue number
---@param duration number
---@param customMt table?
function Tween.new(setterFunction, startValue, endValue, duration, customMt) end

function Tween:getDuration() end

function Tween:getFinished() end

function Tween:reset() end

---@param target any
function Tween:setTarget(target) end

---@param dt any
function Tween:update(dt) end

---@param t any
function Tween:tweenValue(t) end

---@param newValue any
function Tween:applyValue(newValue) end

---@param func any
function Tween:setCurve(func) end
