# ai/errors/AIMessageErrorVineyardNotSupported.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorVineyardNotSupported.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVineyardNotSupported.lua` — FS25 1.25.1.0

✍ AI message class for the case where the vineyard is not supported by this job. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorVineyardNotSupported** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorVineyardNotSupported.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the vineyard is not supported by this job. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorVineyardNotSupported:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorVineyardNotSupported` via `g_i18n`, used by `AIMessage:getMessage`. |
