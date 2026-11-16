# ai/errors/AIMessageSuccessSiloEmpty.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageSuccessSiloEmpty.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessSiloEmpty.lua` — FS25 1.25.1.0

✍ AI message class for the non-error ending where the silo is empty so the job ended. It extends `AIMessage` and reports `AIMessageType.OK`.

- **AIMessageSuccessSiloEmpty** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageSuccessSiloEmpty.new(customMt: any)` | 16 | ✍ Constructor of the success message meaning: the silo is empty so the job ended. Inherits from `AIMessage`, no extra state. |
| `AIMessageSuccessSiloEmpty:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageSuccessSiloEmpty` via `g_i18n`. |
| `AIMessageSuccessSiloEmpty:getType()` | 29 | ✍ Returns `AIMessageType.OK`, marking the message as a non-error outcome. |
