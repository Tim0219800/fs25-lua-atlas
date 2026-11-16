# ai/errors/AIMessageSuccessStoppedByUser.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageSuccessStoppedByUser.md)*

Source: `dataS/scripts/ai/errors/AIMessageSuccessStoppedByUser.lua` — FS25 1.25.1.0

✍ AI message class for the non-error ending where the player stopped the job. It extends `AIMessage` and reports `AIMessageType.OK`.

- **AIMessageSuccessStoppedByUser** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageSuccessStoppedByUser.new(customMt: any)` | 16 | ✍ Constructor of the success message meaning: the player stopped the job. Inherits from `AIMessage`, no extra state. |
| `AIMessageSuccessStoppedByUser:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageSuccessStoppedByUser` via `g_i18n`. |
| `AIMessageSuccessStoppedByUser:getType()` | 29 | ✍ Returns `AIMessageType.OK`, marking the message as a non-error outcome. |
