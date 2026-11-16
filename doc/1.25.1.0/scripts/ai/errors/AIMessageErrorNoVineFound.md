# ai/errors/AIMessageErrorNoVineFound.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorNoVineFound.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoVineFound.lua` — FS25 1.25.1.0

✍ AI message class for the case where no vine was found. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorNoVineFound** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorNoVineFound.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: no vine was found. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorNoVineFound:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorNoVineFound` via `g_i18n`, used by `AIMessage:getMessage`. |
