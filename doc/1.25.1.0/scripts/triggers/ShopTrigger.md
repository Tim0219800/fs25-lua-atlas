# triggers/ShopTrigger.lua

Source : `dataS/scripts/triggers/ShopTrigger.lua` — FS25 1.25.1.0

- **ShopTrigger** (l.9)
- **ShopTriggerActivatable** (l.134)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ShopTrigger:onCreate(id: integer)` | 14 |  |
| `ShopTrigger.new(node: integer) → table` | 22 |  |
| `ShopTrigger:delete()` | 51 |  |
| `ShopTrigger:openShop()` | 62 |  |
| `ShopTrigger:triggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 83 |  |
| `ShopTrigger:updateIconVisibility()` | 103 |  |
| `ShopTrigger:playerFarmChanged(player: any)` | 116 |  |
| `ShopTrigger:onTriggerVisibilityChanged()` | 124 |  |
| `ShopTriggerActivatable.new(shopTrigger: any)` | 138 |  |
| `ShopTriggerActivatable:getIsActivatable()` | 149 |  |
| `ShopTriggerActivatable:run()` | 155 |  |

## Messages

- écoute `MessageType.PLAYER_FARM_CHANGED` (l.39)
- écoute `MessageType.SETTING_CHANGED` (l.40)
