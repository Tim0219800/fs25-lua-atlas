# handTools/specializations/HandToolTethered.lua

Source : `dataS/scripts/handTools/specializations/HandToolTethered.lua` — FS25 1.25.1.0

- **HandToolTethered** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolTethered.registerXMLPaths(xmlSchema: any)` | 15 |  |
| `HandToolTethered.registerFunctions(handToolType: any)` | 24 |  |
| `HandToolTethered.registerOverwrittenFunctions(vehicleType: any)` | 32 |  |
| `HandToolTethered.registerEventListeners(handToolType: any)` | 38 |  |
| `HandToolTethered.prerequisitesPresent(specializations: any)` | 48 |  |
| `HandToolTethered:onLoad(xmlFile: any, baseDirectory: any)` | 54 |  |
| `HandToolTethered:onDelete()` | 85 |  |
| `HandToolTethered:onPreUpdate(dt: any)` | 94 |  |
| `HandToolTethered:setAttachedHolder(holder: any)` | 126 |  |
| `HandToolTethered:onCarryingPlayerLeftGame()` | 138 |  |
| `HandToolTethered:onCarryingPlayerEnteredVehicle()` | 144 |  |
| `HandToolTethered:setHolder(superFunc: any, holder: any, noEventSend: any)` | 150 |  |
| `HandToolTethered:returnToHolder(noEventSend: any)` | 165 |  |
| `HandToolTethered:showRangeWarning(holderPlayerDistance: any)` | 176 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `showRangeWarning` | 25 |
| registerFunction | `returnToHolder` | 26 |
| registerFunction | `setAttachedHolder` | 27 |
| registerOverwrittenFunction | `setHolder` | 33 |
| registerEventListener | `onLoad` | 39 |
| registerEventListener | `onDelete` | 40 |
| registerEventListener | `onCarryingPlayerEnteredVehicle` | 41 |
| registerEventListener | `onCarryingPlayerLeftGame` | 42 |
| registerEventListener | `onPreUpdate` | 43 |
