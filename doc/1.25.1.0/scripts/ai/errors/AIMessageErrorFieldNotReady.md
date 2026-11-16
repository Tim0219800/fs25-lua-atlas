# ai/errors/AIMessageErrorFieldNotReady.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorFieldNotReady.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorFieldNotReady.lua` — FS25 1.25.1.0

✍ AI message class for the case where the field is not ready for the work. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorFieldNotReady** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorFieldNotReady.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the field is not ready for the work. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorFieldNotReady:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorFieldNotReady` via `g_i18n`, used by `AIMessage:getMessage`. |
