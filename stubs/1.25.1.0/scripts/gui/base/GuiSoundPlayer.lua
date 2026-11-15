---@meta
-- FS25 1.25.1.0 : gui/base/GuiSoundPlayer.lua (generated stub, FS25 Lua Atlas)

---@class GuiSoundPlayer
GuiSoundPlayer = {}

---@param soundManager table
---@return GuiSoundPlayer
function GuiSoundPlayer.new(soundManager) end

---@param sampleDefinitionXmlPath any
function GuiSoundPlayer:loadSounds(sampleDefinitionXmlPath) end

---@param sampleName string
function GuiSoundPlayer:playSample(sampleName) end
