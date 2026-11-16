# ai/errors/AIMessageErrorVehicleDeleted.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorVehicleDeleted.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorVehicleDeleted.lua` — FS25 1.25.1.0

✍ AI message class for the case where the vehicle was deleted. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.

- **AIMessageErrorVehicleDeleted** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorVehicleDeleted.new(customMt: any)` | 16 | ✍ Constructor of the AI error message meaning: the vehicle was deleted. Inherits from `AIMessage` and adds no state. |
| `AIMessageErrorVehicleDeleted:getI18NText()` | 23 | ✍ Returns the localized text for the key `ai_messageErrorVehicleDeleted` via `g_i18n`, used by `AIMessage:getMessage`. |
