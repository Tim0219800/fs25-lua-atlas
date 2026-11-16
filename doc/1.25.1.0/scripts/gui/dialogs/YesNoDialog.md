# gui/dialogs/YesNoDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/YesNoDialog.md)*

Source: `dataS/scripts/gui/dialogs/YesNoDialog.lua` — FS25 1.25.1.0

✍ Binary yes/no confirmation dialog, derived from MessageDialog and meant as a base for dialogs that confirm or cancel an action. This file only adds Android back-key handling; the rest is inherited. Client-side GUI only.

- **YesNoDialog** inherits from `MessageDialog` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `YesNoDialog:inputEvent(action: any, value: any, eventUsed: any)` | 209 | ✍ Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onNo` and the event is always consumed so no other focused element reacts. |
