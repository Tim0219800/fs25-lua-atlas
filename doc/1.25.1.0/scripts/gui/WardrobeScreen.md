# gui/WardrobeScreen.lua

*[Version française](../../fr/scripts/gui/WardrobeScreen.md)*

Source: `dataS/scripts/gui/WardrobeScreen.lua` — FS25 1.25.1.0

✍ Wardrobe (character customisation) screen, built on `TabbedMenuWithDetails`. Only the cleanup of its non-GUI input action event is described here.

- **WardrobeScreen** inherits from `TabbedMenuWithDetails` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WardrobeScreen:removeActionEvents()` | 702 | ✍ Unregisters the left/right controller action event (`eventIdLeftRightController`) from `g_inputBinding` and clears the stored id. |
