# ai/errors/AIMessageErrorPalletsFull.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorPalletsFull.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorPalletsFull.lua` — FS25 1.25.1.0

✍ AI message class for the case where the pallet storage is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorPalletsFull** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorPalletsFull.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the pallet storage is full. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorPalletsFull:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorPalletsFull` via `g_i18n`, used by `AIMessage:getMessage`. |
| `AIMessageErrorPalletsFull:getType()` | 29 | ✍ Returns `AIMessageType.ERROR`; this is the same value the base class returns, so the override is redundant. |
