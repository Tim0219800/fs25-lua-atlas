# placeables/specializations/activatables/WardrobeActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/WardrobeActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/WardrobeActivatable.lua` — FS25 1.25.1.0

✍ Activatable object for a wardrobe placeable that opens the character customization screen. It is available if the wardrobe is free for all or belongs to the local farm, and is blocked during a guided tour.

- **WardrobeActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WardrobeActivatable.new(placeable: any)` | 15 | ✍ Creates the activatable for a wardrobe placeable and sets the prompt text `action_openWardrobe`. |
| `WardrobeActivatable:getIsActivatable()` | 26 | ✍ Returns true if the wardrobe is free for all or the local farm owns the placeable. |
| `WardrobeActivatable:run()` | 32 | ✍ Shows an info dialog during a guided tour; otherwise switches the GUI to the WardrobeScreen. |
