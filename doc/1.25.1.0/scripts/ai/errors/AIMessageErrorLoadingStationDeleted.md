# ai/errors/AIMessageErrorLoadingStationDeleted.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorLoadingStationDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorLoadingStationDeleted.lua` — FS25 1.25.1.0

✍ AI message class for the case where the loading station was deleted. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorLoadingStationDeleted** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorLoadingStationDeleted.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the loading station was deleted. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorLoadingStationDeleted:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorLoadingStationDeleted` via `g_i18n`, used by `AIMessage:getMessage`. |
