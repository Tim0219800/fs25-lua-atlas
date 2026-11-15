---@meta
-- FS25 1.25.1.0 : gui/hud/HUDDisplayElement.lua (generated stub, FS25 Lua Atlas)

---@class HUDDisplayElement : HUDElement
HUDDisplayElement = {}

---@param overlay table
---@param parentHudElement table?
---@param customMt table?
---@return table
function HUDDisplayElement.new(overlay, parentHudElement, customMt) end

---@param isVisible boolean
---@param animate boolean
function HUDDisplayElement:setVisible(isVisible, animate) end

---@param uiScale any
function HUDDisplayElement:setScale(uiScale) end

function HUDDisplayElement:storeOriginalPosition() end

---@return number
---@return number
function HUDDisplayElement:getHidingTranslation() end

---@param x any
function HUDDisplayElement:animationSetPositionX(x) end

---@param y any
function HUDDisplayElement:animationSetPositionY(y) end

function HUDDisplayElement:animateHide() end

function HUDDisplayElement:animateShow() end

---@param isVisible any
function HUDDisplayElement:onAnimateVisibilityFinished(isVisible) end
