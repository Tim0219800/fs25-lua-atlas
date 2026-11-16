# shop/StoreManager.lua

*[Version française](../../fr/scripts/shop/StoreManager.md)*

Source: `dataS/scripts/shop/StoreManager.lua` — FS25 1.25.1.0

✍ Global manager (g_storeManager, subclass of AbstractManager) that owns the shop data: store categories and category types, store packs, construction categories and tabs, spec types shown in item details, and every store item loaded from base game, map, DLC and mod XML files. It parses the `storeData` block of vehicle, placeable and hand tool XMLs (price, upkeep, categories, bundles, brush, VRAM usage), keeps a text index for shop search, and registers the `gsStoreItemsReload` console command. Item loading is queued through the async task manager.

- **StoreManager** inherits from `AbstractManager` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `StoreManager.new(customMt: any) → table` | 26 | ✍ Creates the manager with an empty species-to-schema map and a search index weighting title 10, brand 5, author 3 and DLC title 3. |
| `StoreManager:initDataStructures()` | 38 | ✍ Resets all tables (categories, types, packs, items, filename lookup, mod-registered lists, spec types, construction categories) and clears the search index if present. |
| `StoreManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 74 | ✍ Loads `dataS/storeCategories.xml` and `storePacks.xml` (skipping packs whose required DLC is not loaded), then mod categories and packs. On platforms with construction it loads the construction categories and tabs. It then queues the default, map and mod store items, builds the search index and registers `gsStoreItemsReload`. Returns true. |
| `StoreManager:unloadMapData()` | 195 | ✍ Calls the parent unload and removes the `gsStoreItemsReload` console command. |
| `StoreManager:loadItemsFromXML(filename: any, baseDirectory: any, customEnvironment: any)` | 207 | ✍ Opens a store items list XML and queues one async subtask per `storeItems.storeItem`, working out the mod name, DLC title and whether the item comes from a non-DLC mod before calling loadItem. Does nothing if the file cannot be loaded. |
| `StoreManager:loadCategoryFromXML(xmlFile: table, key: string, baseDir: string, customEnv: any, isMod: any)` | 314 | ✍ Reads a category's name, title (translated), image, type and `insertAfter`. For mods it only stores the data for later; otherwise it calls addCategory immediately. |
| `StoreManager:addCategory(name: string, title: string, imageFilename: string, categoryTypeName: string, baseDir: string, insertAfter: string) → boolean` | 348 | ✍ Registers a store category after validating name, title, image, base directory and an existing category type; rejects duplicates and, on Switch, the COINS category. Names are stored uppercase; `insertAfter` places it after another category and renumbers orderId. Returns true on success, false otherwise. |
| `StoreManager:getCategoryByName(name: string) → table` | 428 | ✍ Returns the category table for a name (case-insensitive), or nil. |
| `StoreManager:addConstructionCategory(name: any, title: any, iconFilename: any, iconUVs: any, baseDir: any, iconSliceId: any)` | 441 | ✍ Adds a construction category with title, icon, UVs and an empty tab list. Name is uppercased; an existing name only logs a warning and returns nothing. |
| `StoreManager:getConstructionCategoryByName(name: any)` | 465 | ✍ Returns the construction category for a name (case-insensitive), or nil. |
| `StoreManager:addConstructionTab(categoryName: any, name: any, title: any, iconFilename: any, iconUVs: any, baseDir: any, iconSliceId: any)` | 474 | ✍ Appends a tab (uppercased name, title, icon, UVs, index) to the named construction category. Silently does nothing if the category does not exist. |
| `StoreManager:getConstructionTabByName(name: any, categoryName: any)` | 492 | ✍ Finds a tab by name inside a construction category; returns nil if the category or tab is missing. |
| `StoreManager:getConstructionCategories()` | 511 | ✍ Returns the ordered list of construction categories. |
| `StoreManager:addSpecType(name: string, profile: string?, loadFunc: function?, getValueFunc: function, species: integer, relatedConfigurations: table?, configDataFunc: function?)` | 532 | ✍ Registers a spec type (name, profile, load and value functions, species defaulting to vehicle, related configurations, optional config data function). Logs an error and returns if the name is invalid or already used. |
| `StoreManager:getSpecTypes() → table` | 568 | ✍ Returns the ordered list of registered spec types. |
| `StoreManager:getSpecTypeByName(name: string) → table` | 576 | ✍ Returns the spec type with the given name; warns and returns nil for an invalid name. |
| `StoreManager:getSpecTypeByProfile(profile: string) → table` | 589 | ✍ Returns the first spec type whose profile matches, or nil. |
| `StoreManager:addItem(storeItem: table) → boolean` | 607 | ✍ Adds a loaded store item, assigns its id as list index and indexes it by lower-case XML filename. Returns false if the file is already known (copying over isBundleItem/showInStore if it had first been added as a bundle item). Visible, unlocked vehicle and hand tool items are added to the search index with title, brand and mod author. |
| `StoreManager:removeItemByIndex(index: integer)` | 658 | ✍ Removes an item by index by moving the last item into its slot (so ids stay equal to indexes) and dropping the last entry. Note: the search index is not updated here. |
| `StoreManager:getItems() → table` | 676 | ✍ Returns the list of all store items. |
| `StoreManager:getItemByIndex(index: integer) → table` | 684 | ✍ Returns the item at the index, or nil. |
| `StoreManager:getItemByXMLFilename(xmlFilename: string) → table` | 695 | ✍ Returns the item for an XML filename (lookup is case-insensitive), or nil. |
| `StoreManager:getIsItemUnlocked(storeItem: table) → boolean` | 707 | ✍ True if the item exists and has no extra content id, or the extra content system reports it unlocked. |
| `StoreManager:getItemsByCombinationData(combinationData: table) → table` | 719 | ✍ Resolves a combination definition to a list of `{storeItem, configData}` entries: either a direct XML filename, or all unlocked items filtered by category and optionally by a spec range (weight in kg is converted to tons), also trying configuration variants. Note: the direct case reads `customXMLFilename` without a nil check, and a nil spec value in the related-configuration branch would error. |
| `StoreManager:getItemByCustomEnvironment(customEnvironment: string) → table` | 830 | ✍ Returns a new list of all items whose customEnvironment (mod name) matches. Despite the singular name, it returns several items. |
| `StoreManager:addModStoreItem(xmlFilename: any, baseDir: any, customEnvironment: any, isMod: any, isBundleItem: any, dlcTitle: any)` | 843 | ✍ Queues a mod store item (filename, base dir, environment, mod/bundle flags, DLC title) to be loaded during loadMapData. No extra content id can be passed. |
| `StoreManager:loadItem(rawXMLFilename: string, baseDir: string, customEnvironment: string, isMod: boolean, isBundleItem: boolean, dlcTitle: string?, extraContentId: any, ignoreAdd: any) → table` | 856 | ✍ Parses one store item XML into a store item table: validates species schema, name and image (invalid items return nil), reads storeData fields, categories (fallback MISC), configurations, price, upkeep, lifetime, VRAM usage, store packs and, for bundles, sums prices and merges configurations of the bundle elements. It also assigns a construction brush when supported, then adds the item (and new bundle items) unless `ignoreAdd` is set. Returns the item. |
| `StoreManager:addPack(name: string, title: string, imageFilename: string, baseDir: string) → boolean` | 1261 | ✍ Registers a store pack (name uppercased, title, image, base dir) with an empty item list and the next order id. Returns false with a warning on invalid or missing arguments or if the pack already exists. |
| `StoreManager:addModStorePack(name: any, title: any, imageFilename: any, baseDir: any, storeItems: any)` | 1320 | ✍ Queues a mod store pack and its item filenames to be registered during loadMapData. |
| `StoreManager:addPackItem(name: string, itemFilename: string)` | 1336 | ✍ Appends an item XML filename to a pack. Warns and ignores the call if the name, the pack or the filename is missing. The pack name is not uppercased here, unlike in addPack. |
| `StoreManager:getPacks()` | 1355 | ✍ Returns the table of packs keyed by uppercase name. |
| `StoreManager:getPackItems(name: string)` | 1362 | ✍ Returns the item filenames of a pack, or nil if the pack does not exist. |
| `StoreManager:consoleCommandReloadStoreItems()` | 1377 | ✍ Console command `gsStoreItemsReload`: reloads every item from its XML (without re-adding), refreshes the filename lookup and publishes STORE_ITEMS_RELOADED. Note: a failed reload leaves a nil hole in the items list, and the search index is not rebuilt. |
| `StoreManager.registerStoreDataXMLPaths(schema: XMLSchema, basePath: string)` | 1400 | ✍ Registers the whole `storeData` XML schema under the base path: name, species, image, brand, flags, categories, packs, price, upkeep, leasing, lifetime, shop offsets, memory usage fields, bundle elements, attacher info, functions, brush and the icon-rendering settings (marked in the source as unused by the game). |

## Messages

- publishes `MessageType.STORE_ITEMS_RELOADED` (l.1385)
