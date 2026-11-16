# ai/parameters/AIParameter.lua

*[Version française](../../../fr/scripts/ai/parameters/AIParameter.md)*

Source: `dataS/scripts/ai/parameters/AIParameter.lua` — FS25 1.25.1.0

✍ Base class of the values a player edits when setting up an AI job. It holds a type (`AIParameterType`, default TEXT) and a validity flag, and offers empty hooks for network serialization; subclasses add storage, validation and UI value cycling.

- **AIParameter** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIParameter.new(customMt: any)` | 16 | ✍ Creates a parameter of type TEXT that starts valid. |
| `AIParameter:readStream(streamId: any, connection: any)` | 27 | ✍ Empty hook for reading the value from a network stream. |
| `AIParameter:writeStream(streamId: any, connection: any)` | 32 | ✍ Empty hook for writing the value to a network stream. |
| `AIParameter:getType()` | 37 | ✍ Returns the `AIParameterType` of the parameter. |
| `AIParameter:getIsValid()` | 43 | ✍ Returns the validity flag, which the UI can use to highlight an invalid parameter. |
| `AIParameter:setIsValid(isValid: any)` | 49 | ✍ Sets the validity flag. |
| `AIParameter:getCanBeChanged()` | 55 | ✍ Returns true; read-only parameters such as the vehicle override it. |
| `AIParameter:getString()` | 61 | ✍ Returns an empty string; subclasses return the text shown in the UI. |
