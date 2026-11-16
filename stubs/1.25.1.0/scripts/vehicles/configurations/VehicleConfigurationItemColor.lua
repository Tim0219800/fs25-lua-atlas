---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemColor.lua (generated stub, FS25 Lua Atlas)

--- Configuration item (subclass of VehicleConfigurationItem) for vehicle colors. It resolves colors and material templates through g_vehicleMaterialManager, builds VehicleMaterial objects, generates the default brand colors plus a custom color option when requested, applies the color to materials of the vehicle, and writes custom colors to the savegame and the network stream.
---@class VehicleConfigurationItemColor : VehicleConfigurationItem
VehicleConfigurationItemColor = {}

--- Constructor. Calls the parent constructor and sets isCustomColor and isManualConfig to false. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor.
---@param configName any
---@param customMt any
function VehicleConfigurationItemColor.new(configName, customMt) end

--- Loads the parent data, then the color (template name or an rgb triplet, warning if not 3 values), uiColor, materialTemplateName, isMetallic and isMat. Chrome and silver templates change the UI color; defaults to white and marks the item as manual config. Returns false if the parent fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemColor:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Calls the parent save; for the custom color entry also writes the chosen color and material template name from configurationData.
---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function VehicleConfigurationItemColor:saveToXMLFile(xmlFile, key, isActive, configurationData) end

--- Calls the parent method; for the custom color entry reads color and materialTemplateName back into configurationData.
---@param xmlFile any
---@param key any
---@param configurationData any
function VehicleConfigurationItemColor:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

--- Network read for the custom color entry: reads a compressed color and a material template index (resolved to a name) into configurationData. Does nothing for other entries.
---@param streamId any
---@param connection any
---@param configurationData any
function VehicleConfigurationItemColor:readFromStream(streamId, connection, configurationData) end

--- Network write counterpart: writes the compressed color (white if none) and the template index clamped to the allowed range. Only for the custom color entry.
---@param streamId any
---@param connection any
---@param configurationData any
function VehicleConfigurationItemColor:writeToStream(streamId, connection, configurationData) end

--- For the custom color entry, returns true if the colors differ by more than 0.00001 on any channel, if only one has a color, or if the template names differ. Otherwise false.
---@param configurationData1 any
---@param configurationData2 any
function VehicleConfigurationItemColor:hasDataChanged(configurationData1, configurationData2) end

--- Creates the cached VehicleMaterial of this item (recreated each call for custom colors) using the color and template resolved from the vehicle.
---@param vehicle any
function VehicleConfigurationItemColor:updateMaterial(vehicle) end

--- Returns a copy of the color as a three-value table.
function VehicleConfigurationItemColor:getColor() end

--- Refreshes the material for the given vehicle and returns the VehicleMaterial.
---@param vehicle any
function VehicleConfigurationItemColor:getMaterial(vehicle) end

--- Applies the parent size handling only when the item has an XML config key, so dynamically generated color entries are skipped.
---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItemColor:onSizeLoad(xmlFile, sizeData) end

--- Returns color and material template name, taking the vehicle's per-configuration data (custom color) over the item defaults when present.
---@param vehicle any
function VehicleConfigurationItemColor:getColorAndMaterialFromVehicle(vehicle) end

--- After the parent stage, iterates the .material entries of the configuration in the vehicle XML, builds each material (optional contrast color from brightness threshold), loads it and applies it to the vehicle slot; warns if the slot name is missing or not found.
---@param object any
---@param configId any
function VehicleConfigurationItemColor:onPostLoad(object, configId) end

--- Static. With useDefaultColors (or the FS25_unlimitedColorConfigurations mod loaded) it appends the default brand color items and a non-selectable custom color item; also picks the first item as default when none is flagged and no defaultColorIndex is given.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemColor.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

--- Static. Maps an old numeric save id (from before patch 3, color index based) to the current brand-material save id; returns index and saveId, or nil, nil if not resolvable.
---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function VehicleConfigurationItemColor.getFallbackConfigId(configs, configId, configName, configFileName) end

--- Static. Finds the vehicle's selected item for the named color configuration in the store item and returns its VehicleMaterial, or nil if it is not a color item.
---@param vehicle any
---@param configName any
function VehicleConfigurationItemColor.getMaterialByColorConfiguration(vehicle, configName) end

--- Static. Registers the color specific XML attributes (default color options, price, base template, .material entries with contrast settings, color, uiColor, isMetallic, isMat, materialTemplateName).
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemColor.registerXMLPaths(schema, rootPath, configPath) end

--- Static. Registers the parent savegame paths plus the custom color and materialTemplateName attributes.
---@param schema any
---@param basePath any
function VehicleConfigurationItemColor.registerSavegameXMLPaths(schema, basePath) end
