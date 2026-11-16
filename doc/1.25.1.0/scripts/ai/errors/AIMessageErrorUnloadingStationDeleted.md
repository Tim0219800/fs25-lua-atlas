# ai/errors/AIMessageErrorUnloadingStationDeleted.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorUnloadingStationDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnloadingStationDeleted.lua` — FS25 1.25.1.0

✍ AI message class for the case where the unloading station was deleted. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorUnloadingStationDeleted** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorUnloadingStationDeleted.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the unloading station was deleted. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorUnloadingStationDeleted:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorUnloadingStationDeleted` via `g_i18n`, used by `AIMessage:getMessage`. |
