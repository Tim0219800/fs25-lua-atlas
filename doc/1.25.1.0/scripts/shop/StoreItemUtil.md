# shop/StoreItemUtil.lua

*[Version française](../../fr/scripts/shop/StoreItemUtil.md)*

Source: `dataS/scripts/shop/StoreItemUtil.lua` — FS25 1.25.1.0

✍ Static helpers for store item tables: species checks (vehicle, animal, placeable, object, hand tool), configurability and leasing checks, cost sums including configuration extras, and parsing of functions, specs, brand, VRAM usage and size from store XML. It also computes footprint sizes with configuration overrides and 90-degree rotation, and registers the configuration-set XML schema paths. Depends on g_storeManager, g_brandManager, StoreSpecies and ConfigurationUtil defined elsewhere.

- **StoreItemUtil** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `StoreItemUtil.getIsVehicle(storeItem: table) → boolean` | 17 | ✍ Returns true if the store item is non-nil and its species is StoreSpecies.VEHICLE. |
| `StoreItemUtil.getIsAnimal(storeItem: table) → boolean` | 25 | ✍ Returns true if the store item is non-nil and its species is StoreSpecies.ANIMAL. |
| `StoreItemUtil.getIsPlaceable(storeItem: table) → boolean` | 33 | ✍ Returns true if the store item is non-nil and its species is StoreSpecies.PLACEABLE. |
| `StoreItemUtil.getIsObject(storeItem: table) → boolean` | 41 | ✍ Returns true if the store item is non-nil and its species is StoreSpecies.OBJECT. |
| `StoreItemUtil.getIsHandTool(storeItem: table) → boolean` | 49 | ✍ Returns true if the store item is non-nil and its species is StoreSpecies.HANDTOOL. |
| `StoreItemUtil.getIsConfigurable(storeItem: table) → boolean` | 58 | ✍ Returns true if the item has configurations and at least one configuration type offers more than one selectable option (isSelectable not false). |
| `StoreItemUtil.getCanBeShownInConfigScreen(storeItem: table) → boolean` | 89 | ✍ Returns false for hand tools, which are bought directly, and true for every other item, which goes through the shop config screen. |
| `StoreItemUtil.getIsLeasable(storeItem: table) → boolean` | 98 | ✍ Returns true if the item allows leasing, has a runningLeasingFactor and is not a placeable. |
| `StoreItemUtil.getDefaultConfigId(storeItem: table, configurationName: string) → integer` | 107 | ✍ Returns the default configuration index for a configuration name by delegating to ConfigurationUtil.getDefaultConfigIdFromItems. Errors if the item has no configurations table. |
| `StoreItemUtil.getDefaultPrice(storeItem: table, configurations: table?) → integer` | 116 | ✍ Returns the base price plus the price of each selected configuration, via getCosts with the `price` field. |
| `StoreItemUtil.getDailyUpkeep(storeItem: table, configurations: table?) → integer` | 125 | ✍ Returns the base daily upkeep plus the upkeep of each selected configuration, via getCosts with the `dailyUpkeep` field. |
| `StoreItemUtil.getCosts(storeItem: table, configurations: table?, costType: string) → integer` | 135 | ✍ Sums the item's value for a cost field (0 if absent) with the same field of each selected configuration item. Returns 0 for a nil item; the configurations argument must be a table when the item has configurations. |
| `StoreItemUtil.getFunctionsFromXML(xmlFile: XMLFile, storeDataXMLName: string, customEnvironment: string) → table?` | 199 | ✍ Reads the list of function texts under `<parent>.functions.function`, translated in the given mod environment, and returns them as an array, or nil if none are present. |
| `StoreItemUtil.loadSpecsFromXML(item: any)` | 215 | ✍ Lazily loads an item's specs from its XML if not already loaded, then does the same recursively for the items of its bundle. Spec loading itself is done by getSpecsFromXML. |
| `StoreItemUtil.getSpecsFromXML(specTypes: table, species: XMLFile, xmlFile: XMLFile, customEnvironment: string, baseDirectory: any) → table` | 238 | ✍ Builds a specs table by calling each registered spec type's loadFunc for the item's species, keyed by spec name. Returns the table (possibly empty). |
| `StoreItemUtil.getBrandIndexFromXML(xmlFile: XMLFile, storeDataXMLKey: string) → integer` | 262 | ✍ Reads the `.brand` name under the given key (default empty) and returns its index via g_brandManager. Unknown names log a warning and fall back to the default brand. |
| `StoreItemUtil.getVRamUsageFromXML(xmlFile: XMLFile, storeDataXMLName: string) → integer, integer, boolean` | 274 | ✍ Reads memory usage values from the XML and returns shared VRAM (vertex, index and texture buffers), per-instance VRAM (instance vertex and index buffers) and the ignoreVramUsage flag. Units are as written in the XML (UNVERIFIED). |
| `StoreItemUtil.getSubConfigurationIndex(storeItem: any, configName: any, configIndex: any)` | 290 | ✍ Returns the position in the sub-configuration value list whose item group contains the given configuration index, or nil. Errors if the item has no subConfigurations entry for that name. |
| `StoreItemUtil.getSubConfigurationItems(storeItem: any, configName: any, state: any)` | 308 | ✍ Returns the list of configuration items belonging to the sub-configuration value at position `state`. Errors if the item has no subConfigurations entry for that name. |
| `StoreItemUtil.getSizeValues(xmlFilename: any, baseName: any, rotationOffset: any, configurations: any)` | 317 | ✍ Loads a vehicle XML and returns its footprint size table (width, length, height and offsets) for a rotation and configurations. Returns default Vehicle sizes if the file cannot be loaded. |
| `StoreItemUtil.getSizeValuesFromXML(xmlFilename: any, xmlFile: any, baseName: any, rotationOffset: any, configurations: any)` | 337 | ✍ Reads the base size from an already open vehicle XML, using the `base.size` element and Vehicle.DEFAULT_SIZE defaults, by delegating to getSizeValuesFromXMLByKey. |
| `StoreItemUtil.getSizeValuesFromXMLByKey(xmlFilename: any, xmlFile: any, baseName: any, baseKey: any, elementKey: any, configKey: any, rotationOffset: any, configurations: any, defaults: any)` | 343 | ✍ Reads size attributes, lets selected configuration items adjust them through onSizeLoad and applies optional minimum sizes. The rotation is snapped to 90-degree steps, swapping width and length and rotating the offsets accordingly. Returns the size table. |
| `StoreItemUtil.registerConfigurationSetXMLPaths(schema: any, baseKey: any)` | 399 | ✍ Registers on an XML schema the paths of the `configurationSets` block (title, yes/no flag, sets with name, params, default flag and configuration name, index and showWarning), matching what ConfigurationUtil.getConfigurationSetsFromXML reads. |
