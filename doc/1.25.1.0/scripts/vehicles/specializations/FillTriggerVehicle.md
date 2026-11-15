# vehicles/specializations/FillTriggerVehicle.lua

Source: `dataS/scripts/vehicles/specializations/FillTriggerVehicle.lua` — FS25 1.25.1.0

- **FillTriggerVehicle** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FillTriggerVehicle.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `FillTriggerVehicle.initSpecialization()` | 23 |  |
| `FillTriggerVehicle.registerOverwrittenFunctions(vehicleType: any)` | 36 |  |
| `FillTriggerVehicle.registerEventListeners(vehicleType: any)` | 42 |  |
| `FillTriggerVehicle:onLoad(savegame: table)` | 52 |  |
| `FillTriggerVehicle:onDelete()` | 72 |  |
| `FillTriggerVehicle:onWriteStream(streamId: any, connection: any)` | 95 |  |
| `FillTriggerVehicle:getDrawFirstFillText(superFunc: any)` | 106 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getDrawFirstFillText` | 37 |
| registerEventListener | `onLoad` | 43 |
| registerEventListener | `onDelete` | 44 |
| registerEventListener | `onReadStream` | 45 |
| registerEventListener | `onWriteStream` | 46 |
