# vehicles/specializations/MixerWagon.lua

Source : `dataS/scripts/vehicles/specializations/MixerWagon.lua` — FS25 1.25.1.0

- **MixerWagon** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MixerWagon.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `MixerWagon.initSpecialization()` | 28 |  |
| `MixerWagon.registerFunctions(vehicleType: any)` | 54 |  |
| `MixerWagon.registerOverwrittenFunctions(vehicleType: any)` | 61 |  |
| `MixerWagon.registerEventListeners(vehicleType: any)` | 73 |  |
| `MixerWagon:onLoad(savegame: table)` | 91 |  |
| `MixerWagon:onPostLoad(savegame: table)` | 191 |  |
| `MixerWagon:onDelete()` | 211 |  |
| `MixerWagon:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 239 |  |
| `MixerWagon:onReadStream(streamId: integer, connection: Connection)` | 252 |  |
| `MixerWagon:onWriteStream(streamId: integer, connection: Connection)` | 268 |  |
| `MixerWagon:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 282 |  |
| `MixerWagon:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 306 |  |
| `MixerWagon:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 |  |
| `MixerWagon:mixerWagonBaleTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 413 |  |
| `MixerWagon:onMixerWagonBaleDeleted(bale: any)` | 451 |  |
| `MixerWagon:addFillUnitFillLevel(superFunc: any, farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 461 |  |
| `MixerWagon:getFillUnitAllowsFillType(superFunc: any, fillUnitIndex: any, fillTypeIndex: any)` | 574 |  |
| `MixerWagon:getDischargeFillType(superFunc: any, dischargeNode: any)` | 589 |  |
| `MixerWagon:getIsBaleAutoLoadable(superFunc: any, bale: any)` | 614 |  |
| `MixerWagon:getDoConsumePtoPower(superFunc: any) → boolean` | 643 |  |
| `MixerWagon:getConsumingLoad(superFunc: any)` | 653 |  |
| `MixerWagon:getIsPowerTakeOffActive(superFunc: any)` | 666 |  |
| `MixerWagon:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 672 |  |
| `MixerWagon:onTurnedOn()` | 687 |  |
| `MixerWagon:onTurnedOff()` | 696 |  |
| `MixerWagon:updateDebugValues(values: any)` | 705 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `mixerWagonBaleTriggerCallback` | 55 |
| registerFunction | `onMixerWagonBaleDeleted` | 56 |
| registerOverwrittenFunction | `addFillUnitFillLevel` | 62 |
| registerOverwrittenFunction | `getFillUnitAllowsFillType` | 63 |
| registerOverwrittenFunction | `getDischargeFillType` | 64 |
| registerOverwrittenFunction | `getIsBaleAutoLoadable` | 65 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 66 |
| registerOverwrittenFunction | `getConsumingLoad` | 67 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 68 |
| registerEventListener | `onLoad` | 74 |
| registerEventListener | `onPostLoad` | 75 |
| registerEventListener | `onDelete` | 76 |
| registerEventListener | `onReadStream` | 77 |
| registerEventListener | `onWriteStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onWriteUpdateStream` | 80 |
| registerEventListener | `onUpdate` | 81 |
| registerEventListener | `onDraw` | 82 |
| registerEventListener | `onTurnedOn` | 83 |
| registerEventListener | `onTurnedOff` | 84 |
| registerEventListener | `onFillUnitFillLevelChanged` | 85 |
