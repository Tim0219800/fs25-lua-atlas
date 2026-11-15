---@meta
-- FS25 1.25.1.0 : gui/hud/HUDElement.lua (generated stub, FS25 Lua Atlas)

---@class HUDElement
HUDElement = {}

---@param overlay table
---@param parentHudElement table?
---@param customMt table?
---@return table
function HUDElement.new(overlay, parentHudElement, customMt) end

function HUDElement:delete() end

---@param childHudElement table
function HUDElement:addChild(childHudElement) end

---@param childHudElement table
function HUDElement:removeChild(childHudElement) end

---@param x any
---@param y any
function HUDElement:setPosition(x, y) end

---@param rotation number
---@param centerX number?
---@param centerY number?
function HUDElement:setRotation(rotation, centerX, centerY) end

---@param pivotX number
---@param pivotY number
function HUDElement:setRotationPivot(pivotX, pivotY) end

---@return number
---@return number
function HUDElement:getRotationPivot() end

---@return number
---@return number
function HUDElement:getPosition() end

---@param scaleWidth number
---@param scaleHeight number
function HUDElement:setScale(scaleWidth, scaleHeight) end

---@return Width
---@return Height
function HUDElement:getScale() end

---@param vertical integer
---@param horizontal integer
function HUDElement:setAlignment(vertical, horizontal) end

---@param isVisible any
function HUDElement:setVisible(isVisible) end

function HUDElement:getVisible() end

---@return number
---@return number
---@return number
---@return number
function HUDElement:getColor() end

---@return number
function HUDElement:getAlpha() end

function HUDElement:getWidth() end

function HUDElement:getHeight() end

---@param width any
---@param height any
function HUDElement:setDimension(width, height) end

---@return number
---@return number
function HUDElement:getDimension() end

function HUDElement:resetDimensions() end

---@param r any
---@param g any
---@param b any
---@param a any
function HUDElement:setColor(r, g, b, a) end

---@param alpha any
function HUDElement:setAlpha(alpha) end

---@param imageFilename any
function HUDElement:setImage(imageFilename) end

---@param uvs any
function HUDElement:setUVs(uvs) end

---@param sliceId any
function HUDElement:setSliceId(sliceId) end

---@param dt any
function HUDElement:update(dt) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function HUDElement:draw(clipX1, clipY1, clipX2, clipY2) end

---@param vector2D table
function HUDElement:scalePixelToScreenVector(vector2D) end

---@param height number
function HUDElement:scalePixelToScreenHeight(height) end

---@param width number
function HUDElement:scalePixelToScreenWidth(width) end

---@param uvPivot table
---@param size table
---@param uvs table
function HUDElement:normalizeUVPivot(uvPivot, size, uvs) end
