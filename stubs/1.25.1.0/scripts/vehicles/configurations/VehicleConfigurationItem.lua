---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItem.lua (generated stub, FS25 Lua Atlas)

--- Base class for one entry of a vehicle configuration (for example one color, motor or wheel option). It loads the shared XML attributes (name, description, price, daily upkeep, default and selectable flags, save id, brand, icon, shop offset), then forwards lifecycle calls to every module in VehicleConfigurationItem.GLOBAL_DATA (the VehicleConfigurationData* classes). Subclasses add type-specific data and savegame or network handling.
---@class VehicleConfigurationItem
VehicleConfigurationItem = {}

--- Constructor. Sets configName and defaults: empty name, index -1, price and upkeep 0, not default, selectable, no save id, not a yes/no option.
---@param configName any
---@param customMt any
function VehicleConfigurationItem.new(configName, customMt) end

--- Reads the common attributes of the configuration entry from XML (name with optional text params, desc, price, dailyUpkeep, isDefault, isSelectable, saveId, brand, vehicle name and icon, shopOffset), uses the index as name if none, then calls loadConfigItem on every GLOBAL_DATA module. Returns true.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItem:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Writes name, save id and active flag of this entry into the savegame XML at the given key. Subclasses extend it with their own data.
---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function VehicleConfigurationItem:saveToXMLFile(xmlFile, key, isActive, configurationData) end

--- Empty hook called when loading from a savegame; subclasses override it to restore their per-vehicle data.
---@param xmlFile any
---@param key any
---@param configurationData any
function VehicleConfigurationItem:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

--- Stores the index of this entry in its configuration list and, if no save id is set, uses the index as a string for the save id.
---@param index any
function VehicleConfigurationItem:setIndex(index) end

--- Returns true if this entry has the same display name as the other one, which postLoad uses to append a number.
---@param otherItem any
function VehicleConfigurationItem:getNeedsRenaming(otherItem) end

--- Forwards the pre-load stage for a vehicle object to every GLOBAL_DATA module that defines onPreLoad.
---@param object any
---@param configId any
function VehicleConfigurationItem:onPreLoad(object, configId) end

--- Forwards the load stage for a vehicle object to every GLOBAL_DATA module that defines onLoad.
---@param object any
---@param configId any
function VehicleConfigurationItem:onLoad(object, configId) end

--- Forwards the stage before post-load to every GLOBAL_DATA module that defines onPrePostLoad.
---@param object any
---@param configId any
function VehicleConfigurationItem:onPrePostLoad(object, configId) end

--- Forwards the post-load stage to every GLOBAL_DATA module that defines onPostLoad.
---@param object any
---@param configId any
function VehicleConfigurationItem:onPostLoad(object, configId) end

--- Forwards the load-finished stage to every GLOBAL_DATA module that defines onLoadFinished.
---@param object any
---@param configId any
function VehicleConfigurationItem:onLoadFinished(object, configId) end

--- Forwards the size computation to every GLOBAL_DATA module that defines onSizeLoad, so configurations can change the vehicle size data.
---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItem:onSizeLoad(xmlFile, sizeData) end

--- Static, runs after all items of a configuration are loaded. Appends a counter to duplicated names via getNeedsRenaming and logs an XML warning for duplicated save ids.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
function VehicleConfigurationItem.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem) end

--- Static. Registers the common configuration XML attributes (title, yes/no option, name, desc, price, upkeep, default, selectable, saveId, brand, vehicle name and icon, shop offsets), then lets each GLOBAL_DATA module register its own.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItem.registerXMLPaths(schema, rootPath, configPath) end

--- Static. Registers the savegame XML attributes name, id and isActive for a configuration entry.
---@param schema any
---@param basePath any
function VehicleConfigurationItem.registerSavegameXMLPaths(schema, basePath) end
