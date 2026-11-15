# shop/StoreItemUtil.lua

Source : `dataS/scripts/shop/StoreItemUtil.lua` — FS25 1.25.1.0

- **StoreItemUtil** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `StoreItemUtil.getIsVehicle(storeItem: table) → boolean` | 17 |  |
| `StoreItemUtil.getIsAnimal(storeItem: table) → boolean` | 25 |  |
| `StoreItemUtil.getIsPlaceable(storeItem: table) → boolean` | 33 |  |
| `StoreItemUtil.getIsObject(storeItem: table) → boolean` | 41 |  |
| `StoreItemUtil.getIsHandTool(storeItem: table) → boolean` | 49 |  |
| `StoreItemUtil.getIsConfigurable(storeItem: table) → boolean` | 58 |  |
| `StoreItemUtil.getCanBeShownInConfigScreen(storeItem: table) → boolean` | 89 |  |
| `StoreItemUtil.getIsLeasable(storeItem: table) → boolean` | 98 |  |
| `StoreItemUtil.getDefaultConfigId(storeItem: table, configurationName: string) → integer` | 107 |  |
| `StoreItemUtil.getDefaultPrice(storeItem: table, configurations: table?) → integer` | 116 |  |
| `StoreItemUtil.getDailyUpkeep(storeItem: table, configurations: table?) → integer` | 125 |  |
| `StoreItemUtil.getCosts(storeItem: table, configurations: table?, costType: string) → integer` | 135 |  |
| `StoreItemUtil.getFunctionsFromXML(xmlFile: XMLFile, storeDataXMLName: string, customEnvironment: string) → table?` | 199 |  |
| `StoreItemUtil.loadSpecsFromXML(item: any)` | 215 |  |
| `StoreItemUtil.getSpecsFromXML(specTypes: table, species: XMLFile, xmlFile: XMLFile, customEnvironment: string, baseDirectory: any) → table` | 238 |  |
| `StoreItemUtil.getBrandIndexFromXML(xmlFile: XMLFile, storeDataXMLKey: string) → integer` | 262 |  |
| `StoreItemUtil.getVRamUsageFromXML(xmlFile: XMLFile, storeDataXMLName: string) → integer, integer, boolean` | 274 |  |
| `StoreItemUtil.getSubConfigurationIndex(storeItem: any, configName: any, configIndex: any)` | 290 |  |
| `StoreItemUtil.getSubConfigurationItems(storeItem: any, configName: any, state: any)` | 308 |  |
| `StoreItemUtil.getSizeValues(xmlFilename: any, baseName: any, rotationOffset: any, configurations: any)` | 317 |  |
| `StoreItemUtil.getSizeValuesFromXML(xmlFilename: any, xmlFile: any, baseName: any, rotationOffset: any, configurations: any)` | 337 |  |
| `StoreItemUtil.getSizeValuesFromXMLByKey(xmlFilename: any, xmlFile: any, baseName: any, baseKey: any, elementKey: any, configKey: any, rotationOffset: any, configurations: any, defaults: any)` | 343 |  |
| `StoreItemUtil.registerConfigurationSetXMLPaths(schema: any, baseKey: any)` | 399 |  |
