# vehicles/specializations/CrabSteering.lua

Source : `dataS/scripts/vehicles/specializations/CrabSteering.lua` — FS25 1.25.1.0

- **CrabSteering** (l.10)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CrabSteering.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `CrabSteering.initSpecialization()` | 28 |  |
| `CrabSteering.registerSteeringModeXMLPaths(schema: any, basePath: any)` | 55 |  |
| `CrabSteering.registerFunctions(vehicleType: any)` | 94 |  |
| `CrabSteering.registerOverwrittenFunctions(vehicleType: any)` | 107 |  |
| `CrabSteering.registerEventListeners(vehicleType: any)` | 119 |  |
| `CrabSteering:onLoad(savegame: table)` | 136 |  |
| `CrabSteering:onPostLoad(savegame: any)` | 195 |  |
| `CrabSteering:onRegisterDashboardValueTypes()` | 220 |  |
| `CrabSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 249 |  |
| `CrabSteering:onReadStream(streamId: integer, connection: Connection)` | 261 |  |
| `CrabSteering:onWriteStream(streamId: integer, connection: Connection)` | 273 |  |
| `CrabSteering:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 283 |  |
| `CrabSteering:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 295 |  |
| `CrabSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 307 |  |
| `CrabSteering:loadCrabSteeringModeFromXML(xmlFile: any, key: any, mode: any)` | 326 |  |
| `CrabSteering:getCanToggleCrabSteering() → boolean, string` | 451 |  |
| `CrabSteering:setCrabSteering(state: integer, noEventSend: boolean)` | 480 |  |
| `CrabSteering:loadWheelFromXML(superFunc: any, wheel: any)` | 616 |  |
| `CrabSteering:updateSteeringAngle(superFunc: table, wheel: table, dt: number, steeringAngle: number) → number` | 633 |  |
| `CrabSteering:updateArticulatedAxisRotation(steeringAngle: number, dt: number) → number` | 719 |  |
| `CrabSteering:getCanBeSelected(superFunc: any)` | 838 |  |
| `CrabSteering:loadWheelsFromXML(superFunc: any, xmlFile: any, key: any, wheelConfigurationI: any)` | 844 |  |
| `CrabSteering:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 852 |  |
| `CrabSteering:startFieldWorker(superFunc: any)` | 866 |  |
| `CrabSteering:getAIAutomaticSteeringLookAheadDistance(superFunc: any)` | 875 |  |
| `CrabSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 889 |  |
| `CrabSteering.actionEventToggleCrabSteeringModes(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 916 |  |
| `CrabSteering.actionEventSetCrabSteeringMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 927 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCrabSteeringModeFromXML` | 95 |
| registerFunction | `getCanToggleCrabSteering` | 96 |
| registerFunction | `getCrabSteeringModeAvailable` | 97 |
| registerFunction | `getNumCrabSteeringModesAvailable` | 98 |
| registerFunction | `setCrabSteering` | 99 |
| registerFunction | `getCrabSteeringMode` | 100 |
| registerFunction | `setNextCrabSteeringMode` | 101 |
| registerFunction | `updateArticulatedAxisRotation` | 102 |
| registerOverwrittenFunction | `loadWheelFromXML` | 108 |
| registerOverwrittenFunction | `updateSteeringAngle` | 109 |
| registerOverwrittenFunction | `getCanBeSelected` | 110 |
| registerOverwrittenFunction | `loadWheelsFromXML` | 111 |
| registerOverwrittenFunction | `updateSteeringWheel` | 112 |
| registerOverwrittenFunction | `startFieldWorker` | 113 |
| registerOverwrittenFunction | `getAIAutomaticSteeringLookAheadDistance` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onPostLoad` | 121 |
| registerEventListener | `onDelete` | 122 |
| registerEventListener | `onRegisterDashboardValueTypes` | 123 |
| registerEventListener | `onReadStream` | 124 |
| registerEventListener | `onWriteStream` | 125 |
| registerEventListener | `onReadUpdateStream` | 126 |
| registerEventListener | `onWriteUpdateStream` | 127 |
| registerEventListener | `onUpdateTick` | 128 |
| registerEventListener | `onDraw` | 129 |
| registerEventListener | `onRegisterActionEvents` | 130 |
