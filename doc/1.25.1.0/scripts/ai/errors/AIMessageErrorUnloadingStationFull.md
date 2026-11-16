# ai/errors/AIMessageErrorUnloadingStationFull.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorUnloadingStationFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnloadingStationFull.lua` — FS25 1.25.1.0

✍ AI message class for the case where the unloading station is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorUnloadingStationFull** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorUnloadingStationFull.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the unloading station is full. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorUnloadingStationFull:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorUnloadingStationFull` via `g_i18n`, used by `AIMessage:getMessage`. |
