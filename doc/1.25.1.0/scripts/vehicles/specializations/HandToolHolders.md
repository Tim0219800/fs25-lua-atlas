# vehicles/specializations/HandToolHolders.lua

Source : `dataS/scripts/vehicles/specializations/HandToolHolders.lua` — FS25 1.25.1.0

- **HandToolHolders** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolHolders.registerEvents(vehicleType: any)` | 35 |  |
| `HandToolHolders.registerFunctions(vehicleType: any)` | 42 |  |
| `HandToolHolders.registerOverwrittenFunctions(vehicleType: any)` | 48 |  |
| `HandToolHolders.registerEventListeners(vehicleType: any)` | 54 |  |
| `HandToolHolders:onLoad(savegame: any)` | 65 |  |
| `HandToolHolders:onHandToolHolderFinished(handToolHolder: any, args: any)` | 103 |  |
| `HandToolHolders:onDelete()` | 134 |  |
| `HandToolHolders:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 147 |  |
| `HandToolHolders:onWriteStream(streamId: any, connection: any)` | 161 |  |
| `HandToolHolders:onReadStream(streamId: any, connection: any)` | 176 |  |
| `HandToolHolders:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 191 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onHandToolStoredInHolder` | 36 |
| registerEvent | `onHandToolTakenFromHolder` | 37 |
| registerFunction | `onHandToolHolderFinished` | 43 |
| registerOverwrittenFunction | `setOwnerFarmId` | 49 |
| registerEventListener | `onLoad` | 55 |
| registerEventListener | `onDelete` | 56 |
| registerEventListener | `saveToXMLFile` | 57 |
| registerEventListener | `onWriteStream` | 58 |
| registerEventListener | `onReadStream` | 59 |
| registerEventListener | `onRegistered` | 60 |
