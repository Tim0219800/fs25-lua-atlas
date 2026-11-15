# triggers/LoanTrigger.lua

Source : `dataS/scripts/triggers/LoanTrigger.lua` — FS25 1.25.1.0

- **LoanTrigger** (l.9)
- **LoanTriggerActivatable** (l.106)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LoanTrigger:onCreate(id: integer)` | 14 |  |
| `LoanTrigger.new(name: integer) → table` | 22 |  |
| `LoanTrigger:delete()` | 45 |  |
| `LoanTrigger:openFinanceMenu()` | 57 |  |
| `LoanTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 69 |  |
| `LoanTrigger:updateIconVisibility()` | 85 |  |
| `LoanTrigger:playerFarmChanged(player: any)` | 97 |  |
| `LoanTriggerActivatable.new(loanTrigger: any)` | 110 |  |
| `LoanTriggerActivatable:getIsActivatable()` | 121 |  |
| `LoanTriggerActivatable:run()` | 127 |  |

## Messages

- écoute `MessageType.PLAYER_FARM_CHANGED` (l.36)
- publie `MessageType.GUI_INGAME_OPEN_FINANCES_SCREEN` (l.59)
