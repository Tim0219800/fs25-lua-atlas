---@meta
-- FS25 1.25.1.0 : gui/hud/InputGlyphElement.lua (stub généré, atlas Lua FS25)

---@class InputGlyphElement : HUDElement
InputGlyphElement = {}

---@param inputDisplayManager table
---@param baseWidth number
---@param baseHeight number
---@param customMt any
function InputGlyphElement.new(inputDisplayManager, baseWidth, baseHeight, customMt) end

function InputGlyphElement:delete() end

---@param widthScale number
---@param heightScale number
function InputGlyphElement:setScale(widthScale, heightScale) end

---@param enableUpperCase any
function InputGlyphElement:setUpperCase(enableUpperCase) end

---@param enableLowerCase any
function InputGlyphElement:setLowerCase(enableLowerCase) end

---@param isBold any
function InputGlyphElement:setBold(isBold) end

---@param color table
---@param bgColor any
function InputGlyphElement:setKeyboardGlyphColor(color, bgColor) end

---@param color table
function InputGlyphElement:setButtonGlyphColor(color) end

---@param actionName string
---@param actionText string?
---@param actionTextSize number?
---@param noModifiers boolean?
function InputGlyphElement:setAction(actionName, actionText, actionTextSize, noModifiers) end

---@param actionNames table
---@param actionText string?
---@param actionTextSize number?
---@param noModifiers boolean?
---@param customBinding any
function InputGlyphElement:setActions(actionNames, actionText, actionTextSize, noModifiers, customBinding) end

function InputGlyphElement:updateDisplayText() end

function InputGlyphElement:getGlyphWidth() end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElement:draw(clipX1, clipY1, clipX2, clipY2) end

---@param buttonOverlays table
---@param posX number
---@param posY number
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
---@return number
function InputGlyphElement:drawControllerButtons(buttonOverlays, posX, posY, clipX1, clipY1, clipX2, clipY2) end

---@param posX number
---@param posY number
---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function InputGlyphElement:drawActionText(posX, posY, clipX1, clipY1, clipX2, clipY2) end
