# triggers/WoodUnloadTriggerActivatable.lua

*[Version française](../../fr/scripts/triggers/WoodUnloadTriggerActivatable.md)*

Source: `dataS/scripts/triggers/WoodUnloadTriggerActivatable.lua` — FS25 1.25.1.0

✍ Activatable (interaction prompt) that lets an on-foot local player sell the logs in a WoodUnloadTrigger manually. Client side; distance is measured to the trigger's activation node.

- **WoodUnloadTriggerActivatable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WoodUnloadTriggerActivatable.new(woodUnloadTrigger: any)` | 15 | ✍ Creates the activatable for a wood unload trigger, with the localized text of action_sellWood. |
| `WoodUnloadTriggerActivatable:getIsActivatable()` | 26 | ✍ Returns true when the local player is not in a vehicle and the local farm is not the spectator farm. |
| `WoodUnloadTriggerActivatable:run()` | 32 | ✍ Runs the action by calling processWood on the trigger with the local farm id. |
| `WoodUnloadTriggerActivatable:getDistance(x: any, y: any, z: any)` | 38 | ✍ Returns the distance from the given world position to the trigger's activation node, or math.huge if there is none. |
