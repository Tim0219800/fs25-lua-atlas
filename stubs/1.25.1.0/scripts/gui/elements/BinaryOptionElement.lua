---@meta
-- FS25 1.25.1.0 : gui/elements/BinaryOptionElement.lua (generated stub, FS25 Lua Atlas)

---@class BinaryOptionElement : MultiTextOptionElement
BinaryOptionElement = {}

---@param target any
---@param custom_mt any
function BinaryOptionElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function BinaryOptionElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function BinaryOptionElement:loadProfile(profile, applyProfile) end

---@param src any
function BinaryOptionElement:copyAttributes(src) end

function BinaryOptionElement:setElementsByName() end

function BinaryOptionElement:addDefaultElements() end

function BinaryOptionElement:onGuiSetupFinished() end

function BinaryOptionElement:getIsChecked() end

---@param isChecked any
---@param skipAnimation any
---@param forceEvent any
function BinaryOptionElement:setIsChecked(isChecked, skipAnimation, forceEvent) end

function BinaryOptionElement:getIsActiveNonRec() end

---@param texts any
function BinaryOptionElement:setTexts(texts) end

---@param dt any
function BinaryOptionElement:update(dt) end

function BinaryOptionElement:inputLeft() end

function BinaryOptionElement:inputRight() end

---@param state any
---@param forceEvent any
---@param skipAnimation any
function BinaryOptionElement:setState(state, forceEvent, skipAnimation) end

function BinaryOptionElement:onRightButtonClicked() end

function BinaryOptionElement:onLeftButtonClicked() end

function BinaryOptionElement:updateSelection() end
