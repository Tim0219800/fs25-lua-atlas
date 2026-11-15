---@meta
-- FS25 1.25.1.0 : gui/hud/HUDTextDisplay.lua (generated stub, FS25 Lua Atlas)

---@class HUDTextDisplay : HUDDisplayElement
HUDTextDisplay = {}

---@param posX number
---@param posY number
---@param textSize number
---@param textAlignment integer?
---@param textColor table?
---@param textBold boolean?
---@return table
function HUDTextDisplay.new(posX, posY, textSize, textAlignment, textColor, textBold) end

---@param text string
---@param textSize number
---@param textAlignment integer
---@param textColor table
---@param textBold boolean
function HUDTextDisplay:setText(text, textSize, textAlignment, textColor, textBold) end

---@param uiScale number
function HUDTextDisplay:setScale(uiScale) end

---@param isVisible boolean
---@param animate boolean
function HUDTextDisplay:setVisible(isVisible, animate) end

---@param alpha number
function HUDTextDisplay:setAlpha(alpha) end

---@param r number
---@param g number
---@param b number
---@param a number
function HUDTextDisplay:setTextColorChannels(r, g, b, a) end

---@param isShadowEnabled boolean
---@param shadowColor table
function HUDTextDisplay:setTextShadow(isShadowEnabled, shadowColor) end

---@param animationTween table
function HUDTextDisplay:setAnimation(animationTween) end

---@param dt number
function HUDTextDisplay:update(dt) end

function HUDTextDisplay:draw() end
