---@meta
-- FS25 1.25.1.0 : shop/StoreManager.lua (generated stub, FS25 Lua Atlas)

--- Global manager (g_storeManager, subclass of AbstractManager) that owns the shop data: store categories and category types, store packs, construction categories and tabs, spec types shown in item details, and every store item loaded from base game, map, DLC and mod XML files. It parses the `storeData` block of vehicle, placeable and hand tool XMLs (price, upkeep, categories, bundles, brush, VRAM usage), keeps a text index for shop search, and registers the `gsStoreItemsReload` console command. Item loading is queued through the async task manager.
---@class StoreManager : AbstractManager
StoreManager = {}

--- Creates the manager with an empty species-to-schema map and a search index weighting title 10, brand 5, author 3 and DLC title 3.
---@param customMt any
---@return table
function StoreManager.new(customMt) end

--- Resets all tables (categories, types, packs, items, filename lookup, mod-registered lists, spec types, construction categories) and clears the search index if present.
function StoreManager:initDataStructures() end

--- Loads `dataS/storeCategories.xml` and `storePacks.xml` (skipping packs whose required DLC is not loaded), then mod categories and packs. On platforms with construction it loads the construction categories and tabs. It then queues the default, map and mod store items, builds the search index and registers `gsStoreItemsReload`. Returns true.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function StoreManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Calls the parent unload and removes the `gsStoreItemsReload` console command.
function StoreManager:unloadMapData() end

--- Opens a store items list XML and queues one async subtask per `storeItems.storeItem`, working out the mod name, DLC title and whether the item comes from a non-DLC mod before calling loadItem. Does nothing if the file cannot be loaded.
---@param filename any
---@param baseDirectory any
---@param customEnvironment any
function StoreManager:loadItemsFromXML(filename, baseDirectory, customEnvironment) end

--- Reads a category's name, title (translated), image, type and `insertAfter`. For mods it only stores the data for later; otherwise it calls addCategory immediately.
---@param xmlFile table
---@param key string
---@param baseDir string
---@param customEnv any
---@param isMod any
function StoreManager:loadCategoryFromXML(xmlFile, key, baseDir, customEnv, isMod) end

--- Registers a store category after validating name, title, image, base directory and an existing category type; rejects duplicates and, on Switch, the COINS category. Names are stored uppercase; `insertAfter` places it after another category and renumbers orderId. Returns true on success, false otherwise.
---@param name string
---@param title string
---@param imageFilename string
---@param categoryTypeName string
---@param baseDir string
---@param insertAfter string
---@return boolean
function StoreManager:addCategory(name, title, imageFilename, categoryTypeName, baseDir, insertAfter) end

--- Returns the category table for a name (case-insensitive), or nil.
---@param name string
---@return table
function StoreManager:getCategoryByName(name) end

--- Adds a construction category with title, icon, UVs and an empty tab list. Name is uppercased; an existing name only logs a warning and returns nothing.
---@param name any
---@param title any
---@param iconFilename any
---@param iconUVs any
---@param baseDir any
---@param iconSliceId any
function StoreManager:addConstructionCategory(name, title, iconFilename, iconUVs, baseDir, iconSliceId) end

--- Returns the construction category for a name (case-insensitive), or nil.
---@param name any
function StoreManager:getConstructionCategoryByName(name) end

--- Appends a tab (uppercased name, title, icon, UVs, index) to the named construction category. Silently does nothing if the category does not exist.
---@param categoryName any
---@param name any
---@param title any
---@param iconFilename any
---@param iconUVs any
---@param baseDir any
---@param iconSliceId any
function StoreManager:addConstructionTab(categoryName, name, title, iconFilename, iconUVs, baseDir, iconSliceId) end

--- Finds a tab by name inside a construction category; returns nil if the category or tab is missing.
---@param name any
---@param categoryName any
function StoreManager:getConstructionTabByName(name, categoryName) end

--- Returns the ordered list of construction categories.
function StoreManager:getConstructionCategories() end

--- Registers a spec type (name, profile, load and value functions, species defaulting to vehicle, related configurations, optional config data function). Logs an error and returns if the name is invalid or already used.
---@param name string
---@param profile string?
---@param loadFunc function?
---@param getValueFunc function
---@param species integer
---@param relatedConfigurations table?
---@param configDataFunc function?
function StoreManager:addSpecType(name, profile, loadFunc, getValueFunc, species, relatedConfigurations, configDataFunc) end

--- Returns the ordered list of registered spec types.
---@return table
function StoreManager:getSpecTypes() end

--- Returns the spec type with the given name; warns and returns nil for an invalid name.
---@param name string
---@return table
function StoreManager:getSpecTypeByName(name) end

--- Returns the first spec type whose profile matches, or nil.
---@param profile string
---@return table
function StoreManager:getSpecTypeByProfile(profile) end

--- Adds a loaded store item, assigns its id as list index and indexes it by lower-case XML filename. Returns false if the file is already known (copying over isBundleItem/showInStore if it had first been added as a bundle item). Visible, unlocked vehicle and hand tool items are added to the search index with title, brand and mod author.
---@param storeItem table
---@return boolean
function StoreManager:addItem(storeItem) end

--- Removes an item by index by moving the last item into its slot (so ids stay equal to indexes) and dropping the last entry. Note: the search index is not updated here.
---@param index integer
function StoreManager:removeItemByIndex(index) end

--- Returns the list of all store items.
---@return table
function StoreManager:getItems() end

--- Returns the item at the index, or nil.
---@param index integer
---@return table
function StoreManager:getItemByIndex(index) end

--- Returns the item for an XML filename (lookup is case-insensitive), or nil.
---@param xmlFilename string
---@return table
function StoreManager:getItemByXMLFilename(xmlFilename) end

--- True if the item exists and has no extra content id, or the extra content system reports it unlocked.
---@param storeItem table
---@return boolean
function StoreManager:getIsItemUnlocked(storeItem) end

--- Resolves a combination definition to a list of `{storeItem, configData}` entries: either a direct XML filename, or all unlocked items filtered by category and optionally by a spec range (weight in kg is converted to tons), also trying configuration variants. Note: the direct case reads `customXMLFilename` without a nil check, and a nil spec value in the related-configuration branch would error.
---@param combinationData table
---@return table
function StoreManager:getItemsByCombinationData(combinationData) end

--- Returns a new list of all items whose customEnvironment (mod name) matches. Despite the singular name, it returns several items.
---@param customEnvironment string
---@return table
function StoreManager:getItemByCustomEnvironment(customEnvironment) end

--- Queues a mod store item (filename, base dir, environment, mod/bundle flags, DLC title) to be loaded during loadMapData. No extra content id can be passed.
---@param xmlFilename any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param isBundleItem any
---@param dlcTitle any
function StoreManager:addModStoreItem(xmlFilename, baseDir, customEnvironment, isMod, isBundleItem, dlcTitle) end

--- Parses one store item XML into a store item table: validates species schema, name and image (invalid items return nil), reads storeData fields, categories (fallback MISC), configurations, price, upkeep, lifetime, VRAM usage, store packs and, for bundles, sums prices and merges configurations of the bundle elements. It also assigns a construction brush when supported, then adds the item (and new bundle items) unless `ignoreAdd` is set. Returns the item.
---@param rawXMLFilename string
---@param baseDir string
---@param customEnvironment string
---@param isMod boolean
---@param isBundleItem boolean
---@param dlcTitle string?
---@param extraContentId any
---@param ignoreAdd any
---@return table
function StoreManager:loadItem(rawXMLFilename, baseDir, customEnvironment, isMod, isBundleItem, dlcTitle, extraContentId, ignoreAdd) end

--- Registers a store pack (name uppercased, title, image, base dir) with an empty item list and the next order id. Returns false with a warning on invalid or missing arguments or if the pack already exists.
---@param name string
---@param title string
---@param imageFilename string
---@param baseDir string
---@return boolean
function StoreManager:addPack(name, title, imageFilename, baseDir) end

--- Queues a mod store pack and its item filenames to be registered during loadMapData.
---@param name any
---@param title any
---@param imageFilename any
---@param baseDir any
---@param storeItems any
function StoreManager:addModStorePack(name, title, imageFilename, baseDir, storeItems) end

--- Appends an item XML filename to a pack. Warns and ignores the call if the name, the pack or the filename is missing. The pack name is not uppercased here, unlike in addPack.
---@param name string
---@param itemFilename string
function StoreManager:addPackItem(name, itemFilename) end

--- Returns the table of packs keyed by uppercase name.
function StoreManager:getPacks() end

--- Returns the item filenames of a pack, or nil if the pack does not exist.
---@param name string
function StoreManager:getPackItems(name) end

--- Console command `gsStoreItemsReload`: reloads every item from its XML (without re-adding), refreshes the filename lookup and publishes STORE_ITEMS_RELOADED. Note: a failed reload leaves a nil hole in the items list, and the search index is not rebuilt.
function StoreManager:consoleCommandReloadStoreItems() end

--- Registers the whole `storeData` XML schema under the base path: name, species, image, brand, flags, categories, packs, price, upkeep, leasing, lifetime, shop offsets, memory usage fields, bundle elements, attacher info, functions, brush and the icon-rendering settings (marked in the source as unused by the game).
---@param schema XMLSchema
---@param basePath string
function StoreManager.registerStoreDataXMLPaths(schema, basePath) end
