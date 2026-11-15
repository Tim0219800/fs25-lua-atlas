# vehicles/specializations/Crawlers.lua

Source : `dataS/scripts/vehicles/specializations/Crawlers.lua` — FS25 1.25.1.0

- **Crawlers** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Crawlers.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `Crawlers.initSpecialization()` | 29 |  |
| `Crawlers.registerFunctions(vehicleType: any)` | 89 |  |
| `Crawlers.registerOverwrittenFunctions(vehicleType: any)` | 99 |  |
| `Crawlers.registerEventListeners(vehicleType: any)` | 105 |  |
| `Crawlers:onLoad(savegame: table)` | 116 |  |
| `Crawlers:onLoadFinished(savegame: table)` | 133 |  |
| `Crawlers:onDelete()` | 151 |  |
| `Crawlers:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 184 |  |
| `Crawlers:onWheelConfigurationChanged()` | 198 |  |
| `Crawlers:updateCrawler(crawler: any, dt: any)` | 210 |  |
| `Crawlers:loadCrawlerFromXML(xmlFile: XMLFile, key: any)` | 299 |  |
| `Crawlers:loadCrawlerFromConfigFile(crawler: any, xmlFilename: any, linkNode: any)` | 482 |  |
| `Crawlers:onCrawlerI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 510 |  |
| `Crawlers:getCrawlerWheelMovedDistance(crawler: table, lastName: string, useOnlyRotation: boolean) → number` | 654 |  |
| `Crawlers:validateWashableNode(superFunc: any, node: any)` | 708 |  |
| `Crawlers.getShallowWaterParameters(crawler: any)` | 807 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `updateCrawler` | 90 |
| registerFunction | `loadCrawlerFromXML` | 91 |
| registerFunction | `loadCrawlerFromConfigFile` | 92 |
| registerFunction | `onCrawlerI3DLoaded` | 93 |
| registerFunction | `getCrawlerWheelMovedDistance` | 94 |
| registerOverwrittenFunction | `validateWashableNode` | 100 |
| registerEventListener | `onLoad` | 106 |
| registerEventListener | `onLoadFinished` | 107 |
| registerEventListener | `onDelete` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onWheelConfigurationChanged` | 110 |
