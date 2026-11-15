# handTools/specializations/HandToolBob.lua

Source : `dataS/scripts/handTools/specializations/HandToolBob.lua` — FS25 1.25.1.0

- **HandToolBob** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolBob.registerXMLPaths(xmlSchema: table)` | 46 |  |
| `HandToolBob.registerFunctions(handToolType: table)` | 62 |  |
| `HandToolBob.registerEventListeners(handToolType: table)` | 71 |  |
| `HandToolBob.prerequisitesPresent(specializations: table) → boolean` | 81 |  |
| `HandToolBob:onLoad(xmlFile: table)` | 89 |  |
| `HandToolBob:onUpdate(dt: number)` | 128 |  |
| `HandToolBob:onHeldEnd()` | 149 |  |
| `HandToolBob:getIsBobActive() → boolean` | 162 |  |
| `HandToolBob:updateBobNode(bobNode: table, dt: number, isActive: boolean, speed: number)` | 184 |  |
| `HandToolBob:resetBobNode(bobNode: table)` | 219 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getIsBobActive` | 63 |
| registerFunction | `updateBobNode` | 64 |
| registerFunction | `resetBobNode` | 65 |
| registerEventListener | `onLoad` | 72 |
| registerEventListener | `onUpdate` | 73 |
| registerEventListener | `onHeldEnd` | 74 |
