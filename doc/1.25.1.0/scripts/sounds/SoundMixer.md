# sounds/SoundMixer.lua

Source : `dataS/scripts/sounds/SoundMixer.lua` — FS25 1.25.1.0

- **SoundMixer** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SoundMixer.new(customMt: any) → table, integer` | 18 |  |
| `SoundMixer:loadFromXML(xmlFilepath: string)` | 43 |  |
| `SoundMixer:delete()` | 113 |  |
| `SoundMixer:update(dt: any)` | 121 |  |
| `SoundMixer:setAudioGroupVolumeFactor(audioGroupIndex: any, factor: any)` | 208 |  |
| `SoundMixer:setMasterVolume(masterVolume: any)` | 221 |  |
| `SoundMixer:onGameStateChanged(gameStateId: any, oldGameState: any)` | 228 |  |
| `SoundMixer:addVolumeChangedListener(audioGroupIndex: any, func: any, target: any)` | 239 |  |

## Messages

- écoute `MessageType.GAME_STATE_CHANGED` (l.21)
