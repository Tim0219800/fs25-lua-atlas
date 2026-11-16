# ai/errors/AIMessageSuccessFinishedJob.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageSuccessFinishedJob.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessFinishedJob.lua` — FS25 1.25.1.0

✍ AI message class for the non-error ending where the job finished successfully. It extends `AIMessage` and reports `AIMessageType.OK`.

- **AIMessageSuccessFinishedJob** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageSuccessFinishedJob.new(customMt: any)` | 16 | ✍ Constructor of the success message meaning: the job finished successfully. Inherits from `AIMessage`, no extra state. |
| `AIMessageSuccessFinishedJob:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageSuccessFinishedJob` via `g_i18n`. |
| `AIMessageSuccessFinishedJob:getType()` | 29 | ✍ Returns `AIMessageType.OK`, marking the message as a non-error outcome. |
