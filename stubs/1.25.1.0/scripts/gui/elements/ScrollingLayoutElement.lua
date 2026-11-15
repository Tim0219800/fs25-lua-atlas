---@meta
-- FS25 1.25.1.0 : gui/elements/ScrollingLayoutElement.lua (stub généré, atlas Lua FS25)

---@class ScrollingLayoutElement : BoxLayoutElement
ScrollingLayoutElement = {}

---@param target any
---@param custom_mt any
function ScrollingLayoutElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function ScrollingLayoutElement:loadFromXML(xmlFile, key) end

---@param src any
function ScrollingLayoutElement:copyAttributes(src) end

function ScrollingLayoutElement:onGuiSetupFinished() end

---@param ignoreVisibility any
---@param blockLayoutUpdate any
function ScrollingLayoutElement:invalidateLayout(ignoreVisibility, blockLayoutUpdate) end

---@param slider any
---@param newValue any
function ScrollingLayoutElement:onSliderValueChanged(slider, newValue) end

---@param startPos any
---@param updateSlider any
---@param noUpdateTarget any
function ScrollingLayoutElement:scrollTo(startPos, updateSlider, noUpdateTarget) end

function ScrollingLayoutElement:raiseSliderUpdateEvent() end

---@param element any
function ScrollingLayoutElement:removeElement(element) end

function ScrollingLayoutElement:removeActionEvents() end

---@param _ any
---@param inputValue any
function ScrollingLayoutElement:onVerticalCursorInput(_, inputValue) end
