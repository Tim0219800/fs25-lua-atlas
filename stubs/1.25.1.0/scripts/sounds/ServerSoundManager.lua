---@meta
-- FS25 1.25.1.0 : sounds/ServerSoundManager.lua (generated stub, FS25 Lua Atlas)

--- Subclass of SoundManager intended for the dedicated server, where sounds are not played. The file also redefines SoundManager:cloneSample, which is a global override of the parent class rather than a subclass method.
---@class ServerSoundManager : SoundManager
ServerSoundManager = {}

--- Constructor. Note: it calls SoundManager.new with the given metatable or the ServerSoundManager one and returns that object.
---@param customMt any
---@return table
function ServerSoundManager.new(customMt) end

--- Note: defined on SoundManager, not ServerSoundManager, so it overrides the base method once this file is loaded. Clones the sample table and its modifiers without creating any audio source, registers it and returns it.
---@param sample table
---@param linkNode integer
---@param modifierTargetObject any
---@return table
function SoundManager:cloneSample(sample, linkNode, modifierTargetObject) end
