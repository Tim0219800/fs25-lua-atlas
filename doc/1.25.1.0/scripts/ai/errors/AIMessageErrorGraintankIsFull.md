# ai/errors/AIMessageErrorGraintankIsFull.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorGraintankIsFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorGraintankIsFull.lua` — FS25 1.25.1.0

✍ AI message class for the case where the grain tank is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorGraintankIsFull** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorGraintankIsFull.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the grain tank is full. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorGraintankIsFull:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorTankIsFull` via `g_i18n`, used by `AIMessage:getMessage`. |
