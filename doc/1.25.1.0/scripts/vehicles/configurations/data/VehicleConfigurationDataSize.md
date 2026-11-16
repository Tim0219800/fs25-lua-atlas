# vehicles/configurations/data/VehicleConfigurationDataSize.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataSize.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataSize.lua` — FS25 1.25.1.0

✍ Configuration data module that lets every configuration override or extend the occupied size of the vehicle (width, length, height, minimum sizes and offsets) used for example by the shop.

- **VehicleConfigurationDataSize** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataSize.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers (shared registration) the .size attributes width, length, height, minWidth, minLength, minHeight and the three offsets. |
| `VehicleConfigurationDataSize.onSizeLoad(configItem: any, xmlFile: any, sizeData: any)` | 33 | ✍ Writes configured width, length, height and offsets into sizeData (replacing the values), and raises the minimum sizes to the larger of old and new. Skipped without a config key. |
