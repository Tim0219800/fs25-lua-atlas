---@meta
-- FS25 1.25.1.0 : placeables/configurations/PlaceableConfigurationItemColor.lua (generated stub, FS25 Lua Atlas)

--- Configuration item subclass for placeable colors. It reads colors from XML (RGB values or material templates from `g_vehicleMaterialManager`), can generate the default color list plus a custom color slot, saves and syncs custom colors, and applies the color to materials by slot name and to nodes through the `colorScale0` shader parameter. Relies on `PlaceableConfigurationItemColor.DEFAULT_COLORS` and `DEFAULT_COLORS_PATCH_1_2`, which are not defined in this file (UNVERIFIED).
---@class PlaceableConfigurationItemColor : PlaceableConfigurationItem
PlaceableConfigurationItemColor = {}

--- Creates a color config item via the parent constructor, with custom-color and manual-config flags off. Note: the `customMt` argument is ignored.
---@param configName any
---@param customMt any
function PlaceableConfigurationItemColor.new(configName, customMt) end

--- Loads base data, then the color from `#color` (material template name or 3-value RGB), `#uiColor`, `#materialTemplateName` and `#colorOffset` (default 0.71). Defaults to white and flags the item as manual. Returns false if the parent load fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function PlaceableConfigurationItemColor:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Calls the parent save, then for a custom color item also writes the chosen color and material template name from the configuration data.
---@param xmlFile any
---@param key any
---@param isActive any
---@param configurationData any
function PlaceableConfigurationItemColor:saveToXMLFile(xmlFile, key, isActive, configurationData) end

--- Calls the parent load, then for a custom color item reads the saved color and material template name into the configuration data.
---@param xmlFile any
---@param key any
---@param configurationData any
function PlaceableConfigurationItemColor:loadFromSavegameXMLFile(xmlFile, key, configurationData) end

--- For custom colors, reads a compressed RGB color and a material template index from the stream and stores them in the configuration data.
---@param streamId any
---@param connection any
---@param configurationData any
function PlaceableConfigurationItemColor:readFromStream(streamId, connection, configurationData) end

--- For custom colors, writes the compressed RGB color (white if missing) and the material template index, clamped to the allowed range.
---@param streamId any
---@param connection any
---@param configurationData any
function PlaceableConfigurationItemColor:writeToStream(streamId, connection, configurationData) end

--- For custom colors, returns true if two configuration data tables differ by color (tolerance 0.00001 per channel, or one missing) or by material template name. Otherwise false.
---@param configurationData1 any
---@param configurationData2 any
function PlaceableConfigurationItemColor:hasDataChanged(configurationData1, configurationData2) end

--- Returns the effective color of this item for a placeable (a copy) and the color offset.
---@param placeable any
function PlaceableConfigurationItemColor:getColor(placeable) end

--- Returns a copy of the color, the material template name and the color offset, using the placeable's stored configuration data when present instead of the item defaults.
---@param placeable any
function PlaceableConfigurationItemColor:getColorAndMaterialFromPlaceable(placeable) end

--- Runs the parent size hook only for items with a config key, skipping dynamic color entries that have no XML definition.
---@param xmlFile any
---@param sizeData any
function PlaceableConfigurationItemColor:onSizeLoad(xmlFile, sizeData) end

--- After the parent hook, applies the color to every `.material` slot via `applyColor` on the placeable root, and sets the `colorScale0` shader parameter on every `.node` entry.
---@param placeable any
---@param configId any
function PlaceableConfigurationItemColor:onPostLoad(placeable, configId) end

--- Builds the default color items (one per `DEFAULT_COLORS` material, plus a non-selectable custom color item) when `#useDefaultColors` is set or the FS25_unlimitedColorConfigurations mod is loaded. Also makes sure a default item exists.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function PlaceableConfigurationItemColor.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

--- Maps an old numeric config id (from before patch 3) to the index and save id of the item whose save id is the matching `DEFAULT_COLORS_PATCH_1_2` material name. Returns nil, nil when no match.
---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function PlaceableConfigurationItemColor.getFallbackConfigId(configs, configId, configName, configFileName) end

--- Registers the parent paths plus defaultColorIndex, useDefaultColors, price, `.material(?)#slotName`, `.node(?)#node`, colorOffset, color, uiColor and materialTemplateName.
---@param schema any
---@param rootPath any
---@param configPath any
function PlaceableConfigurationItemColor.registerXMLPaths(schema, rootPath, configPath) end

--- Registers the parent savegame paths plus colorOffset, color (3 values) and materialTemplateName.
---@param schema any
---@param basePath any
function PlaceableConfigurationItemColor.registerSavegameXMLPaths(schema, basePath) end
