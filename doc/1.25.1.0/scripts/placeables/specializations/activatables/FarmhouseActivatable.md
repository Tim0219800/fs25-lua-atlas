# placeables/specializations/activatables/FarmhouseActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/FarmhouseActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/FarmhouseActivatable.lua` — FS25 1.25.1.0

✍ Activatable object on a farmhouse placeable that lets the player go to sleep. It is available when the placeable allows the local farm to sleep and nobody is already sleeping, and it opens the sleep dialog of the sleep manager.

- **FarmhouseActivatable** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmhouseActivatable.new(placeable: any)` | 16 | ✍ Creates the activatable for a placeable and sets the prompt text `ui_inGameSleep`. |
| `FarmhouseActivatable:getIsActivatable()` | 27 | ✍ Returns true if the placeable allows the local farm to sleep and the sleep manager is not already sleeping. |
| `FarmhouseActivatable:run()` | 33 | ✍ Opens the sleep dialog through `g_sleepManager:showDialog()`. |
