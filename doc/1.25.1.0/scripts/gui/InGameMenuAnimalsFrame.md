# gui/InGameMenuAnimalsFrame.lua

*[Version française](../../fr/scripts/gui/InGameMenuAnimalsFrame.md)*

Source: `dataS/scripts/gui/InGameMenuAnimalsFrame.lua` — FS25 1.25.1.0

✍ In-game menu frame, derived from TabbedMenuFrameElement, that shows information about the player's animal pens and horses. Only the delete cleanup is described here. Most of the file is outside the described entries.

- **InGameMenuAnimalsFrame** inherits from `TabbedMenuFrameElement` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `InGameMenuAnimalsFrame:delete()` | 71 | ✍ Deletes the cloned dot elements in the sub-category dot box and the dot template, then calls the parent delete. |
