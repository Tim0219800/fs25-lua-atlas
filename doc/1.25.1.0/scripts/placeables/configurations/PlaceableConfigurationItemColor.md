# placeables/configurations/PlaceableConfigurationItemColor.lua

*[Version française](../../../fr/scripts/placeables/configurations/PlaceableConfigurationItemColor.md)*

Source: `dataS/scripts/placeables/configurations/PlaceableConfigurationItemColor.lua` — FS25 1.25.1.0

✍ Configuration item subclass for placeable colors. It reads colors from XML (RGB values or material templates from `g_vehicleMaterialManager`), can generate the default color list plus a custom color slot, saves and syncs custom colors, and applies the color to materials by slot name and to nodes through the `colorScale0` shader parameter. Relies on `PlaceableConfigurationItemColor.DEFAULT_COLORS` and `DEFAULT_COLORS_PATCH_1_2`, which are not defined in this file (UNVERIFIED).

- **PlaceableConfigurationItemColor** inherits from `PlaceableConfigurationItem` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableConfigurationItemColor.new(configName: any, customMt: any)` | 18 | ✍ Creates a color config item via the parent constructor, with custom-color and manual-config flags off. Note: the `customMt` argument is ignored. |
| `PlaceableConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 | ✍ Loads base data, then the color from `#color` (material template name or 3-value RGB), `#uiColor`, `#materialTemplateName` and `#colorOffset` (default 0.71). Defaults to white and flags the item as manual. Returns false if the parent load fails. |
| `PlaceableConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 80 | ✍ Calls the parent save, then for a custom color item also writes the chosen color and material template name from the configuration data. |
| `PlaceableConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 96 | ✍ Calls the parent load, then for a custom color item reads the saved color and material template name into the configuration data. |
| `PlaceableConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 107 | ✍ For custom colors, reads a compressed RGB color and a material template index from the stream and stores them in the configuration data. |
| `PlaceableConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 119 | ✍ For custom colors, writes the compressed RGB color (white if missing) and the material template index, clamped to the allowed range. |
| `PlaceableConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 135 | ✍ For custom colors, returns true if two configuration data tables differ by color (tolerance 0.00001 per channel, or one missing) or by material template name. Otherwise false. |
| `PlaceableConfigurationItemColor:getColor(placeable: any)` | 157 | ✍ Returns the effective color of this item for a placeable (a copy) and the color offset. |
| `PlaceableConfigurationItemColor:getColorAndMaterialFromPlaceable(placeable: any)` | 164 | ✍ Returns a copy of the color, the material template name and the color offset, using the placeable's stored configuration data when present instead of the item defaults. |
| `PlaceableConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 188 | ✍ Runs the parent size hook only for items with a config key, skipping dynamic color entries that have no XML definition. |
| `PlaceableConfigurationItemColor:onPostLoad(placeable: any, configId: any)` | 197 | ✍ After the parent hook, applies the color to every `.material` slot via `applyColor` on the placeable root, and sets the `colorScale0` shader parameter on every `.node` entry. |
| `PlaceableConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 241 | ✍ Builds the default color items (one per `DEFAULT_COLORS` material, plus a non-selectable custom color item) when `#useDefaultColors` is set or the FS25_unlimitedColorConfigurations mod is loaded. Also makes sure a default item exists. |
| `PlaceableConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 309 | ✍ Maps an old numeric config id (from before patch 3) to the index and save id of the item whose save id is the matching `DEFAULT_COLORS_PATCH_1_2` material name. Returns nil, nil when no match. |
| `PlaceableConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 337 | ✍ Registers the parent paths plus defaultColorIndex, useDefaultColors, price, `.material(?)#slotName`, `.node(?)#node`, colorOffset, color, uiColor and materialTemplateName. |
| `PlaceableConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 354 | ✍ Registers the parent savegame paths plus colorOffset, color (3 values) and materialTemplateName. |
