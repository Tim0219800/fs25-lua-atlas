---@meta
-- FS25 1.25.1.0 : gui/elements/PictureElement.lua (generated stub, FS25 Lua Atlas)

---@class PictureElement : BitmapElement
PictureElement = {}

---@param target any
---@param custom_mt any
function PictureElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function PictureElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function PictureElement:loadProfile(profile, applyProfile) end

---@param src any
function PictureElement:copyAttributes(src) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function PictureElement:draw(clipX1, clipY1, clipX2, clipY2) end
