# ai/errors/AIMessageErrorOutOfFuel.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorOutOfFuel.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfFuel.lua` — FS25 1.25.1.0

✍ AI message class for the case where the vehicle ran out of fuel. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorOutOfFuel** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorOutOfFuel.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the vehicle ran out of fuel. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorOutOfFuel:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorOutOfFuel` via `g_i18n`, used by `AIMessage:getMessage`. |
