---@meta
-- FS25 1.25.1.0 : sounds/SoundMixer.lua (stub généré, atlas Lua FS25)

---@class SoundMixer
SoundMixer = {}

---@param customMt any
---@return table
---@return integer
function SoundMixer.new(customMt) end

---@param xmlFilepath string
function SoundMixer:loadFromXML(xmlFilepath) end

function SoundMixer:delete() end

---@param dt any
function SoundMixer:update(dt) end

---@param audioGroupIndex any
---@param factor any
function SoundMixer:setAudioGroupVolumeFactor(audioGroupIndex, factor) end

---@param masterVolume any
function SoundMixer:setMasterVolume(masterVolume) end

---@param gameStateId any
---@param oldGameState any
function SoundMixer:onGameStateChanged(gameStateId, oldGameState) end

---@param audioGroupIndex any
---@param func any
---@param target any
function SoundMixer:addVolumeChangedListener(audioGroupIndex, func, target) end
