# vehicles/specializations/SmartAttach.lua

Source : `dataS/scripts/vehicles/specializations/SmartAttach.lua` — FS25 1.25.1.0

- **SmartAttachActivatable** (l.225)
- **SmartAttachEvent** hérite de `Event` (l.257)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SmartAttach.prerequisitesPresent(specializations: any)` | 17 |  |
| `SmartAttach.initSpecialization()` | 23 |  |
| `SmartAttach.registerFunctions(vehicleType: any)` | 35 |  |
| `SmartAttach.registerEventListeners(vehicleType: any)` | 43 |  |
| `SmartAttach:onLoad(savegame: any)` | 51 |  |
| `SmartAttach:onDelete()` | 89 |  |
| `SmartAttach:doSmartAttach(targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 105 |  |
| `SmartAttach:getCanBeSmartAttached()` | 120 |  |
| `SmartAttach:onPreAttach()` | 146 |  |
| `SmartAttach:smartAttachCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 161 |  |
| `SmartAttachActivatable.new(smartAttachVehicle: table) → table` | 231 |  |
| `SmartAttachActivatable:getIsActivatable() → boolean` | 243 |  |
| `SmartAttachActivatable:run()` | 249 |  |
| `SmartAttachEvent.emptyNew()` | 263 |  |
| `SmartAttachEvent.new(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 270 |  |
| `SmartAttachEvent:readStream(streamId: any, connection: any)` | 281 |  |
| `SmartAttachEvent:writeStream(streamId: any, connection: any)` | 291 |  |
| `SmartAttachEvent:run(connection: any)` | 300 |  |
| `SmartAttachEvent.sendEvent(vehicle: any, targetVehicle: any, inputJointDescIndex: any, jointDescIndex: any, noEventSend: any)` | 310 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `smartAttachCallback` | 36 |
| registerFunction | `getCanBeSmartAttached` | 37 |
| registerFunction | `doSmartAttach` | 38 |
| registerEventListener | `onLoad` | 44 |
| registerEventListener | `onDelete` | 45 |
| registerEventListener | `onPreAttach` | 46 |
