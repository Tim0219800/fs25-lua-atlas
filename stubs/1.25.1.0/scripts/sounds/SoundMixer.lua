---@meta
-- FS25 1.25.1.0 : sounds/SoundMixer.lua (generated stub, FS25 Lua Atlas)

--- Client-side mixer that sets the volume of each audio group according to the current game state, with fade in and fade out. Per-state volumes come from a sound mixer XML; extra per-group factors and a master volume can be applied on top. It listens to GAME_STATE_CHANGED on the message center and exposes a console command for debug mode.
---@class SoundMixer
SoundMixer = {}

--- Creates the mixer, subscribes to game state changes, sets every audio group's factor to 1 and registers the console command gsSoundMixerDebug.
---@param customMt any
---@return table
---@return integer
function SoundMixer.new(customMt) end

--- Reads game state entries with audioGroup volume and fade settings from the XML. Then sets every group volume to 0 (engine call setAudioGroupVolume); update() fades them up once the state is dirty. Unknown states or groups log a warning. Note: fadeInDuration is read from the #fadeOutDuration attribute, so fade-in equals fade-out.
---@param xmlFilepath string
function SoundMixer:loadFromXML(xmlFilepath) end

--- Unsubscribes from all messages and removes the debug console command.
function SoundMixer:delete() end

--- When flagged dirty, moves each group volume of the current game state toward its target (state volume times group factor) at a rate based on dt and the fade duration. Notifies the volume listeners and clears the flag once all targets are reached.
---@param dt any
function SoundMixer:update(dt) end

--- Sets a multiplier for one audio group and marks the mixer dirty so the volume fades toward the new target. Ignored for nil or unknown groups.
---@param audioGroupIndex any
---@param factor any
function SoundMixer:setAudioGroupVolumeFactor(audioGroupIndex, factor) end

--- Stores the master volume and forwards it to the engine function setMasterVolume.
---@param masterVolume any
function SoundMixer:setMasterVolume(masterVolume) end

--- Message handler: marks the mixer dirty if the new game state has mixing settings, so update() starts fading.
---@param gameStateId any
---@param oldGameState any
function SoundMixer:onGameStateChanged(gameStateId, oldGameState) end

--- Registers a callback (func, target) called as func(target, audioGroupIndex, volume) whenever that group's volume changes. Duplicates are not prevented.
---@param audioGroupIndex any
---@param func any
---@param target any
function SoundMixer:addVolumeChangedListener(audioGroupIndex, func, target) end
