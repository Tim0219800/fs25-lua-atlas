# vehicles/specializations/StumpCutterLight.lua

Source : `dataS/scripts/vehicles/specializations/StumpCutterLight.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StumpCutterLight.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `StumpCutterLight.initSpecialization()` | 25 |  |
| `StumpCutterLight.registerFunctions(vehicleType: any)` | 40 |  |
| `StumpCutterLight.registerOverwrittenFunctions(vehicleType: any)` | 47 |  |
| `StumpCutterLight.registerEventListeners(vehicleType: any)` | 56 |  |
| `StumpCutterLight:onLoad(savegame: table)` | 68 |  |
| `StumpCutterLight:onDelete()` | 104 |  |
| `StumpCutterLight:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 |  |
| `StumpCutterLight:onDeactivate()` | 158 |  |
| `StumpCutterLight:onTurnedOn()` | 166 |  |
| `StumpCutterLight:onTurnedOff()` | 175 |  |
| `StumpCutterLight:removeTreeStump(shapeId: integer)` | 183 |  |
| `StumpCutterLight:stumpCutterLightOverlapCallback(objectId: any, ...: any)` | 203 |  |
| `StumpCutterLight:getAreControlledActionsAllowed(superFunc: any)` | 218 |  |
| `StumpCutterLight:getDirtMultiplier(superFunc: any) → number` | 230 |  |
| `StumpCutterLight:getWearMultiplier(superFunc: any) → number` | 243 |  |
| `StumpCutterLight:getConsumingLoad(superFunc: any)` | 255 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `removeTreeStump` | 41 |
| registerFunction | `stumpCutterLightOverlapCallback` | 42 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getConsumingLoad` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onUpdate` | 59 |
| registerEventListener | `onDeactivate` | 60 |
| registerEventListener | `onTurnedOn` | 61 |
| registerEventListener | `onTurnedOff` | 62 |
