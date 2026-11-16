# triggers/ShopTrigger.lua

*[Version française](../../fr/scripts/triggers/ShopTrigger.md)*

Source: `dataS/scripts/triggers/ShopTrigger.lua` — FS25 1.25.1.0

✍ Map trigger (a shop spot) that lets the local player open the shop menu. Its first child node is the symbol and its second child is the spawn point where the player is placed when opening. Only enabled in career missions, and the symbol is shown only for farm members and when the trigger-marker setting is on. Includes ShopTriggerActivatable. Client side.

- **ShopTrigger** (l.9)
- **ShopTriggerActivatable** (l.134)

## Functions

| Function | Line | Description |
|---|---|---|
| `ShopTrigger:onCreate(id: integer)` | 14 | ✍ Map-load entry point for a shop trigger node: builds a ShopTrigger and adds it to the mission's non-updateable objects. |
| `ShopTrigger.new(node: integer) → table` | 22 | ✍ Creates the trigger: on a client checks the PLAYER collision mask bit (warning if missing) and registers the physics callback. Takes child 0 as symbol and child 1 as player spawn, subscribes to farm change and SHOW_TRIGGER_MARKER setting messages, sets icon visibility and creates the activatable. |
| `ShopTrigger:delete()` | 51 | ✍ Unsubscribes from messages, removes the physics trigger if any, clears the symbol reference and removes the activatable. |
| `ShopTrigger:openShop()` | 62 | ✍ Opens the ShopMenu screen, then teleports the local player to the spawn node and sets their yaw from its local -Z direction. If the guided tour is running it shows an info dialog and does nothing else. |
| `ShopTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 83 | ✍ On enter or leave of the local player's root node, adds or removes the activatable (career missions, enabled trigger only). On enter, if the platform auto-activates triggers and the action is available, it opens the shop directly. |
| `ShopTrigger:updateIconVisibility()` | 103 | ✍ Shows the symbol only if the trigger is enabled, the mission is a career, the local farm is not the spectator farm and the SHOW_TRIGGER_MARKER setting is on. |
| `ShopTrigger:playerFarmChanged(player: any)` | 116 | ✍ Message handler: refreshes the icon visibility when the local player's farm changed; other players are ignored. |
| `ShopTrigger:onTriggerVisibilityChanged()` | 124 | ✍ Message handler for the trigger-marker setting: refreshes the icon visibility. |
| `ShopTriggerActivatable.new(shopTrigger: any)` | 138 | ✍ Creates the activatable bound to a shop trigger, with the localized text of action_activateShop. |
| `ShopTriggerActivatable:getIsActivatable()` | 149 | ✍ Returns true when the trigger is enabled, the local player is not in a vehicle and the local farm is not the spectator farm. |
| `ShopTriggerActivatable:run()` | 155 | ✍ Runs the action by opening the shop through the owning trigger. |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.39)
- subscribes `MessageType.SETTING_CHANGED` (l.40)
