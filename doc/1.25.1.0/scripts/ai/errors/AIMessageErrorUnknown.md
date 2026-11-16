# ai/errors/AIMessageErrorUnknown.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorUnknown.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorUnknown.lua` — FS25 1.25.1.0

✍ AI message class for the case where an unspecified error occurred. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorUnknown** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorUnknown.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: an unspecified error occurred. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorUnknown:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorUnknown` via `g_i18n`, used by `AIMessage:getMessage`. |
