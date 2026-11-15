# vehicles/specializations/BaleCounter.lua

Source: `dataS/scripts/vehicles/specializations/BaleCounter.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BaleCounter.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `BaleCounter.initSpecialization()` | 29 |  |
| `BaleCounter.registerFunctions(vehicleType: any)` | 44 |  |
| `BaleCounter.registerOverwrittenFunctions(vehicleType: any)` | 50 |  |
| `BaleCounter.registerEventListeners(vehicleType: any)` | 56 |  |
| `BaleCounter:onLoad(savegame: any)` | 69 |  |
| `BaleCounter:onRegisterDashboardValueTypes()` | 100 |  |
| `BaleCounter:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 |  |
| `BaleCounter:onReadStream(streamId: integer, connection: Connection)` | 126 |  |
| `BaleCounter:onWriteStream(streamId: integer, connection: Connection)` | 136 |  |
| `BaleCounter:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 144 |  |
| `BaleCounter:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 158 |  |
| `BaleCounter.actionEventResetCounter(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 166 |  |
| `BaleCounter.externalActionEventRegister(data: any, vehicle: any)` | 172 |  |
| `BaleCounter.externalActionEventUpdate(data: any, vehicle: any)` | 184 |  |
| `BaleCounter:doBaleCounterReset(noEventSend: any)` | 189 |  |
| `BaleCounter:dropBale(superFunc: any, baleIndex: any)` | 199 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `doBaleCounterReset` | 45 |
| registerOverwrittenFunction | `dropBale` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onDraw` | 59 |
| registerEventListener | `onRegisterDashboardValueTypes` | 60 |
| registerEventListener | `onReadStream` | 61 |
| registerEventListener | `onWriteStream` | 62 |
| registerEventListener | `onRegisterActionEvents` | 63 |
| registerEventListener | `onRegisterExternalActionEvents` | 64 |
