---@meta
-- FS25 1.25.1.0 : gui/elements/AnimationElement.lua (stub généré, atlas Lua FS25)

---@class AnimationElement : BitmapElement
AnimationElement = {}

---@param target any
---@param custom_mt any
function AnimationElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function AnimationElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function AnimationElement:loadProfile(profile, applyProfile) end

---@param src any
function AnimationElement:copyAttributes(src) end

---@param dt any
function AnimationElement:update(dt) end

function AnimationElement:updateAnimationUVs() end

function AnimationElement:updateRotation() end

function AnimationElement:setAnimationData() end
