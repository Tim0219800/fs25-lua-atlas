---@meta
-- FS25 1.25.1.0 : gui/base/GuiMixin.lua (generated stub, FS25 Lua Atlas)

--- Base class for GUI element mixins, small objects attached to a GuiElement to add behaviour. The mixin instance is stored on the element under its mixinType key, and concrete mixins subclass this class and override clone.
---@class GuiMixin
GuiMixin = {}

--- Creates a mixin instance; class defaults to the GuiMixin metatable and mixinType to GuiMixin. Subclasses pass their own type table, which is later used as the storage key on the element.
---@param class class
---@param mixinType mixinType
---@return New
function GuiMixin.new(class, mixinType) end

--- Attaches this mixin to a GuiElement under element[mixinType] and copies the hasIncluded helper onto it. Returns true on success, false if that mixin type was already present.
---@param guiElement any
function GuiMixin:addTo(guiElement) end

--- Returns true when the element holds an entry for the given mixin type. Installed on elements by addTo, so it can be called as element:hasIncluded(type).
---@param guiElement guiElement
---@param mixinType mixinType
function GuiMixin.hasIncluded(guiElement, mixinType) end

--- Static helper that forwards to mixinType:clone to copy mixin state between two elements.
---@param mixinType any
---@param srcGuiElement any
---@param dstGuiElement any
function GuiMixin.cloneMixin(mixinType, srcGuiElement, dstGuiElement) end

--- Empty hook in the base class; subclasses override it to copy their state from the source element to the destination element.
---@param srcGuiElement any
---@param dstGuiElement any
function GuiMixin:clone(srcGuiElement, dstGuiElement) end
