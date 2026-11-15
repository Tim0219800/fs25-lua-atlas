---@meta
-- FS25 1.25.1.0 : collections/ValueInterpolator.lua (stub généré, atlas Lua FS25)

---@class ValueInterpolator
ValueInterpolator = {}

---@param customKey any
---@param get function
---@param set function
---@param target array
---@param duration number?
---@param speed number?
---@param customMt table?
---@return ValueInterpolator?
function ValueInterpolator.new(customKey, get, set, target, duration, speed, customMt) end

---@param updateFunc any
---@param updateTarget any
function ValueInterpolator:setUpdateFunc(updateFunc, updateTarget, ...) end

---@param finishedFunc any
---@param finishedTarget any
function ValueInterpolator:setFinishedFunc(finishedFunc, finishedTarget, ...) end

---@param object any
function ValueInterpolator:setDeleteListenerObject(object) end

function ValueInterpolator:delete() end

function ValueInterpolator:getTarget() end

function ValueInterpolator:updateSpeed() end

---@param dt any
function ValueInterpolator:update(dt) end

---@param key any
function ValueInterpolator.removeInterpolator(key) end

---@param key any
function ValueInterpolator.hasInterpolator(key) end

function ValueInterpolator:onDeleteParent() end
