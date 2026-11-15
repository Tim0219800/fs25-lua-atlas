---@meta
-- FS25 1.25.1.0 : gui/elements/ThreePartBitmapElement.lua (stub généré, atlas Lua FS25)

---@class ThreePartBitmapElement : BitmapElement
ThreePartBitmapElement = {}

---@param target any
---@param custom_mt any
function ThreePartBitmapElement.new(target, custom_mt) end

function ThreePartBitmapElement:delete() end

---@param xmlFile any
---@param key any
function ThreePartBitmapElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function ThreePartBitmapElement:loadProfile(profile, applyProfile) end

---@param src any
function ThreePartBitmapElement:copyAttributes(src) end

---@param state integer
---@param r number
---@param g number
---@param b number
---@param a number
function ThreePartBitmapElement:setImageColor(state, r, g, b, a) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function ThreePartBitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end
