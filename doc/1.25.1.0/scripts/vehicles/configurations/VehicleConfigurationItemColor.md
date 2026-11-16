# vehicles/configurations/VehicleConfigurationItemColor.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItemColor.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemColor.lua` — FS25 1.25.1.0

✍ Configuration item (subclass of VehicleConfigurationItem) for vehicle colors. It resolves colors and material templates through g_vehicleMaterialManager, builds VehicleMaterial objects, generates the default brand colors plus a custom color option when requested, applies the color to materials of the vehicle, and writes custom colors to the savegame and the network stream.

- **VehicleConfigurationItemColor** inherits from `VehicleConfigurationItem` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItemColor.new(configName: any, customMt: any)` | 18 | ✍ Constructor. Calls the parent constructor and sets isCustomColor and isManualConfig to false. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor. |
| `VehicleConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 | ✍ Loads the parent data, then the color (template name or an rgb triplet, warning if not 3 values), uiColor, materialTemplateName, isMetallic and isMat. Chrome and silver templates change the UI color; defaults to white and marks the item as manual config. Returns false if the parent fails. |
| `VehicleConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 90 | ✍ Calls the parent save; for the custom color entry also writes the chosen color and material template name from configurationData. |
| `VehicleConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 106 | ✍ Calls the parent method; for the custom color entry reads color and materialTemplateName back into configurationData. |
| `VehicleConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 117 | ✍ Network read for the custom color entry: reads a compressed color and a material template index (resolved to a name) into configurationData. Does nothing for other entries. |
| `VehicleConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 129 | ✍ Network write counterpart: writes the compressed color (white if none) and the template index clamped to the allowed range. Only for the custom color entry. |
| `VehicleConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 145 | ✍ For the custom color entry, returns true if the colors differ by more than 0.00001 on any channel, if only one has a color, or if the template names differ. Otherwise false. |
| `VehicleConfigurationItemColor:updateMaterial(vehicle: any)` | 167 | ✍ Creates the cached VehicleMaterial of this item (recreated each call for custom colors) using the color and template resolved from the vehicle. |
| `VehicleConfigurationItemColor:getColor()` | 184 | ✍ Returns a copy of the color as a three-value table. |
| `VehicleConfigurationItemColor:getMaterial(vehicle: any)` | 190 | ✍ Refreshes the material for the given vehicle and returns the VehicleMaterial. |
| `VehicleConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 198 | ✍ Applies the parent size handling only when the item has an XML config key, so dynamically generated color entries are skipped. |
| `VehicleConfigurationItemColor:getColorAndMaterialFromVehicle(vehicle: any)` | 207 | ✍ Returns color and material template name, taking the vehicle's per-configuration data (custom color) over the item defaults when present. |
| `VehicleConfigurationItemColor:onPostLoad(object: any, configId: any)` | 229 | ✍ After the parent stage, iterates the .material entries of the configuration in the vehicle XML, builds each material (optional contrast color from brightness threshold), loads it and applies it to the vehicle slot; warns if the slot name is missing or not found. |
| `VehicleConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 269 | ✍ Static. With useDefaultColors (or the FS25_unlimitedColorConfigurations mod loaded) it appends the default brand color items and a non-selectable custom color item; also picks the first item as default when none is flagged and no defaultColorIndex is given. |
| `VehicleConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 348 | ✍ Static. Maps an old numeric save id (from before patch 3, color index based) to the current brand-material save id; returns index and saveId, or nil, nil if not resolvable. |
| `VehicleConfigurationItemColor.getMaterialByColorConfiguration(vehicle: any, configName: any)` | 376 | ✍ Static. Finds the vehicle's selected item for the named color configuration in the store item and returns its VehicleMaterial, or nil if it is not a color item. |
| `VehicleConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 396 | ✍ Static. Registers the color specific XML attributes (default color options, price, base template, .material entries with contrast settings, color, uiColor, isMetallic, isMat, materialTemplateName). |
| `VehicleConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 420 | ✍ Static. Registers the parent savegame paths plus the custom color and materialTemplateName attributes. |
