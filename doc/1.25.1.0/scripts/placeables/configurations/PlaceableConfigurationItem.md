# placeables/configurations/PlaceableConfigurationItem.lua

Source : `dataS/scripts/placeables/configurations/PlaceableConfigurationItem.lua` — FS25 1.25.1.0

- **PlaceableConfigurationItem** (l.19)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableConfigurationItem.new(configName: any, customMt: any)` | 25 |  |
| `PlaceableConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 46 |  |
| `PlaceableConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 73 |  |
| `PlaceableConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 81 |  |
| `PlaceableConfigurationItem:setIndex(index: any)` | 86 |  |
| `PlaceableConfigurationItem:getNeedsRenaming(otherItem: any)` | 96 |  |
| `PlaceableConfigurationItem:onPreLoad(placeable: any, configId: any)` | 102 |  |
| `PlaceableConfigurationItem:onLoad(placeable: any, configId: any)` | 112 |  |
| `PlaceableConfigurationItem:onPostLoad(placeable: any, configId: any)` | 122 |  |
| `PlaceableConfigurationItem:onLoadFinished(placeable: any, configId: any)` | 132 |  |
| `PlaceableConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 142 |  |
| `PlaceableConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 152 |  |
| `PlaceableConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 178 |  |
| `PlaceableConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 199 |  |
