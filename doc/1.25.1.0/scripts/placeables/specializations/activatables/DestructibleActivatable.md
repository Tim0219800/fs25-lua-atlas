# placeables/specializations/activatables/DestructibleActivatable.lua

*[Version française](../../../../fr/scripts/placeables/specializations/activatables/DestructibleActivatable.md)*

Source: `dataS/scripts/placeables/specializations/activatables/DestructibleActivatable.lua` — FS25 1.25.1.0

✍ Activatable object that lets a player start repairing a destructible placeable. Availability depends on the placeable, and running it sends a PlaceableDestructibleRepairEvent to the server, except during a guided tour where an info dialog is shown instead.

- **DestructibleActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DestructibleActivatable.new(placeable: any)` | 15 | ✍ Creates the activatable for a placeable and sets the prompt text `action_destructibleStartRepairing`. |
| `DestructibleActivatable:getIsActivatable()` | 26 | ✍ Returns the result of the placeable `getCanRepairDestructible` for the local farm id. |
| `DestructibleActivatable:run()` | 32 | ✍ Shows an info dialog and stops if a guided tour is running; otherwise sends a PlaceableDestructibleRepairEvent to the server connection. |
