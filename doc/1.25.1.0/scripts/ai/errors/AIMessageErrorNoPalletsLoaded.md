# ai/errors/AIMessageErrorNoPalletsLoaded.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorNoPalletsLoaded.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorNoPalletsLoaded.lua` — FS25 1.25.1.0

✍ AI message class for the case where no pallets are loaded. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorNoPalletsLoaded** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorNoPalletsLoaded.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: no pallets are loaded. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorNoPalletsLoaded:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorNoPalletsLoaded` via `g_i18n`, used by `AIMessage:getMessage`. |
| `AIMessageErrorNoPalletsLoaded:getType()` | 29 | ✍ Returns `AIMessageType.ERROR`; this is the same value the base class returns, so the override is redundant. |
