# ai/errors/AIMessageErrorNoFieldFound.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorNoFieldFound.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoFieldFound.lua` — FS25 1.25.1.0

✍ AI message class for the case where no field was found at the start position. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorNoFieldFound** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorNoFieldFound.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: no field was found at the start position. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorNoFieldFound:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorNoFieldFound` via `g_i18n`, used by `AIMessage:getMessage`. |
