# gui/base/GuiSoundPlayer.lua

*[Version française](../../../fr/scripts/gui/base/GuiSoundPlayer.md)*

Source: `dataS/scripts/gui/base/GuiSoundPlayer.lua` — FS25 1.25.1.0

✍ Loads the menu and HUD sound samples as non-spatial 2D samples in the GUI audio group and plays them by name. Each sound gets a small pool of cloned samples so several can overlap, with a minimum delay between replays. Constants such as SOUND_SAMPLES, NUM_SAMPLES_PER_SOUND and SAMPLE_REPLAY_TIMEOUT are defined in this file's blank region of the dump or elsewhere (UNVERIFIED).

- **GuiSoundPlayer** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `GuiSoundPlayer.new(soundManager: table) → GuiSoundPlayer` | 98 | ✍ Stores the SoundManager reference and loads all samples from GuiSoundPlayer.SOUND_SAMPLE_DEFINITIONS_PATH into the soundSamples table. |
| `GuiSoundPlayer:loadSounds(sampleDefinitionXmlPath: any)` | 118 | ✍ Opens the definitions XML and, for each known sound name except NONE, loads a 2D sample and clones it to build a pool; returns a name to sample-list table. Logs a warning for samples that fail to load, and closes the XML file. |
| `GuiSoundPlayer:playSample(sampleName: string)` | 153 | ✍ Plays the first free sample of the named sound. Does nothing for NONE, or if the sound played less than the replay timeout ago (g_time based), or if all pool entries are busy; warns in dev mode for unknown names. |
