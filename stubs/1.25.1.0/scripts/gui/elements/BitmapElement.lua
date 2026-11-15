---@meta
-- FS25 1.25.1.0 : gui/elements/BitmapElement.lua (stub généré, atlas Lua FS25)

---@class BitmapElement : GuiElement
BitmapElement = {}

---@param target any
---@param custom_mt any
function BitmapElement.new(target, custom_mt) end

function BitmapElement:delete() end

---@param xmlFile any
---@param key any
function BitmapElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function BitmapElement:loadProfile(profile, applyProfile) end

---@param src any
function BitmapElement:copyAttributes(src) end

---@param alpha any
function BitmapElement:setAlpha(alpha) end

function BitmapElement:getOffset() end

---@param xOffset any
---@param yOffset any
function BitmapElement:getOverlayMaskData(xOffset, yOffset) end

---@param isWebOverlay any
function BitmapElement:setIsWebOverlay(isWebOverlay) end

---@param filename any
function BitmapElement:setImageFilename(filename) end

---@param state state
---@param r number
---@param g number
---@param b number
---@param a number
function BitmapElement:setImageColor(state, r, g, b, a) end

---@param state any
---@param v0 any
---@param u0 any
---@param v1 any
---@param u1 any
---@param v2 any
---@param u2 any
---@param v3 any
---@param u3 any
function BitmapElement:setImageUVs(state, v0, u0, v1, u1, v2, u2, v3, u3) end

---@param rotation number
function BitmapElement:setImageRotation(rotation) end

---@param state string
---@param sliceId string
function BitmapElement:setImageSlice(state, sliceId) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function BitmapElement:draw(clipX1, clipY1, clipX2, clipY2) end

function BitmapElement:canReceiveFocus() end

function BitmapElement:getFocusTarget() end
