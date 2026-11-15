# vehicles/specializations/HUDInfoTrigger.lua

Source : `dataS/scripts/vehicles/specializations/HUDInfoTrigger.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDInfoTrigger.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `HUDInfoTrigger.initSpecialization()` | 24 |  |
| `HUDInfoTrigger.registerFunctions(vehicleType: table)` | 36 |  |
| `HUDInfoTrigger.registerOverwrittenFunctions(vehicleType: table)` | 44 |  |
| `HUDInfoTrigger.registerEventListeners(vehicleType: table)` | 50 |  |
| `HUDInfoTrigger:onLoad(savegame: table)` | 59 |  |
| `HUDInfoTrigger:onDelete()` | 75 |  |
| `HUDInfoTrigger:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 87 |  |
| `HUDInfoTrigger.onHudInfoTriggerCallback(self: integer, triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 103 |  |
| `HUDInfoTrigger:getAllowHudInfoTrigger()` | 130 |  |
| `HUDInfoTrigger:getIsPlayerInHudInfoTrigger()` | 136 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsPlayerInHudInfoTrigger` | 37 |
| registerFunction | `getAllowHudInfoTrigger` | 38 |
| registerEventListener | `onLoad` | 51 |
| registerEventListener | `onDelete` | 52 |
| registerEventListener | `onUpdate` | 53 |
