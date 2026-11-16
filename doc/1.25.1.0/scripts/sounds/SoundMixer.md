# sounds/SoundMixer.lua

*[Version française](../../fr/scripts/sounds/SoundMixer.md)*

Source: `dataS/scripts/sounds/SoundMixer.lua` — FS25 1.25.1.0

✍ Client-side mixer that sets the volume of each audio group according to the current game state, with fade in and fade out. Per-state volumes come from a sound mixer XML; extra per-group factors and a master volume can be applied on top. It listens to GAME_STATE_CHANGED on the message center and exposes a console command for debug mode.

- **SoundMixer** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `SoundMixer.new(customMt: any) → table, integer` | 18 | ✍ Creates the mixer, subscribes to game state changes, sets every audio group's factor to 1 and registers the console command gsSoundMixerDebug. |
| `SoundMixer:loadFromXML(xmlFilepath: string)` | 43 | ✍ Reads game state entries with audioGroup volume and fade settings from the XML. Then sets every group volume to 0 (engine call setAudioGroupVolume); update() fades them up once the state is dirty. Unknown states or groups log a warning. Note: fadeInDuration is read from the #fadeOutDuration attribute, so fade-in equals fade-out. |
| `SoundMixer:delete()` | 113 | ✍ Unsubscribes from all messages and removes the debug console command. |
| `SoundMixer:update(dt: any)` | 121 | ✍ When flagged dirty, moves each group volume of the current game state toward its target (state volume times group factor) at a rate based on dt and the fade duration. Notifies the volume listeners and clears the flag once all targets are reached. |
| `SoundMixer:setAudioGroupVolumeFactor(audioGroupIndex: any, factor: any)` | 208 | ✍ Sets a multiplier for one audio group and marks the mixer dirty so the volume fades toward the new target. Ignored for nil or unknown groups. |
| `SoundMixer:setMasterVolume(masterVolume: any)` | 221 | ✍ Stores the master volume and forwards it to the engine function setMasterVolume. |
| `SoundMixer:onGameStateChanged(gameStateId: any, oldGameState: any)` | 228 | ✍ Message handler: marks the mixer dirty if the new game state has mixing settings, so update() starts fading. |
| `SoundMixer:addVolumeChangedListener(audioGroupIndex: any, func: any, target: any)` | 239 | ✍ Registers a callback (func, target) called as func(target, audioGroupIndex, volume) whenever that group's volume changes. Duplicates are not prevented. |

## Messages

- subscribes `MessageType.GAME_STATE_CHANGED` (l.21)
