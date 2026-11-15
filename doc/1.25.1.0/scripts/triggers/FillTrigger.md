# triggers/FillTrigger.lua

Source : `dataS/scripts/triggers/FillTrigger.lua` — FS25 1.25.1.0

- **FillTrigger** (l.8)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillTrigger:onCreate(id: integer)` | 13 |  |
| `FillTrigger.new(id: integer, sourceObject: table, fillUnitIndex: integer, fillLitersPerSecond: table?, defaultFillType: any, customMt: table?) → table` | 28 |  |
| `FillTrigger:delete()` | 67 |  |
| `FillTrigger:onVehicleDeleted(vehicle: table)` | 85 |  |
| `FillTrigger:fillVehicle(vehicle: table, delta: number, dt: any) → number` | 98 |  |
| `FillTrigger:getIsActivatable(vehicle: table) → boolean` | 156 |  |
| `FillTrigger:fillTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 173 |  |
