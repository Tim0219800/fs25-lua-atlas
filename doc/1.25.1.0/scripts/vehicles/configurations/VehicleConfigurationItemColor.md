# vehicles/configurations/VehicleConfigurationItemColor.lua

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemColor.lua` — FS25 1.25.1.0

- **VehicleConfigurationItemColor** inherits from `VehicleConfigurationItem` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VehicleConfigurationItemColor.new(configName: any, customMt: any)` | 18 |  |
| `VehicleConfigurationItemColor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 29 |  |
| `VehicleConfigurationItemColor:saveToXMLFile(xmlFile: any, key: any, isActive: any, configurationData: any)` | 90 |  |
| `VehicleConfigurationItemColor:loadFromSavegameXMLFile(xmlFile: any, key: any, configurationData: any)` | 106 |  |
| `VehicleConfigurationItemColor:readFromStream(streamId: any, connection: any, configurationData: any)` | 117 |  |
| `VehicleConfigurationItemColor:writeToStream(streamId: any, connection: any, configurationData: any)` | 129 |  |
| `VehicleConfigurationItemColor:hasDataChanged(configurationData1: any, configurationData2: any)` | 145 |  |
| `VehicleConfigurationItemColor:updateMaterial(vehicle: any)` | 167 |  |
| `VehicleConfigurationItemColor:getColor()` | 184 |  |
| `VehicleConfigurationItemColor:getMaterial(vehicle: any)` | 190 |  |
| `VehicleConfigurationItemColor:onSizeLoad(xmlFile: any, sizeData: any)` | 198 |  |
| `VehicleConfigurationItemColor:getColorAndMaterialFromVehicle(vehicle: any)` | 207 |  |
| `VehicleConfigurationItemColor:onPostLoad(object: any, configId: any)` | 229 |  |
| `VehicleConfigurationItemColor.postLoad(xmlFile: any, baseKey: any, baseDir: any, customEnvironment: any, isMod: any, configurationItems: any, storeItem: any, configName: any)` | 269 |  |
| `VehicleConfigurationItemColor.getFallbackConfigId(configs: any, configId: any, configName: any, configFileName: any)` | 348 |  |
| `VehicleConfigurationItemColor.getMaterialByColorConfiguration(vehicle: any, configName: any)` | 376 |  |
| `VehicleConfigurationItemColor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 396 |  |
| `VehicleConfigurationItemColor.registerSavegameXMLPaths(schema: any, basePath: any)` | 420 |  |
