# vehicles/specializations/LicensePlates.lua

Source : `dataS/scripts/vehicles/specializations/LicensePlates.lua` — FS25 1.25.1.0

- **LicensePlates** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LicensePlates.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `LicensePlates.initSpecialization()` | 23 |  |
| `LicensePlates.registerFunctions(vehicleType: any)` | 49 |  |
| `LicensePlates.registerEventListeners(vehicleType: any)` | 59 |  |
| `LicensePlates:onLoad(savegame: table)` | 70 |  |
| `LicensePlates:onPostLoad(savegame: any)` | 176 |  |
| `LicensePlates:onDelete(savegame: any)` | 205 |  |
| `LicensePlates:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 213 |  |
| `LicensePlates:onReadStream(streamId: integer, connection: Connection)` | 234 |  |
| `LicensePlates:onWriteStream(streamId: integer, connection: Connection)` | 244 |  |
| `LicensePlates:setLicensePlatesData(licensePlateData: any)` | 251 |  |
| `LicensePlates:getLicensePlatesData()` | 288 |  |
| `LicensePlates:getLicensePlatesDataIsEqual(data: any)` | 294 |  |
| `LicensePlates:getHasLicensePlates() → boolean` | 323 |  |
| `LicensePlates:getLicensePlateDialogSettings() → string, boolean` | 331 |  |
| `LicensePlates.loadSpecValuePlateText(xmlFile: any, customEnvironment: any, baseDir: any)` | 347 |  |
| `LicensePlates.getSpecValuePlateText(storeItem: any, realItem: any)` | 354 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `setLicensePlatesData` | 50 |
| registerFunction | `getLicensePlatesData` | 51 |
| registerFunction | `getLicensePlatesDataIsEqual` | 52 |
| registerFunction | `getHasLicensePlates` | 53 |
| registerFunction | `getLicensePlateDialogSettings` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
