---@meta
-- FS25 1.25.1.0 : gui/base/PlaySampleMixin.lua (generated stub, FS25 Lua Atlas)

--- GuiMixin that lets a GuiElement ask for UI sound samples through a replaceable callback; muting is possible per element. Sample names are expected to come from `GuiSoundPlayer.SOUND_SAMPLES` (defined elsewhere, UNVERIFIED). Client-side only.
---@class PlaySampleMixin : GuiMixin
PlaySampleMixin = {}

--- Creates the mixin instance through `GuiMixin.new` with its own metatable.
function PlaySampleMixin.new() end

--- Attaches the mixin to a GuiElement and adds `setPlaySampleCallback`, `playSample` and `disablePlaySample`; the callback starts as the empty `NO_CALLBACK`. Returns whether it was added.
---@param guiElement any
function PlaySampleMixin:addTo(guiElement) end

--- Sets the function called with a sample name whenever the element wants to play a UI sound.
---@param guiElement table
---@param callback function
function PlaySampleMixin.setPlaySampleCallback(guiElement, callback) end

--- Calls the play callback with the sample name unless the element's `soundDisabled` field is truthy.
---@param guiElement table
---@param sampleName string
function PlaySampleMixin.playSample(guiElement, sampleName) end

--- Replaces the callback with `NO_CALLBACK`; a later `setPlaySampleCallback` can set a new one again.
---@param guiElement any
function PlaySampleMixin.disablePlaySample(guiElement) end

--- Copies the play callback from a source element to its clone.
---@param srcGuiElement any
---@param dstGuiElement any
function PlaySampleMixin:clone(srcGuiElement, dstGuiElement) end
