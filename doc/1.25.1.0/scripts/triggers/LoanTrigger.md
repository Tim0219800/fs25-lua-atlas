# triggers/LoanTrigger.lua

*[Version française](../../fr/scripts/triggers/LoanTrigger.md)*

Source: `dataS/scripts/triggers/LoanTrigger.lua` — FS25 1.25.1.0

✍ Map trigger (usually a bank) that lets the local player open the finances screen. It is only enabled in career missions (FSCareerMissionInfo) and shows a symbol, the first child of the trigger node, only to players belonging to a farm. Includes LoanTriggerActivatable, the on-foot interaction prompt. Client-side behaviour; the finances GUI itself is not in this file.

- **LoanTrigger** (l.9)
- **LoanTriggerActivatable** (l.106)

## Functions

| Function | Line | Description |
|---|---|---|
| `LoanTrigger:onCreate(id: integer)` | 14 | ✍ Map-load entry point for a loan trigger node: builds a LoanTrigger and adds it to the mission's non-updateable objects. |
| `LoanTrigger.new(name: integer) → table` | 22 | ✍ Creates the trigger: on a client registers the physics callback, takes the first child node as the symbol, creates the activatable, subscribes to PLAYER_FARM_CHANGED and sets initial icon visibility. |
| `LoanTrigger:delete()` | 45 | ✍ Unsubscribes from messages, removes the physics trigger if any, clears the symbol reference and removes the activatable. |
| `LoanTrigger:openFinanceMenu()` | 57 | ✍ Opens the InGameMenu and publishes GUI_INGAME_OPEN_FINANCES_SCREEN so the menu switches to the finances page. |
| `LoanTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 69 | ✍ On enter or leave of the local player's root node, adds or removes the activatable. Only acts when the trigger is enabled and the mission is a career mission. |
| `LoanTrigger:updateIconVisibility()` | 85 | ✍ Shows the symbol only if the trigger is enabled, the mission is a career and the local farm is not the spectator farm; hides it otherwise. |
| `LoanTrigger:playerFarmChanged(player: any)` | 97 | ✍ Message handler: refreshes the icon visibility when the farm of the local player changed; other players are ignored. |
| `LoanTriggerActivatable.new(loanTrigger: any)` | 110 | ✍ Creates the activatable bound to a loan trigger, with the localized text of action_checkFinances. |
| `LoanTriggerActivatable:getIsActivatable()` | 121 | ✍ Returns true when the trigger is enabled, the local player is not in a vehicle and the local farm is not the spectator farm. |
| `LoanTriggerActivatable:run()` | 127 | ✍ Runs the action by opening the finances menu through the owning trigger. |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.36)
- publishes `MessageType.GUI_INGAME_OPEN_FINANCES_SCREEN` (l.59)
