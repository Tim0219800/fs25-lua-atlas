---@meta
-- FS25 1.25.1.0 : gui/elements/MultiTextOptionElement.lua (generated stub, FS25 Lua Atlas)

---@class MultiTextOptionElement : GuiElement
MultiTextOptionElement = {}

---@param target any
---@param custom_mt any
function MultiTextOptionElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function MultiTextOptionElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function MultiTextOptionElement:loadProfile(profile, applyProfile) end

---@param parent any
---@param includeId any
---@param suppressOnCreate any
---@param blockFocusHandlingReload any
function MultiTextOptionElement:clone(parent, includeId, suppressOnCreate, blockFocusHandlingReload) end

---@param src any
function MultiTextOptionElement:copyAttributes(src) end

function MultiTextOptionElement:onGuiSetupFinished() end

function MultiTextOptionElement:setElementsByName() end

function MultiTextOptionElement:addDefaultElements() end

---@param state any
---@param forceEvent any
function MultiTextOptionElement:setState(state, forceEvent) end

function MultiTextOptionElement:getState() end

function MultiTextOptionElement:disableButtonSounds() end

---@param text any
---@param i any
function MultiTextOptionElement:addText(text, i) end

---@param texts any
function MultiTextOptionElement:setTexts(texts) end

---@param icons any
function MultiTextOptionElement:setIcons(icons) end

---@param labelString any
function MultiTextOptionElement:setLabel(labelString) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param button any
---@param eventUsed any
function MultiTextOptionElement:mouseEvent(posX, posY, isDown, isUp, button, eventUsed) end

---@param posX any
---@param posY any
---@param isDown any
---@param isUp any
---@param touchId any
---@param eventUsed any
function MultiTextOptionElement:touchEvent(posX, posY, isDown, isUp, touchId, eventUsed) end

---@param action any
---@param value any
---@param eventUsed any
function MultiTextOptionElement:inputEvent(action, value, eventUsed) end

---@param dt any
function MultiTextOptionElement:update(dt) end

---@param steps any
---@param noFocus any
function MultiTextOptionElement:onRightButtonClicked(steps, noFocus) end

---@param steps any
---@param noFocus any
function MultiTextOptionElement:onLeftButtonClicked(steps, noFocus) end

function MultiTextOptionElement:getCanChangeState() end

---@param canChangeState any
function MultiTextOptionElement:setCanChangeState(canChangeState) end

---@param element any
---@param direction any
function MultiTextOptionElement:canReceiveFocus(element, direction) end

function MultiTextOptionElement:onFocusLeave() end

function MultiTextOptionElement:onFocusEnter() end

function MultiTextOptionElement:updateContentElement() end
