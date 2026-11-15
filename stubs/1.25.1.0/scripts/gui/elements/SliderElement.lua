---@meta
-- FS25 1.25.1.0 : gui/elements/SliderElement.lua (stub généré, atlas Lua FS25)

---@class SliderElement : GuiElement
SliderElement = {}

---@param target any
---@param custom_mt any
function SliderElement.new(target, custom_mt) end

function SliderElement:delete() end

---@param xmlFile any
---@param key any
function SliderElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function SliderElement:loadProfile(profile, applyProfile) end

---@param src any
function SliderElement:copyAttributes(src) end

---@param visible any
function SliderElement:setSliderVisible(visible) end

function SliderElement:onGuiSetupFinished() end

---@param element any
function SliderElement:addElement(element) end

---@param element any
function SliderElement:setDataElement(element) end

---@param newValue any
---@param doNotUpdateDataElement any
---@param immediateMode any
function SliderElement:setValue(newValue, doNotUpdateDataElement, immediateMode) end

function SliderElement:updateSliderButtons() end

---@param minValue any
function SliderElement:setMinValue(minValue) end

---@param maxValue any
---@param newCurrentValue any
function SliderElement:setMaxValue(maxValue, newCurrentValue) end

function SliderElement:getMinValue() end

function SliderElement:getMaxValue() end

function SliderElement:getValue() end

function SliderElement:updateAbsolutePosition() end

---@param x any
---@param y any
function SliderElement:setSize(x, y) end

---@param visibleItems any
---@param maxItems any
function SliderElement:setSliderSize(visibleItems, maxItems) end

function SliderElement:updateSliderLimits() end

---@param alpha any
function SliderElement:setAlpha(alpha) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function SliderElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

function SliderElement:updateSliderPosition() end

function SliderElement:callOnChanged() end

---@param unicode any
---@param sym any
---@param modifier any
---@param isDown any
---@param eventUsed any
function SliderElement:keyEvent(unicode, sym, modifier, isDown, eventUsed) end

---@param clipX1 any
---@param clipY1 any
---@param clipX2 any
---@param clipY2 any
function SliderElement:draw(clipX1, clipY1, clipX2, clipY2) end

function SliderElement:canReceiveFocus() end

function SliderElement:onFocusActivate() end

function SliderElement:onScrollUp() end

function SliderElement:onScrollDown() end

---@param element any
function SliderElement:onBindUpdate(element) end

---@param posX any
---@param posY any
function SliderElement:isOutOfBound(posX, posY) end
