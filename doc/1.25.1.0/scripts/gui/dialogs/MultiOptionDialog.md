# gui/dialogs/MultiOptionDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/MultiOptionDialog.md)*

Source: `dataS/scripts/gui/dialogs/MultiOptionDialog.lua` — FS25 1.25.1.0

✍ Dialog offering up to four choices mapped to the menu activate, accept, back and cancel actions, derived from MessageDialog. Only the Android back-key handling is defined in this file; the rest is inherited. Client-side GUI only.

- **MultiOptionDialog** inherits from `MessageDialog` (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `MultiOptionDialog:inputEvent(action: any, value: any, eventUsed: any)` | 241 | ✍ Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onNo` and the event is always consumed so no other focused element reacts. |
