---@meta
-- FS25 1.25.1.0 : gui/base/ButtonOverlay.lua (stub généré, atlas Lua FS25)

---@class ButtonOverlay
ButtonOverlay = {}

---@param customMt any
function ButtonOverlay.new(customMt) end

function ButtonOverlay:delete() end

---@param r number?
---@param g number?
---@param b number?
---@param a number?
---@param r2 number?
---@param g2 number?
---@param b2 number?
---@param a2 number?
function ButtonOverlay:setColor(r, g, b, a, r2, g2, b2, a2) end

---@param buttonText buttonText
---@param posX posX
---@param posY posY
---@param height height
---@param colorText any
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
---@param customOffsetLeft any
---@param customButtonInputText any
function ButtonOverlay:renderButton(buttonText, posX, posY, height, colorText, clipX1, clipY1, clipX2, clipY2, customOffsetLeft, customButtonInputText) end

---@param buttonText any
---@param height any
---@param customOffsetLeft any
---@param customButtonInputText any
function ButtonOverlay:getButtonWidth(buttonText, height, customOffsetLeft, customButtonInputText) end
