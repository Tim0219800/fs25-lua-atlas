---@meta
-- FS25 1.25.1.0 : gui/elements/ToggleButtonElement.lua (stub généré, atlas Lua FS25)

---@class ToggleButtonElement : BitmapElement
ToggleButtonElement = {}

---@param target any
---@param custom_mt any
function ToggleButtonElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function ToggleButtonElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function ToggleButtonElement:loadProfile(profile, applyProfile) end

---@param src any
function ToggleButtonElement:copyAttributes(src) end

---@param isChecked any
function ToggleButtonElement:setIsChecked(isChecked) end

---@param element any
function ToggleButtonElement:addElement(element) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function ToggleButtonElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

function ToggleButtonElement:onButtonClicked() end

function ToggleButtonElement:canReceiveFocus() end

function ToggleButtonElement:getFocusTarget() end

function ToggleButtonElement:onFocusLeave() end

function ToggleButtonElement:onFocusEnter() end

function ToggleButtonElement:onFocusActivate() end
