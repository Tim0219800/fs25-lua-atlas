---@meta
-- FS25 1.25.1.0 : gui/hud/HUDFrameElement.lua (generated stub, FS25 Lua Atlas)

---@class HUDFrameElement : HUDElement
HUDFrameElement = {}

---@param posX number
---@param posY number
---@param width number
---@param height number
---@param parent table?
---@param showBar any
---@param frameThickness any
---@param barThickness any
function HUDFrameElement.new(posX, posY, width, height, parent, showBar, frameThickness, barThickness) end

---@param baseX any
---@param baseY any
---@param width any
---@param height any
function HUDFrameElement:createComponents(baseX, baseY, width, height) end

---@param width any
---@param height any
function HUDFrameElement:setDimension(width, height) end

---@param height any
function HUDFrameElement:setBottomBarHeight(height) end

---@param r any
---@param g any
---@param b any
---@param a any
function HUDFrameElement:setBottomBarColor(r, g, b, a) end

---@param visible any
function HUDFrameElement:setLeftLineVisible(visible) end

---@param visible any
function HUDFrameElement:setRightLineVisible(visible) end

---@param r any
---@param g any
---@param b any
---@param a any
function HUDFrameElement:setFrameColor(r, g, b, a) end
