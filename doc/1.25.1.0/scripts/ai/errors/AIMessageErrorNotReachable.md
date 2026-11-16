# ai/errors/AIMessageErrorNotReachable.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorNotReachable.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNotReachable.lua` — FS25 1.25.1.0

✍ AI message class for the case where the target cannot be reached. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorNotReachable** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorNotReachable.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the target cannot be reached. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorNotReachable:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorNotReachable` via `g_i18n`, used by `AIMessage:getMessage`. |
