---@meta
-- FS25 1.25.1.0 : gui/elements/OptionSliderElement.lua (stub généré, atlas Lua FS25)

---@class OptionSliderElement : MultiTextOptionElement
OptionSliderElement = {}

---@param target any
---@param custom_mt any
function OptionSliderElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function OptionSliderElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function OptionSliderElement:loadProfile(profile, applyProfile) end

---@param src any
function OptionSliderElement:copyAttributes(src) end

function OptionSliderElement:setElementsByName() end

function OptionSliderElement:addDefaultElements() end

function OptionSliderElement:onOpen() end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function OptionSliderElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function OptionSliderElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

function OptionSliderElement:updateSlider() end

function OptionSliderElement:updateAbsolutePosition() end

function OptionSliderElement:updateContentElement() end
