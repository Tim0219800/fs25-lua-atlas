# vehicles/configurations/VehicleConfigurationItemMotor.lua

*[Version française](../../../fr/scripts/vehicles/configurations/VehicleConfigurationItemMotor.md)*

Source: `dataS/scripts/vehicles/configurations/VehicleConfigurationItemMotor.lua` — FS25 1.25.1.0

✍ Configuration item (subclass of VehicleConfigurationItem) for motor options. It only adds values shown in the shop (power in hp, max speed) and an index of the consumer configuration to use.

- **VehicleConfigurationItemMotor** inherits from `VehicleConfigurationItem` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationItemMotor.new(configName: any, customMt: any)` | 18 | ✍ Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor. |
| `VehicleConfigurationItemMotor:loadFromXML(xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 26 | ✍ Loads the parent data, then #hp, #maxSpeed and #consumerConfigurationIndex. Returns false if the parent load fails. |
| `VehicleConfigurationItemMotor.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 40 | ✍ Static. Registers the parent XML paths plus hp, maxSpeed and consumerConfigurationIndex. |
