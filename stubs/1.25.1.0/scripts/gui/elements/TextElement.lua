---@meta
-- FS25 1.25.1.0 : gui/elements/TextElement.lua (generated stub, FS25 Lua Atlas)

---@class TextElement : GuiElement
TextElement = {}

---@param target any
---@param custom_mt any
function TextElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function TextElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function TextElement:loadProfile(profile, applyProfile) end

---@param src any
function TextElement:copyAttributes(src) end

function TextElement:delete() end

---@param size any
function TextElement:setTextSize(size) end

---@param x any
---@param y any
function TextElement:setAbsolutePosition(x, y) end

---@param isDisabled any
function TextElement:setDisabled(isDisabled) end

function TextElement:updateAbsolutePosition() end

---@param text any
---@param forceTextSize any
---@param isInitializing any
---@param forceScrollingParameterUpdate any
---@return string
function TextElement:setText(text, forceTextSize, isInitializing, forceScrollingParameterUpdate) end

---@param text any
---@param forceTextSize any
---@param skipCallback any
---@param doNotUpdateSize any
function TextElement:setTextInternal(text, forceTextSize, skipCallback, doNotUpdateSize) end

function TextElement:getText() end

---@param value any
function TextElement:setValue(value) end

function TextElement:getValue() end

---@param format any
function TextElement:setFormat(format) end

---@param key any
function TextElement:setLocaKey(key) end

function TextElement:updateFormattedText() end

function TextElement:updateScrollingParameters() end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextSelectedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextFocusedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextFocusedSelectedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextHighlightedSelectedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setTextHighlightedColor(r, g, b, a) end

function TextElement:getTextColor() end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2Color(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2SelectedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2FocusedColor(r, g, b, a) end

---@param r any
---@param g any
---@param b any
---@param a any
function TextElement:setText2HighlightedColor(r, g, b, a) end

function TextElement:getText2Color() end

---@param useSourceText any
function TextElement:getTextWidth(useSourceText) end

---@param includeNegativeSpacing any
function TextElement:getTextHeight(includeNegativeSpacing) end

function TextElement:getTextOffset() end

function TextElement:getText2Offset() end

function TextElement:getIsScrollingAllowed() end

function TextElement:getTextLayoutMode() end

function TextElement:getDoRenderText() end

function TextElement:getTextPositionX() end

---@param lineHeight any
---@param totalHeight any
function TextElement:getTextPositionY(lineHeight, totalHeight) end

---@param dt any
function TextElement:update(dt) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function TextElement:draw(clipX1, clipY1, clipX2, clipY2) end

function TextElement:updateScrollingLayoutMode() end

---@param xScale number
function TextElement:updateScaledWidth(xScale) end

---@param forceTextSize any
function TextElement:updateSize(forceTextSize) end
