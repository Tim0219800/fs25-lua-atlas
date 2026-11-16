# gui/dialogs/InfoDialog.lua

*[Version française](../../../fr/scripts/gui/dialogs/InfoDialog.md)*

Source: `dataS/scripts/gui/dialogs/InfoDialog.lua` — FS25 1.25.1.0

✍ Simple information dialog with a text and a confirm button, derived from MessageDialog. A singleton instance (`InfoDialog.INSTANCE`) is reused through the static `show` helper. Client-side GUI only.

- **InfoDialog** inherits from `MessageDialog` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `InfoDialog.show(text: string, callback: function?, target: table?, dialogType: integer?, okText: string?, buttonAction: string?, callbackArgs: any, disableOpenSound: boolean?)` | 33 | ✍ Configures the shared instance (callback, dialog type defaulting to TYPE_INFO, button text and action, message, open sound) and opens it with `g_gui:showDialog`. Does nothing if the instance does not exist. |
| `InfoDialog:inputEvent(action: any, value: any, eventUsed: any)` | 179 | ✍ Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onClickOk` and the event is always consumed so no other focused element reacts. |
