# vehicles/specializations/CraneShovel.lua

Source : `dataS/scripts/vehicles/specializations/CraneShovel.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CraneShovel.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `CraneShovel.initSpecialization()` | 26 |  |
| `CraneShovel.registerFunctions(vehicleType: table)` | 53 |  |
| `CraneShovel.registerOverwrittenFunctions(vehicleType: table)` | 62 |  |
| `CraneShovel.registerEventListeners(vehicleType: table)` | 70 |  |
| `CraneShovel:onLoad(savegame: table)` | 82 |  |
| `CraneShovel:onPostLoad(savegame: any)` | 102 |  |
| `CraneShovel:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 116 |  |
| `CraneShovel:onReadStream(streamId: any, connection: any)` | 125 |  |
| `CraneShovel:onWriteStream(streamId: any, connection: any)` | 132 |  |
| `CraneShovel:onFoldStateChanged(direction: any, moveToMiddle: any)` | 139 |  |
| `CraneShovel:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 150 |  |
| `CraneShovel.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 164 |  |
| `CraneShovel.updateActionEvents(self: any)` | 176 |  |
| `CraneShovel:loadCraneShovelFromXML(spec: any, xmlFile: any, key: any)` | 187 |  |
| `CraneShovel:setCraneShovelState(state: any, skipAnimation: any, noEventSend: any)` | 212 |  |
| `CraneShovel:getCraneShovelStateChangedAllowed(spec: any)` | 237 |  |
| `CraneShovel:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 243 |  |
| `CraneShovel:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 256 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadCraneShovelFromXML` | 54 |
| registerFunction | `setCraneShovelState` | 55 |
| registerFunction | `getCraneShovelStateChangedAllowed` | 56 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 63 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 64 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onReadStream` | 73 |
| registerEventListener | `onWriteStream` | 74 |
| registerEventListener | `onFoldStateChanged` | 75 |
| registerEventListener | `onRegisterActionEvents` | 76 |
