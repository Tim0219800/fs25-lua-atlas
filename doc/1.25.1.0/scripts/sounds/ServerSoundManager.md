# sounds/ServerSoundManager.lua

*[Version française](../../fr/scripts/sounds/ServerSoundManager.md)*

Source: `dataS/scripts/sounds/ServerSoundManager.lua` — FS25 1.25.1.0

✍ Subclass of SoundManager intended for the dedicated server, where sounds are not played. The file also redefines SoundManager:cloneSample, which is a global override of the parent class rather than a subclass method.

- **ServerSoundManager** inherits from `SoundManager` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ServerSoundManager.new(customMt: any) → table` | 18 | ✍ Constructor. Note: it calls SoundManager.new with the given metatable or the ServerSoundManager one and returns that object. |
| `SoundManager:cloneSample(sample: table, linkNode: integer, modifierTargetObject: any) → table` | 29 | ✍ Note: defined on SoundManager, not ServerSoundManager, so it overrides the base method once this file is loaded. Clones the sample table and its modifiers without creating any audio source, registers it and returns it. |
