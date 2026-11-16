# ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorNoValidFillTypeLoaded.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua` — FS25 1.25.1.0

✍ AI message class for the case where no valid fill type is loaded. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorNoValidFillTypeLoaded** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorNoValidFillTypeLoaded.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: no valid fill type is loaded. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorNoValidFillTypeLoaded:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorNoValidFillTypeLoaded` via `g_i18n`, used by `AIMessage:getMessage`. |
