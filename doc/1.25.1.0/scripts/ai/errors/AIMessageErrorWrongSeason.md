# ai/errors/AIMessageErrorWrongSeason.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorWrongSeason.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorWrongSeason.lua` — FS25 1.25.1.0

✍ AI message class for the case where the work is not possible in the current season. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorWrongSeason** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorWrongSeason.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the work is not possible in the current season. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorWrongSeason:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorWrongSeason` via `g_i18n`, used by `AIMessage:getMessage`. |
