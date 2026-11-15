---@meta
-- FS25 1.25.1.0 : gui/elements/DynamicFadedBitmapElement.lua (stub généré, atlas Lua FS25)

---@class DynamicFadedBitmapElement : PictureElement
DynamicFadedBitmapElement = {}

---@param target any
---@param custom_mt any
function DynamicFadedBitmapElement.new(target, custom_mt) end

function DynamicFadedBitmapElement:delete() end

---@param xmlFile any
---@param key any
function DynamicFadedBitmapElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function DynamicFadedBitmapElement:loadProfile(profile, applyProfile) end

---@param src any
function DynamicFadedBitmapElement:copyAttributes(src) end

---@param alpha any
function DynamicFadedBitmapElement:setAlpha(alpha) end

---@param filenames any
function DynamicFadedBitmapElement:setImageFilenames(filenames) end

---@param uvs any
function DynamicFadedBitmapElement:setImagesUVs(uvs) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function DynamicFadedBitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end

function DynamicFadedBitmapElement:canReceiveFocus() end

function DynamicFadedBitmapElement:getFocusTarget() end
