---@meta
-- FS25 1.25.1.0 : vehicles/AnimationValueBool.lua (stub généré, atlas Lua FS25)

---@class AnimationValueBool : AnimationValueFloat
AnimationValueBool = {}

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
function AnimationValueBool.new(vehicle, animation, part, startName, endName, name, initialUpdate, get, set, extraLoad, customMt) end

---@param xmlFile any
---@param key any
function AnimationValueBool:load(xmlFile, key) end

---@param index any
---@param numParts any
function AnimationValueBool:init(index, numParts) end

function AnimationValueBool:postInit() end

function AnimationValueBool:reset() end

---@param durationToEnd any
---@param dtToUse any
---@param realDt any
function AnimationValueBool:update(durationToEnd, dtToUse, realDt) end
