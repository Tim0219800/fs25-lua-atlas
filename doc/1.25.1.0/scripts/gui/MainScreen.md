# gui/MainScreen.lua

*[Version française](../../fr/scripts/gui/MainScreen.md)*

Source: `dataS/scripts/gui/MainScreen.lua` — FS25 1.25.1.0

✍ Main menu screen shown at game start (extends `ScreenElement`). Only the input handling override is described here.

- **MainScreen** inherits from `ScreenElement` (l.25)

## Functions

| Function | Line | Description |
|---|---|---|
| `MainScreen:inputEvent(action: any, value: any, eventUsed: any)` | 815 | ✍ Calls the parent input handler, then on Android turns MENU_BACK into a yes/no quit dialog (`onYesNoEnd`) and always marks the event as used. Returns the event-used flag. |
