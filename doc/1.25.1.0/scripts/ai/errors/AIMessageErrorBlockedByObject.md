# ai/errors/AIMessageErrorBlockedByObject.lua

*[Version française](../../../fr/scripts/ai/errors/AIMessageErrorBlockedByObject.md)*

Source: `dataS/scripts/ai/errors/AIMessageErrorBlockedByObject.lua` — FS25 1.25.1.0

✍ AI error message for a helper blocked by an object in its way. Extends `AIMessage` but defines no `getI18NText`, and `AIMessage.lua` does not define one either. Note: calling `getMessage` on it would therefore call a nil method (apparent bug, unless it is supplied elsewhere; UNVERIFIED).

- **AIMessageErrorBlockedByObject** inherits from `AIMessage` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIMessageErrorBlockedByObject.new(customMt: any)` | 16 | ✍ Constructor of the blocked-by-object error message. Inherits from `AIMessage`, adds no state. |
