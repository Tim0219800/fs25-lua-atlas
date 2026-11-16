# vehicles/configurations/VehicleConfigurationItemWheel.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItemWheel.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemWheel.lua` — FS25 1.25.1.0

✍ Configuration item (subclass of VehicleConfigurationItem) for wheels. Besides brand and speed values, it can generate wheel configurations dynamically from tire dimensions in the vehicle XML, using g_wheelManager to find matching tires, whitelists of tire combinations and tire categories. It rewrites the in-memory XML of generated entries, adjusts the vehicle width, and offers a fallback matcher for renamed save ids.

- **VehicleConfigurationItemWheel** inherits from `VehicleConfigurationItem` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItemWheel.new(configName: any, customMt: any)` | 20 | ✍ Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor. |
| `VehicleConfigurationItemWheel:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 28 | ✍ Loads brand and speed values and reads base wheel data (radius, width, offsets) from dimensions or wheel files. If wheels define dimensions it prepares the dynamic generation data (tire categories, tire combination whitelists merged through parent configs, max dynamic count); a brand on a dynamic config is refused with a warning. Returns true, or false if the parent fails. |
| `VehicleConfigurationItemWheel:getNeedsRenaming(otherItem: any)` | 225 | ✍ Returns false when wheel brand names differ, otherwise uses the parent name comparison, so same-named entries are only renamed within the same brand. |
| `VehicleConfigurationItemWheel:onSizeLoad(xmlFile: any, sizeData: any)` | 235 | ✍ Applies the parent size handling. For generated configs it also writes the generated XML and, unless a size width is defined manually, widens sizeData.width by the largest extra tire width, offsets and additional wheel offsets. |
| `VehicleConfigurationItemWheel.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 298 | ✍ Static. After the parent postLoad, makes each base item with dimension combinations non-selectable and generates dynamic entries from it, then warns about selectable items without a brand if any item has one. |
| `VehicleConfigurationItemWheel.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 336 | ✍ Static. For an unknown save id, splits ids at underscores and returns the index and saveId of the config sharing the longest leading run of parts, or nil, nil. |
| `VehicleConfigurationItemWheel.generateConfigurations(configurationItems: any, xmlFile: any, configName: any, baseConfigItem: any)` | 366 | ✍ Static. Asks g_wheelManager for tires matching the dimension combinations and appends one dynamic item per combination, copying price, default flag, speeds, dependent configs and shop offsets from the base item, with saveId made of base id and wheel id. |
| `VehicleConfigurationItemWheel:applyGeneratedConfiguration(xmlFile: any)` | 420 | ✍ For a dynamic config, copies the base config subtree in the in-memory XML, sets the real tire filename in place of dimensions and adjusts the physics yOffset by the radius change; wheels without a tire get a dummy tag so the parent wheel loads. |
| `VehicleConfigurationItemWheel:applyObjectChanges(vehicle: any, configurationIndexToParentConfigIndex: any, index: any)` | 462 | ✍ Applies the object changes of this wheel configuration to the vehicle, first recursing into the parent configuration so parent changes are applied before child ones. |
| `VehicleConfigurationItemWheel.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 477 | ✍ Static. Registers the parent XML paths plus brand, maxForwardSpeed and maxForwardSpeedShop. |
