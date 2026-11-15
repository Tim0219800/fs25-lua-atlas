# misc/BaleManager.lua

Source : `dataS/scripts/misc/BaleManager.lua` — FS25 1.25.1.0

- **BaleManager** hérite de `AbstractManager` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleManager.new(customMt: any) → table` | 20 |  |
| `BaleManager:initDataStructures()` | 34 |  |
| `BaleManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 43 |  |
| `BaleManager:baleLoaded(i3dNode: integer, failedReason: integer, bale: Bale)` | 90 |  |
| `BaleManager:unloadMapData()` | 111 |  |
| `BaleManager:unloadBaleData()` | 124 |  |
| `BaleManager:loadBales(xmlFile: any, baseDirectory: any)` | 139 |  |
| `BaleManager:loadBaleFromXML(xmlFile: any, key: any, baseDirectory: any)` | 149 |  |
| `BaleManager:loadModBaleFromXML(xmlFile: any, key: any, baseDirectory: any, customEnvironment: any)` | 177 |  |
| `BaleManager:loadBaleDataFromXML(bale: XMLFile, xmlFile: XMLFile, baseDirectory: any) → table` | 206 |  |
| `BaleManager:update(dt: number)` | 272 |  |
| `BaleManager:registerFermentation(bale: table, currentTime: number, maxTime: number)` | 303 |  |
| `BaleManager:getFermentationTime(bale: table) → number` | 323 |  |
| `BaleManager:removeFermentation(bale: table)` | 336 |  |
| `BaleManager:getBaleIndex(fillTypeIndex: integer, isRoundbale: boolean, width: number, height: number, length: number, diameter: number, customEnvironment: string) → integer` | 359 |  |
| `BaleManager:getBaleInfoByXMLFilename(xmlFilename: any, useVisualInfomation: any)` | 391 |  |
| `BaleManager:getIsBaleMatching(bale: any, fillTypeIndex: any, isRoundbale: any, width: any, height: any, length: any, diameter: any)` | 408 |  |
| `BaleManager:getBaleXMLFilename(fillTypeIndex: integer, isRoundbale: boolean, width: number, height: number, length: number, diameter: number, customEnvironment: any) → integer` | 447 |  |
| `BaleManager:getBaleTypeIndexByXMLFilename(xmlFilename: any)` | 458 |  |
| `BaleManager:getBaleXMLFilenameByIndex(baleIndex: any)` | 470 |  |
| `BaleManager:getIsRoundBale(baleIndex: any)` | 480 |  |
| `BaleManager:getBaleCapacityByBaleIndex(baleIndex: integer, fillTypeIndex: integer) → number` | 493 |  |
| `BaleManager:getPossibleCapacitiesForFillType(fillTypeIndex: any)` | 510 |  |
| `BaleManager:consoleCommandAddBale(fillTypeName: any, isRoundbale: any, width: any, height: any, length: any, wrapState: any, modName: any)` | 526 |  |
| `BaleManager:consoleCommandAddBaleAll(drawSizeBox: any)` | 582 |  |
| `BaleManager:consoleCommandListBales()` | 690 |  |
| `BaleManager.registerBaleXMLPaths(schema: any)` | 712 |  |
| `BaleManager.registerBaleTextureXMLPaths(schema: any, basePath: any)` | 763 |  |
| `BaleManager.registerMapBalesXMLPaths(schema: any)` | 780 |  |
