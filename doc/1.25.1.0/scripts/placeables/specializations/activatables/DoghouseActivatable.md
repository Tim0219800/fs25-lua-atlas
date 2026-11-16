# placeables/specializations/activatables/DoghouseActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/DoghouseActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/DoghouseActivatable.lua` — FS25 1.25.1.0

✍ Activatable object for a doghouse placeable: lets the player fill the dog food bowl. While active it draws the fill-bowl context hint with the dog name through the mission.

- **DoghouseActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DoghouseActivatable.new(doghousePlaceable: any)` | 15 | ✍ Creates the activatable for a doghouse placeable and sets the prompt text `action_doghouseFillbowl`. |
| `DoghouseActivatable:run()` | 26 | ✍ Tells the doghouse placeable to set its food bowl state to filled (`setFoodBowlState(true)`). |
| `DoghouseActivatable:draw()` | 32 | ✍ Per-frame draw: shows the fill-dog-bowl context hint with the dog name (empty if there is no dog). |
| `DoghouseActivatable:activate()` | 44 | ✍ Registers this object as a drawable of the mission so `draw` is called. |
| `DoghouseActivatable:deactivate()` | 50 | ✍ Removes this object from the mission drawables. |
