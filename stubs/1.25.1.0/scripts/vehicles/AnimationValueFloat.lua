---@meta
-- FS25 1.25.1.0 : vehicles/AnimationValueFloat.lua (generated stub, FS25 Lua Atlas)

---@class AnimationValueFloat
AnimationValueFloat = {}

---@param vehicle any
---@param animation any
---@param part any
---@param startName any
---@param endName any
---@param name any
---@param initialUpdate any
---@param get any
---@param set any
---@param extraLoad any
---@param customMt any
function AnimationValueFloat.new(vehicle, animation, part, startName, endName, name, initialUpdate, get, set, extraLoad, customMt) end

---@param xmlFile any
---@param key any
function AnimationValueFloat:load(xmlFile, key) end

function AnimationValueFloat:addCompareParameters(...) end

---@param info any
function AnimationValueFloat:setWarningInformation(info) end

---@param index any
---@param numParts any
function AnimationValueFloat:init(index, numParts) end

function AnimationValueFloat:postInit() end

function AnimationValueFloat:reset() end

---@param targetValue any
---@param durationToEnd any
---@param fixedTimeUpdate any
function AnimationValueFloat:initValues(targetValue, durationToEnd, fixedTimeUpdate, ...) end

---@param durationToEnd any
---@param dtToUse any
---@param realDt any
---@param fixedTimeUpdate any
function AnimationValueFloat:update(durationToEnd, dtToUse, realDt, fixedTimeUpdate) end
