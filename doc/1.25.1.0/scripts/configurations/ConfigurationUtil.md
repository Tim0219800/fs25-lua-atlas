# configurations/ConfigurationUtil.lua

Source: `dataS/scripts/configurations/ConfigurationUtil.lua` — FS25 1.25.1.0

- **ConfigurationUtil** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ConfigurationUtil.addBoughtConfiguration(manager: string, object: integer, name: string, id: integer)` | 22 |  |
| `ConfigurationUtil.hasBoughtConfiguration(object: string, name: string, id: integer) → boolean` | 36 |  |
| `ConfigurationUtil.setConfiguration(object: string, name: string, id: integer)` | 47 |  |
| `ConfigurationUtil.getColorByConfigId(object: string, configName: string, configId: integer) → table` | 56 |  |
| `ConfigurationUtil.getConfigItemByConfigId(configFileName: string, configName: string, configId: integer)` | 75 |  |
| `ConfigurationUtil.raiseConfigurationItemEvent(object: table, eventName: string)` | 93 |  |
| `ConfigurationUtil.getSaveIdByConfigId(configFileName: table, configName: string, configId: integer) → string` | 115 |  |
| `ConfigurationUtil.saveConfigurationToXMLFile(itemConfigurations: table, configName: string, configId: integer, xmlFile: table, key: string, isActive: boolean, configurationData: table, xmlIndex: integer) → integer` | 141 |  |
| `ConfigurationUtil.saveConfigurationsToXMLFile(configFileName: string, xmlFile: table, key: string, configurations: table, boughtConfigurations: table, configurationData: table)` | 169 |  |
| `ConfigurationUtil.loadConfigurationsFromXMLFile(configFileName: string, xmlFile: table, key: string) → table, table, table` | 190 |  |
| `ConfigurationUtil.readConfigurationsFromStream(manager: table, streamId: integer, connection: table, configFileName: string) → table, table, table` | 269 |  |
| `ConfigurationUtil.writeConfigurationsToStream(manager: table, streamId: integer, connection: table, configFileName: string, configurations: table, boughtConfigurations: table, configurationData: table)` | 320 |  |
| `ConfigurationUtil.getConfigurationDataHasChanged(configFileName: string, configurationData1: table, configurationData2: table) → boolean` | 350 |  |
| `ConfigurationUtil.getConfigIdBySaveId(configFileName: table, configName: string, configId: string) → integer` | 385 |  |
| `ConfigurationUtil.getConfigurationValue(xmlFile: XMLFile, key: string, subKey: string, param: string, defaultValue: any, fallbackConfigKey: string?, fallbackOldKey: string?) → any` | 428 |  |
| `ConfigurationUtil.getXMLConfigurationKey(xmlFile: XMLFile, index: integer, key: string, defaultKey: string?, configurationKey: string) → string?, integer` | 455 |  |
| `ConfigurationUtil.getConfigurationsFromXML(manager: XMLFile, xmlFile: XMLFile, key: string, baseDir: string, customEnvironment: string, isMod: boolean, storeItem: any) → table` | 480 |  |
| `ConfigurationUtil.getConfigurationSetsFromXML(storeItem: table, xmlFile: XMLFile, key: string, baseDir: string, customEnvironment: string, isMod: boolean) → table` | 540 |  |
| `ConfigurationUtil.getSubConfigurationsFromConfigurations(manager: any, configurations: any)` | 606 |  |
| `ConfigurationUtil.getDefaultConfigIdFromItems(configItems: table) → integer` | 637 |  |
| `ConfigurationUtil.getConfigurationsMatchConfigSets(configurations: any, configSets: any)` | 659 |  |
| `ConfigurationUtil.getClosestConfigurationSet(configurations: any, configSets: any)` | 679 |  |
| `ConfigurationUtil.isColorMetallic(materialId: any)` | 700 |  |
