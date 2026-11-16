# gui/dialogs/TourDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/TourDialog.md)*

Source: `dataS/scripts/gui/dialogs/TourDialog.lua` — FS25 1.25.1.0

✍ Information dialog with a text and a confirm button, derived from MessageDialog, apparently used for tour messages (the name suggests it; no tour logic is in this file). Only the Android back-key handling is defined here.

- **TourDialog** inherits from `MessageDialog` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `TourDialog:inputEvent(action: any, value: any, eventUsed: any)` | 184 | ✍ Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onClickOk` and the event is always consumed so no other focused element reacts. |
