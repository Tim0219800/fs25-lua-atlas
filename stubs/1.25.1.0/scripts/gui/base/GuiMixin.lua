---@meta
-- FS25 1.25.1.0 : gui/base/GuiMixin.lua (generated stub, FS25 Lua Atlas)

---@class GuiMixin
GuiMixin = {}

---@param class class
---@param mixinType mixinType
---@return New
function GuiMixin.new(class, mixinType) end

---@param guiElement any
function GuiMixin:addTo(guiElement) end

---@param guiElement guiElement
---@param mixinType mixinType
function GuiMixin.hasIncluded(guiElement, mixinType) end

---@param mixinType any
---@param srcGuiElement any
---@param dstGuiElement any
function GuiMixin.cloneMixin(mixinType, srcGuiElement, dstGuiElement) end

---@param srcGuiElement any
---@param dstGuiElement any
function GuiMixin:clone(srcGuiElement, dstGuiElement) end
