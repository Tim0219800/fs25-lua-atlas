# placeables/configurations/PlaceableConfigurationItemColor.lua

Source: `dataS/scripts/placeables/configurations/PlaceableConfigurationItemColor.lua` — FS25 1.25.1.0

- **PlaceableConfigurationItemColor** inherits from `PlaceableConfigurationItem` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableConfigurationItemColor.new(configName: any, customMt: any)` | 18 |  |
| `PlaceableConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 |  |
| `PlaceableConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 80 |  |
| `PlaceableConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 96 |  |
| `PlaceableConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 107 |  |
| `PlaceableConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 119 |  |
| `PlaceableConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 135 |  |
| `PlaceableConfigurationItemColor:getColor(placeable: any)` | 157 |  |
| `PlaceableConfigurationItemColor:getColorAndMaterialFromPlaceable(placeable: any)` | 164 |  |
| `PlaceableConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 188 |  |
| `PlaceableConfigurationItemColor:onPostLoad(placeable: any, configId: any)` | 197 |  |
| `PlaceableConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 241 |  |
| `PlaceableConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 309 |  |
| `PlaceableConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 337 |  |
| `PlaceableConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 354 |  |
