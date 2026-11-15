---@meta
-- FS25 1.25.1.0 : gui/elements/BoxLayoutElement.lua (stub généré, atlas Lua FS25)

---@class BoxLayoutElement : BitmapElement
BoxLayoutElement = {}

---@param target any
---@param custom_mt any
function BoxLayoutElement.new(target, custom_mt) end

---@param xmlFile any
---@param key any
function BoxLayoutElement:loadFromXML(xmlFile, key) end

---@param profile any
---@param applyProfile any
function BoxLayoutElement:loadProfile(profile, applyProfile) end

---@param src any
function BoxLayoutElement:copyAttributes(src) end

function BoxLayoutElement:onGuiSetupFinished() end

---@param element any
function BoxLayoutElement:addElement(element) end

---@param element any
function BoxLayoutElement:removeElement(element) end

---@param element any
---@param ignoreVisibility any
function BoxLayoutElement:getIsElementIncluded(element, ignoreVisibility) end

---@param ignoreVisibility boolean
function BoxLayoutElement:updateLayoutCells(ignoreVisibility) end

---@param offsetX integer
---@param offsetY integer
function BoxLayoutElement:applyCellPositions(offsetX, offsetY) end

function BoxLayoutElement:focusLinkCells() end

function BoxLayoutElement:canReceiveFocus() end

function BoxLayoutElement:onFocusLeave() end

function BoxLayoutElement:updateAbsolutePosition() end
