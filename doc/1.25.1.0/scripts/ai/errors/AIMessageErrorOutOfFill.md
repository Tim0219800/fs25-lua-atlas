# ai/errors/AIMessageErrorOutOfFill.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorOutOfFill.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfFill.lua` — FS25 1.25.1.0

✍ AI message class for the case where the vehicle ran out of the material it works with. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorOutOfFill** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorOutOfFill.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the vehicle ran out of the material it works with. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorOutOfFill:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorOutOfFill` via `g_i18n`, used by `AIMessage:getMessage`. |
