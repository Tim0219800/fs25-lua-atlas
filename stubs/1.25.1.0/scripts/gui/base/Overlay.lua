---@meta
-- FS25 1.25.1.0 : gui/base/Overlay.lua (stub généré, atlas Lua FS25)

---@class Overlay
Overlay = {}

---@param overlayFilename string?
---@param x number
---@param y number
---@param width number
---@param height number
---@param customMt table?
---@return Overlay
function Overlay.new(overlayFilename, x, y, width, height, customMt) end

function Overlay:delete() end

---@param r number?
---@param g number?
---@param b number?
---@param a number?
function Overlay:setColor(r, g, b, a) end

---@param uvs array
function Overlay:setUVs(uvs) end

---@param sliceId string
function Overlay:setSliceId(sliceId) end

---@param x number?
---@param y number?
function Overlay:setPosition(x, y) end

---@return number
---@return number
function Overlay:getPosition() end

---@param width number?
---@param height number?
function Overlay:setDimension(width, height) end

function Overlay:resetDimensions() end

---@param invertX boolean
function Overlay:setInvertX(invertX) end

---@param rotation number
---@param centerX number
---@param centerY number
function Overlay:setRotation(rotation, centerX, centerY) end

---@param scaleWidth number
---@param scaleHeight number
function Overlay:setScale(scaleWidth, scaleHeight) end

---@return number
---@return number
function Overlay:getScale() end

---@param clipX1 number?
---@param clipY1 number?
---@param clipX2 number?
---@param clipY2 number?
function Overlay:render(clipX1, clipY1, clipX2, clipY2) end

---@param vertical integer?
---@param horizontal integer?
function Overlay:setAlignment(vertical, horizontal) end

---@param visible boolean?
function Overlay:setIsVisible(visible) end

---@return boolean
function Overlay:getIsVisible() end

---@param overlayFilename string
function Overlay:setImage(overlayFilename) end
