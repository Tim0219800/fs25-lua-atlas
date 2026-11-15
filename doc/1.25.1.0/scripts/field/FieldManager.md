# field/FieldManager.lua

Source : `dataS/scripts/field/FieldManager.lua` — FS25 1.25.1.0

- **FieldManager** hérite de `AbstractManager` (l.37)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FieldManager.new(customMt: table) → FieldManager` | 63 |  |
| `FieldManager:initDataStructures()` | 71 |  |
| `FieldManager:loadMapData(xmlFile: XMLFile, missionInfo: any, baseDirectory: any) → boolean` | 93 |  |
| `FieldManager:unloadMapData()` | 352 |  |
| `FieldManager:delete()` | 379 |  |
| `FieldManager:loadFromXMLFile(xmlFilename: string)` | 385 |  |
| `FieldManager:saveToXMLFile(xmlFilename: string)` | 432 |  |

## Messages

- écoute `MessageType.FINISHED_GROWTH_PERIOD` (l.321)
- écoute `MessageType.MISSION_GENERATION_START` (l.322)
- écoute `MessageType.MISSION_GENERATION_END` (l.323)
