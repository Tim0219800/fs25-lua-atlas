# shop/StoreManager.lua

Source : `dataS/scripts/shop/StoreManager.lua` — FS25 1.25.1.0

- **StoreManager** hérite de `AbstractManager` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StoreManager.new(customMt: any) → table` | 26 |  |
| `StoreManager:initDataStructures()` | 38 |  |
| `StoreManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 74 |  |
| `StoreManager:unloadMapData()` | 195 |  |
| `StoreManager:loadItemsFromXML(filename: any, baseDirectory: any, customEnvironment: any)` | 207 |  |
| `StoreManager:loadCategoryFromXML(xmlFile: table, key: string, baseDir: string, customEnv: any, isMod: any)` | 314 |  |
| `StoreManager:addCategory(name: string, title: string, imageFilename: string, categoryTypeName: string, baseDir: string, insertAfter: string) → boolean` | 348 |  |
| `StoreManager:getCategoryByName(name: string) → table` | 428 |  |
| `StoreManager:addConstructionCategory(name: any, title: any, iconFilename: any, iconUVs: any, baseDir: any, iconSliceId: any)` | 441 |  |
| `StoreManager:getConstructionCategoryByName(name: any)` | 465 |  |
| `StoreManager:addConstructionTab(categoryName: any, name: any, title: any, iconFilename: any, iconUVs: any, baseDir: any, iconSliceId: any)` | 474 |  |
| `StoreManager:getConstructionTabByName(name: any, categoryName: any)` | 492 |  |
| `StoreManager:getConstructionCategories()` | 511 |  |
| `StoreManager:addSpecType(name: string, profile: string?, loadFunc: function?, getValueFunc: function, species: integer, relatedConfigurations: table?, configDataFunc: function?)` | 532 |  |
| `StoreManager:getSpecTypes() → table` | 568 |  |
| `StoreManager:getSpecTypeByName(name: string) → table` | 576 |  |
| `StoreManager:getSpecTypeByProfile(profile: string) → table` | 589 |  |
| `StoreManager:addItem(storeItem: table) → boolean` | 607 |  |
| `StoreManager:removeItemByIndex(index: integer)` | 658 |  |
| `StoreManager:getItems() → table` | 676 |  |
| `StoreManager:getItemByIndex(index: integer) → table` | 684 |  |
| `StoreManager:getItemByXMLFilename(xmlFilename: string) → table` | 695 |  |
| `StoreManager:getIsItemUnlocked(storeItem: table) → boolean` | 707 |  |
| `StoreManager:getItemsByCombinationData(combinationData: table) → table` | 719 |  |
| `StoreManager:getItemByCustomEnvironment(customEnvironment: string) → table` | 830 |  |
| `StoreManager:addModStoreItem(xmlFilename: any, baseDir: any, customEnvironment: any, isMod: any, isBundleItem: any, dlcTitle: any)` | 843 |  |
| `StoreManager:loadItem(rawXMLFilename: string, baseDir: string, customEnvironment: string, isMod: boolean, isBundleItem: boolean, dlcTitle: string?, extraContentId: any, ignoreAdd: any) → table` | 856 |  |
| `StoreManager:addPack(name: string, title: string, imageFilename: string, baseDir: string) → boolean` | 1261 |  |
| `StoreManager:addModStorePack(name: any, title: any, imageFilename: any, baseDir: any, storeItems: any)` | 1320 |  |
| `StoreManager:addPackItem(name: string, itemFilename: string)` | 1336 |  |
| `StoreManager:getPacks()` | 1355 |  |
| `StoreManager:getPackItems(name: string)` | 1362 |  |
| `StoreManager:consoleCommandReloadStoreItems()` | 1377 |  |
| `StoreManager.registerStoreDataXMLPaths(schema: XMLSchema, basePath: string)` | 1400 |  |

## Messages

- publie `MessageType.STORE_ITEMS_RELOADED` (l.1385)
