---@meta
-- FS25 1.25.1.0 : gui/base/IndexChangeSubjectMixin.lua (stub généré, atlas Lua FS25)

---@class IndexChangeSubjectMixin : GuiMixin
IndexChangeSubjectMixin = {}

function IndexChangeSubjectMixin.new() end

---@param guiElement any
function IndexChangeSubjectMixin:addTo(guiElement) end

---@param guiElement guiElement
---@param observer observer
---@param indexChangeCallback indexChangeCallback
function IndexChangeSubjectMixin.addIndexChangeObserver(guiElement, observer, indexChangeCallback) end

---@param guiElement guiElement
---@param index index
---@param count count
function IndexChangeSubjectMixin.notifyIndexChange(guiElement, index, count) end

---@param srcGuiElement any
---@param dstGuiElement any
function IndexChangeSubjectMixin:clone(srcGuiElement, dstGuiElement) end
