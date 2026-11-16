# ai/errors/AIMessageManager.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageManager.md)*

Source: `dataS/scripts/ai/errors/AIMessageManager.lua` — FS25 1.25.1.0

✍ Manager that registers every AI message class under an upper-case name and an index, and creates instances from that index. `loadMapData` registers the 24 error and 3 success messages of the base game; the index is what `AIJobStopEvent` sends over the network.

- **AIMessageManager** (l.48)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageManager.new(customMt: any) → table` | 53 | ✍ Creates the manager instance; the tables are only filled later by `loadMapData`. |
| `AIMessageManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 61 | ✍ Resets the lookup tables and registers all base-game AI messages (ERROR_* and SUCCESS_*). The order of registration defines the network indices. Returns nothing despite the map-data convention. |
| `AIMessageManager:delete()` | 98 | ✍ Clears the message list and both lookup tables. |
| `AIMessageManager:registerMessage(name: any, classObject: any)` | 106 | ✍ Registers a message class under an upper-cased name. Returns nil with a warning if the name is invalid, already used or the class is nil; otherwise returns the entry. Mods can use it to add messages. |
| `AIMessageManager:getMessageIndex(messageObject: any)` | 137 | ✍ Returns the registration index of the class of the given message object, or nil if its class is unknown. |
| `AIMessageManager:createMessage(messageIndex: any)` | 149 | ✍ Instantiates the message class registered at the index by calling its `new()` without arguments. Returns nil if the index is nil or unknown. Note: classes needing constructor arguments, like `AIMessageErrorCouldNotPrepare`, get nil and rely on `readStream`. |
