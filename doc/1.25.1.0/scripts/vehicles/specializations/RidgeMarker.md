# vehicles/specializations/RidgeMarker.lua

Source : `dataS/scripts/vehicles/specializations/RidgeMarker.lua` — FS25 1.25.1.0

- **RidgeMarker** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RidgeMarker.initSpecialization()` | 21 |  |
| `RidgeMarker.registerRidgeMarkerXMLPaths(schema: any, baseKey: any)` | 47 |  |
| `RidgeMarker.registerRidgeMarkerAreaXMLPaths(schema: any, baseKey: any)` | 65 |  |
| `RidgeMarker.prerequisitesPresent(specializations: table) → boolean` | 75 |  |
| `RidgeMarker.registerFunctions(vehicleType: any)` | 81 |  |
| `RidgeMarker.registerOverwrittenFunctions(vehicleType: any)` | 90 |  |
| `RidgeMarker.registerEventListeners(vehicleType: any)` | 100 |  |
| `RidgeMarker:onLoad(savegame: table)` | 115 |  |
| `RidgeMarker:onPostLoad(savegame: any)` | 173 |  |
| `RidgeMarker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 |  |
| `RidgeMarker:onReadStream(streamId: integer, connection: Connection)` | 199 |  |
| `RidgeMarker:onWriteStream(streamId: integer, connection: Connection)` | 214 |  |
| `RidgeMarker:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 223 |  |
| `RidgeMarker:loadRidgeMarker(xmlFile: any, key: any, ridgeMarker: any)` | 229 |  |
| `RidgeMarker:setRidgeMarkerState(state: integer, noEventSend: boolean)` | 249 |  |
| `RidgeMarker:canFoldRidgeMarker(state: integer) → boolean` | 279 |  |
| `RidgeMarker:processRidgeMarkerArea(workArea: any, dt: any)` | 299 |  |
| `RidgeMarker:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 351 |  |
| `RidgeMarker:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 403 |  |
| `RidgeMarker:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 418 |  |
| `RidgeMarker:getCanBeSelected(superFunc: any)` | 428 |  |
| `RidgeMarker:getIsWorkAreaActive(superFunc: table, workArea: table) → boolean` | 436 |  |
| `RidgeMarker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 463 |  |
| `RidgeMarker:onSetLowered(lowered: boolean)` | 479 |  |
| `RidgeMarker:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 507 |  |
| `RidgeMarker:onAIImplementStart()` | 515 |  |
| `RidgeMarker.actionEventToggleRidgeMarkers(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 521 |  |
| `RidgeMarker.updateActionEvents(self: any)` | 532 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadRidgeMarker` | 82 |
| registerFunction | `setRidgeMarkerState` | 83 |
| registerFunction | `canFoldRidgeMarker` | 84 |
| registerFunction | `processRidgeMarkerArea` | 85 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 91 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 92 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 93 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 94 |
| registerOverwrittenFunction | `getCanBeSelected` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onPostLoad` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onUpdateTick` | 105 |
| registerEventListener | `onRegisterActionEvents` | 106 |
| registerEventListener | `onSetLowered` | 107 |
| registerEventListener | `onFoldStateChanged` | 108 |
| registerEventListener | `onAIImplementStart` | 109 |
