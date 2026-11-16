# vehicles/configurations/VehicleConfigurationItemTreeSapling.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItemTreeSapling.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemTreeSapling.lua` — FS25 1.25.1.0

✍ Configuration item (subclass of VehicleConfigurationItem) for tree sapling vehicles (planters). It stores the sapling fill unit, tree type, variation and optional i3d file, and can replace the item list by one entry per plantable tree type of the map (g_treePlantManager).

- **VehicleConfigurationItemTreeSapling** inherits from `VehicleConfigurationItem` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItemTreeSapling.new(configName: any, customMt: any)` | 18 | ✍ Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor. |
| `VehicleConfigurationItemTreeSapling:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Loads the parent data, then #useMapTreeTypes (reading the capacity from the store data as number of saplings), #fillUnitIndex (default 1), #treeType (default spruce), #variationName and #filename. Returns false if the parent fails. |
| `VehicleConfigurationItemTreeSapling.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 46 | ✍ Static. After the parent postLoad, if an item uses map tree types it replaces the whole list with generated entries and stops. |
| `VehicleConfigurationItemTreeSapling.generateConfigurations(configurationItems: any, xmlFile: any, configName: any, baseConfigItem: any)` | 59 | ✍ Static. Empties the list, then adds one item per tree type with several growth stages that supports planting, priced as sapling price times the number of saplings, saveId set to the tree type name. |
| `VehicleConfigurationItemTreeSapling.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 88 | ✍ Static. Registers the parent XML paths plus useMapTreeTypes, fillUnitIndex, treeType, variationName and filename. |
