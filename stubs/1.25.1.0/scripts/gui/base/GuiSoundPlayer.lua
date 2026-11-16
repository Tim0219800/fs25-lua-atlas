---@meta
-- FS25 1.25.1.0 : gui/base/GuiSoundPlayer.lua (generated stub, FS25 Lua Atlas)

--- Loads the menu and HUD sound samples as non-spatial 2D samples in the GUI audio group and plays them by name. Each sound gets a small pool of cloned samples so several can overlap, with a minimum delay between replays. Constants such as SOUND_SAMPLES, NUM_SAMPLES_PER_SOUND and SAMPLE_REPLAY_TIMEOUT are defined in this file's blank region of the dump or elsewhere (UNVERIFIED).
---@class GuiSoundPlayer
GuiSoundPlayer = {}

--- Stores the SoundManager reference and loads all samples from GuiSoundPlayer.SOUND_SAMPLE_DEFINITIONS_PATH into the soundSamples table.
---@param soundManager table
---@return GuiSoundPlayer
function GuiSoundPlayer.new(soundManager) end

--- Opens the definitions XML and, for each known sound name except NONE, loads a 2D sample and clones it to build a pool; returns a name to sample-list table. Logs a warning for samples that fail to load, and closes the XML file.
---@param sampleDefinitionXmlPath any
function GuiSoundPlayer:loadSounds(sampleDefinitionXmlPath) end

--- Plays the first free sample of the named sound. Does nothing for NONE, or if the sound played less than the replay timeout ago (g_time based), or if all pool entries are busy; warns in dev mode for unknown names.
---@param sampleName string
function GuiSoundPlayer:playSample(sampleName) end
