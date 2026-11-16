# ai/parameters/AIParameterLooping.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameterLooping.md)*

Source: `dataS/scripts/ai/parameters/AIParameterLooping.lua` — FS25 1.25.1.0

✍ AI job parameter holding a yes/no looping choice that the player toggles in the UI. It is saved to XML as a boolean attribute and streamed as one bool.

- **AIParameterLooping** inherits from `AIParameter` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameterLooping.new(customMt: any)` | 16 | ✍ Creates the parameter with type SELECTOR and looping off. |
| `AIParameterLooping:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 28 | ✍ Writes the looping flag to `#isLooping`. |
| `AIParameterLooping:loadFromXMLFile(xmlFile: any, key: any)` | 34 | ✍ Reads `#isLooping`, keeping the current value if absent. |
| `AIParameterLooping:readStream(streamId: any, connection: any)` | 40 | ✍ Reads one bool and applies it as the looping flag. |
| `AIParameterLooping:writeStream(streamId: any, connection: any)` | 46 | ✍ Writes the looping flag as one bool. |
| `AIParameterLooping:setIsLooping(isLooping: any)` | 52 | ✍ Sets the looping flag. |
| `AIParameterLooping:getIsLooping()` | 58 | ✍ Returns the looping flag. |
| `AIParameterLooping:getString()` | 64 | ✍ Returns the localized "looping" or "no looping" text. |
| `AIParameterLooping:setNextItem()` | 74 | ✍ Toggles the looping flag. |
| `AIParameterLooping:setPreviousItem()` | 80 | ✍ Toggles the looping flag, same as `setNextItem`. |
