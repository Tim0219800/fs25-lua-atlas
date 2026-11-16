# ai/errors/AIMessageErrorThreshingNotAllowed.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorThreshingNotAllowed.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorThreshingNotAllowed.lua` — FS25 1.25.1.0

✍ AI message class for the case where threshing is not allowed at this time. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorThreshingNotAllowed** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorThreshingNotAllowed.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: threshing is not allowed at this time. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorThreshingNotAllowed:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorThreshingNotAllowed` via `g_i18n`, used by `AIMessage:getMessage`. |
