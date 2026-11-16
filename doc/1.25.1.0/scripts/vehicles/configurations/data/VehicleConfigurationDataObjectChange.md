# vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataObjectChange.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataObjectChange.lua` — FS25 1.25.1.0

✍ Configuration data module that adds ObjectChangeUtil object changes to every configuration, applied either at load or after post-load depending on the postLoadObjectChange flag.

- **VehicleConfigurationDataObjectChange** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataObjectChange.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers the #postLoadObjectChange attribute and the object change XML paths for the configuration. |
| `VehicleConfigurationDataObjectChange.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Reads postLoadObjectChange (default false) from the base key into the config item. |
| `VehicleConfigurationDataObjectChange.onLoad(vehicle: any, configItem: any, configId: any)` | 27 | ✍ When the item is not flagged post-load, applies the object changes of the chosen configuration to the vehicle components during load. |
| `VehicleConfigurationDataObjectChange.onPostLoad(vehicle: any, configItem: any, configId: any)` | 36 | ✍ When the item is flagged post-load, applies the object changes at the post-load stage instead. |
