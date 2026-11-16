# vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataOverwrites.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua` — FS25 1.25.1.0

✍ Configuration data module that lets a configuration edit the vehicle's in-memory XML before loading: remove properties, set string values, or clear a list while keeping one item.

- **VehicleConfigurationDataOverwrites** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataOverwrites.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers the .xmlOverwrites entries: remove (path), set (path, value) and clearList (path, keepIndex). |
| `VehicleConfigurationDataOverwrites.onPreLoad(vehicle: any, configItem: any, configId: any)` | 24 | ✍ On the vehicle XML, removes the listed paths, sets the listed values as strings, and for each clearList removes every item of the list except keepIndex. Skipped without a config key. |
