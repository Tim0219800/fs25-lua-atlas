---@meta
-- FS25 1.25.1.0 : gui/base/IndexChangeSubjectMixin.lua (generated stub, FS25 Lua Atlas)

--- GuiMixin that gives a GuiElement an observer list for index changes (paging, option selectors, lists). Observers register a callback receiving the new index and the item count. Prerequisite: the element must be decorated through the GuiMixin mechanism.
---@class IndexChangeSubjectMixin : GuiMixin
IndexChangeSubjectMixin = {}

--- Creates the mixin with an empty callbacks table keyed by observer. Note: it passes `IndexableElementMixin_mt` to `GuiMixin.new`, apparently a copy-paste slip instead of its own metatable.
function IndexChangeSubjectMixin.new() end

--- Attaches the mixin to a GuiElement through the parent `addTo` and, on success, adds `addIndexChangeObserver` and `notifyIndexChange` as methods of the element. Returns whether it was added.
---@param guiElement any
function IndexChangeSubjectMixin:addTo(guiElement) end

--- Registers or replaces the callback of an observer; it is called as callback(observer, index, count). One callback per observer.
---@param guiElement guiElement
---@param observer observer
---@param indexChangeCallback indexChangeCallback
function IndexChangeSubjectMixin.addIndexChangeObserver(guiElement, observer, indexChangeCallback) end

--- Calls every registered callback with the observer, the new index and the item count. Iteration uses `pairs`, so call order is not defined.
---@param guiElement guiElement
---@param index index
---@param count count
function IndexChangeSubjectMixin.notifyIndexChange(guiElement, index, count) end

--- Copies the callbacks table (shallow clone) from a source GuiElement to its clone when the source has one.
---@param srcGuiElement any
---@param dstGuiElement any
function IndexChangeSubjectMixin:clone(srcGuiElement, dstGuiElement) end
