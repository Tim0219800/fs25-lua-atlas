# placeables/BeehiveSystem.lua

Source : `dataS/scripts/placeables/BeehiveSystem.lua` — FS25 1.25.1.0

- **BeehiveSystem** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BeehiveSystem.new(mission: any, customMt: any)` | 18 |  |
| `BeehiveSystem:delete()` | 45 |  |
| `BeehiveSystem:addBeehive(beehiveToAdd: any)` | 51 |  |
| `BeehiveSystem:removeBeehive(beehive: any)` | 71 |  |
| `BeehiveSystem:onHourChanged()` | 83 |  |
| `BeehiveSystem:update()` | 90 |  |
| `BeehiveSystem:updateBeehivesOutput(farmId: integer?)` | 112 |  |
| `BeehiveSystem:updateState()` | 132 |  |
| `BeehiveSystem:updateBeehivesState()` | 144 |  |
| `BeehiveSystem:getFarmHasBeehive(farmId: any)` | 154 |  |
| `BeehiveSystem:getBeehives()` | 166 |  |
| `BeehiveSystem:getBeehiveInfluenceFactorAt(wx: any, wz: any)` | 173 |  |
| `BeehiveSystem:addBeehivePalletSpawner(beehivePalletSpawner: any)` | 194 |  |
| `BeehiveSystem:removeBeehivePalletSpawner(beehivePalletSpawner: any)` | 202 |  |
| `BeehiveSystem:showNoSpawnerWarning(placeable: any)` | 210 |  |
| `BeehiveSystem:getFarmBeehivePalletSpawner(farmId: any)` | 224 |  |
| `BeehiveSystem:consoleCommandBeehiveDebug()` | 235 |  |

## Messages

- écoute `MessageType.HOUR_CHANGED` (l.55)
- écoute `MessageType.DAY_NIGHT_CHANGED` (l.56)
