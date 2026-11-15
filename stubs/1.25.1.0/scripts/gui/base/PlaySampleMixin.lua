---@meta
-- FS25 1.25.1.0 : gui/base/PlaySampleMixin.lua (stub généré, atlas Lua FS25)

---@class PlaySampleMixin : GuiMixin
PlaySampleMixin = {}

function PlaySampleMixin.new() end

---@param guiElement any
function PlaySampleMixin:addTo(guiElement) end

---@param guiElement table
---@param callback function
function PlaySampleMixin.setPlaySampleCallback(guiElement, callback) end

---@param guiElement table
---@param sampleName string
function PlaySampleMixin.playSample(guiElement, sampleName) end

---@param guiElement any
function PlaySampleMixin.disablePlaySample(guiElement) end

---@param srcGuiElement any
---@param dstGuiElement any
function PlaySampleMixin:clone(srcGuiElement, dstGuiElement) end
