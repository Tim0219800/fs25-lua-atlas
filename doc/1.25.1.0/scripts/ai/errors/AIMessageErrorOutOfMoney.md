# ai/errors/AIMessageErrorOutOfMoney.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorOutOfMoney.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorOutOfMoney.lua` — FS25 1.25.1.0

✍ AI message class for the case where the farm cannot pay for the job. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorOutOfMoney** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorOutOfMoney.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the farm cannot pay for the job. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorOutOfMoney:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorOutOfMoney` via `g_i18n`, used by `AIMessage:getMessage`. |
