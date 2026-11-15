# vehicles/configurations/VehicleConfigurationItem.lua

Source : `dataS/scripts/vehicles/configurations/VehicleConfigurationItem.lua` — FS25 1.25.1.0

- **VehicleConfigurationItem** (l.27)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `VehicleConfigurationItem.new(configName: any, customMt: any)` | 31 |  |
| `VehicleConfigurationItem:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 55 |  |
| `VehicleConfigurationItem:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 110 |  |
| `VehicleConfigurationItem:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 118 |  |
| `VehicleConfigurationItem:setIndex(index: any)` | 123 |  |
| `VehicleConfigurationItem:getNeedsRenaming(otherItem: any)` | 133 |  |
| `VehicleConfigurationItem:onPreLoad(object: any, configId: any)` | 139 |  |
| `VehicleConfigurationItem:onLoad(object: any, configId: any)` | 149 |  |
| `VehicleConfigurationItem:onPrePostLoad(object: any, configId: any)` | 159 |  |
| `VehicleConfigurationItem:onPostLoad(object: any, configId: any)` | 169 |  |
| `VehicleConfigurationItem:onLoadFinished(object: any, configId: any)` | 179 |  |
| `VehicleConfigurationItem:onSizeLoad(xmlFile: any, sizeData: any)` | 189 |  |
| `VehicleConfigurationItem.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any)` | 199 |  |
| `VehicleConfigurationItem.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 226 |  |
| `VehicleConfigurationItem.registerSavegameXMLPaths(schema: any, basePath: any)` | 257 |  |
