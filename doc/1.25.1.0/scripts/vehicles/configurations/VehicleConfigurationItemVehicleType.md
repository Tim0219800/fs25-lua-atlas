# vehicles/configurations/VehicleConfigurationItemVehicleType.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItemVehicleType.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemVehicleType.lua` — FS25 1.25.1.0

✍ Configuration item (subclass of VehicleConfigurationItem) that selects which vehicle type a configuration uses. It only stores the vehicleType name read from XML.

- **VehicleConfigurationItemVehicleType** inherits from `VehicleConfigurationItem` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItemVehicleType.new(configName: any, customMt: any)` | 18 | ✍ Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor. |
| `VehicleConfigurationItemVehicleType:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Loads the parent data, then #vehicleType. Returns false if the parent load fails. |
| `VehicleConfigurationItemVehicleType.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 38 | ✍ Static. Registers the parent XML paths plus #vehicleType. |
