# ai/errors/AIMessageErrorFieldNotOwned.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorFieldNotOwned.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorFieldNotOwned.lua` — FS25 1.25.1.0

✍ AI message class for the case where the field is not owned by the farm. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorFieldNotOwned** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorFieldNotOwned.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the field is not owned by the farm. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorFieldNotOwned:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorFieldNotOwned` via `g_i18n`, used by `AIMessage:getMessage`. |
