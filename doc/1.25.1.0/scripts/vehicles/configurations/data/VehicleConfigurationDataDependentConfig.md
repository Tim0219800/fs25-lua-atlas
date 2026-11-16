# vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataDependentConfig.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataDependentConfig.lua` — FS25 1.25.1.0

✍ Configuration data module that lets a configuration item list other configurations (by name and index) that should be set along with it.

- **VehicleConfigurationDataDependentConfig** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataDependentConfig.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers the .dependentConfiguration entries with #name and #index. |
| `VehicleConfigurationDataDependentConfig.loadConfigItem(configItem: any, xmlFile: any, baseKey: any, configKey: any, baseDirectory: any, customEnvironment: any)` | 21 | ✍ Reads the dependent configurations of an item into configItem.dependentConfigurations, keeping only entries with both name and index. How they are applied is not in this file (UNVERIFIED). |
