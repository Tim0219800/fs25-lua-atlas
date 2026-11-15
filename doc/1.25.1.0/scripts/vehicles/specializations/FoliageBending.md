# vehicles/specializations/FoliageBending.lua

Source : `dataS/scripts/vehicles/specializations/FoliageBending.lua` — FS25 1.25.1.0

- **FoliageBending** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FoliageBending.prerequisitesPresent(specializations: any)` | 17 |  |
| `FoliageBending.initSpecialization()` | 23 |  |
| `FoliageBending.postInitSpecialization()` | 40 |  |
| `FoliageBending.registerFunctions(vehicleType: any)` | 65 |  |
| `FoliageBending.registerEventListeners(vehicleType: any)` | 75 |  |
| `FoliageBending:onPostLoad(savegame: any)` | 84 |  |
| `FoliageBending:onDelete()` | 146 |  |
| `FoliageBending:loadBendingNodeFromXML(xmlFile: any, key: any, bendingNode: any)` | 152 |  |
| `FoliageBending:loadBendingNodeModifierFromXML(xmlFile: any, key: any)` | 172 |  |
| `FoliageBending:activateBendingNodes()` | 205 |  |
| `FoliageBending:deactivateBendingNodes()` | 218 |  |
| `FoliageBending:getFoliageBendingNodeByIndex(index: any)` | 232 |  |
| `FoliageBending:onActivate()` | 238 |  |
| `FoliageBending:onDeactivate()` | 244 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBendingNodeFromXML` | 66 |
| registerFunction | `loadBendingNodeModifierFromXML` | 67 |
| registerFunction | `activateBendingNodes` | 68 |
| registerFunction | `deactivateBendingNodes` | 69 |
| registerFunction | `getFoliageBendingNodeByIndex` | 70 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onDelete` | 77 |
| registerEventListener | `onActivate` | 78 |
| registerEventListener | `onDeactivate` | 79 |
