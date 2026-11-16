# ai/errors/AIMessageErrorVehicleBroken.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorVehicleBroken.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVehicleBroken.lua` — FS25 1.25.1.0

✍ AI message class for the case where the vehicle is broken. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorVehicleBroken** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorVehicleBroken.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the vehicle is broken. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorVehicleBroken:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorVehicleBroken` via `g_i18n`, used by `AIMessage:getMessage`. |
