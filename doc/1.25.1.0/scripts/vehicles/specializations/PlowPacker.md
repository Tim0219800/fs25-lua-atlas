# vehicles/specializations/PlowPacker.lua

Source : `dataS/scripts/vehicles/specializations/PlowPacker.lua` — FS25 1.25.1.0

- **PlowPacker** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlowPacker.initSpecialization()` | 24 |  |
| `PlowPacker.prerequisitesPresent(specializations: any)` | 49 |  |
| `PlowPacker.registerFunctions(vehicleType: any)` | 57 |  |
| `PlowPacker.registerOverwrittenFunctions(vehicleType: any)` | 64 |  |
| `PlowPacker.registerEventListeners(vehicleType: any)` | 74 |  |
| `PlowPacker:onLoad(savegame: any)` | 87 |  |
| `PlowPacker:onPostLoad(savegame: any)` | 118 |  |
| `PlowPacker:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 137 |  |
| `PlowPacker:onReadStream(streamId: integer, connection: Connection)` | 152 |  |
| `PlowPacker:onWriteStream(streamId: integer, connection: Connection)` | 168 |  |
| `PlowPacker:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 180 |  |
| `PlowPacker:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 224 |  |
| `PlowPacker:setRotationMax(superFunc: any, rotationMax: any, noEventSend: any, turnAnimationTime: any)` | 234 |  |
| `PlowPacker:setPlowAIRequirements(superFunc: any, excludedGroundTypes: any)` | 252 |  |
| `PlowPacker:setFoldState(superFunc: any, direction: any, moveToMiddle: any, noEventSend: any)` | 265 |  |
| `PlowPacker:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 302 |  |
| `PlowPacker:getUseCultivatorAIRequirements(superFunc: any) → boolean` | 331 |  |
| `PlowPacker:setPackerState(newState: any, updateAnimations: any, noEventSend: any)` | 337 |  |
| `PlowPacker:getIsPackerAllowed()` | 382 |  |
| `PlowPacker:onSetLowered(lowered: any)` | 405 |  |
| `PlowPacker:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 419 |  |
| `PlowPacker.updateActionEventText(self: any)` | 436 |  |
| `PlowPacker.actionEventPackerDeactivate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 453 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setPackerState` | 58 |
| registerFunction | `getIsPackerAllowed` | 59 |
| registerOverwrittenFunction | `setRotationMax` | 65 |
| registerOverwrittenFunction | `setPlowAIRequirements` | 66 |
| registerOverwrittenFunction | `setFoldState` | 67 |
| registerOverwrittenFunction | `processCultivatorArea` | 68 |
| registerOverwrittenFunction | `getUseCultivatorAIRequirements` | 69 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onUpdate` | 79 |
| registerEventListener | `onUpdateTick` | 80 |
| registerEventListener | `onRegisterActionEvents` | 81 |
| registerEventListener | `onSetLowered` | 82 |
