# vehicles/LicensePlateManager.lua

Source: `dataS/scripts/vehicles/LicensePlateManager.lua` — FS25 1.25.1.0

- **LicensePlateManager** inherits from `AbstractManager` (l.44)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `LicensePlateManager.new(customMt: table?) → table` | 54 |  |
| `LicensePlateManager:initDataStructures()` | 60 |  |
| `LicensePlateManager:loadMapData(xmlFile: integer, missionInfo: table, baseDirectory: string) → boolean` | 73 |  |
| `LicensePlateManager:unloadMapData()` | 97 |  |
| `LicensePlateManager:loadLicensePlatesFromXML(xmlFile: table, baseDirectory: string)` | 121 |  |
| `LicensePlateManager:licensePlateI3DFileLoaded(i3dNode: integer, failedReason: integer, args: table?)` | 204 |  |
| `LicensePlateManager:getAreLicensePlatesAvailable() → boolean` | 237 |  |
| `LicensePlateManager:getLicensePlate(preferedType: integer, includeFrame: boolean?) → table` | 246 |  |
| `LicensePlateManager:getLicensePlateValues(licensePlate: table, variationIndex: integer) → table` | 266 |  |
| `LicensePlateManager:getRandomLicensePlateData() → table` | 278 |  |
| `LicensePlateManager:getAvailableColors() → table, integer` | 295 |  |
| `LicensePlateManager:getDefaultPlacementIndex() → integer` | 302 |  |
| `LicensePlateManager:getFont() → table` | 309 |  |
| `LicensePlateManager.readLicensePlateData(streamId: integer, connection: integer) → table` | 318 |  |
| `LicensePlateManager.writeLicensePlateData(streamId: integer, connection: integer, licensePlateData: table)` | 346 |  |
| `LicensePlateManager.loadLicensePlateDataFromXML(xmlFile: XMLFile, key: string, useAbsolutePaths: boolean) → table` | 368 |  |
| `LicensePlateManager.saveLicensePlateDataToXML(xmlFile: XMLFile, key: string, licensePlateData: table, useAbsolutePaths: boolean)` | 402 |  |
| `LicensePlateManager.createLicensePlateXMLSchema()` | 516 |  |
