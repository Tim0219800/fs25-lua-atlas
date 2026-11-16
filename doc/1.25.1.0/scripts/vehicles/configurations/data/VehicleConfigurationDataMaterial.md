# vehicles/configurations/data/VehicleConfigurationDataMaterial.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataMaterial.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataMaterial.lua` — FS25 1.25.1.0

✍ Configuration data module that adds material changes to every configuration: either applying a VehicleMaterial (base, design, rim color or XML-defined) to a target material slot, or replacing one slot material by another over the vehicle components.

- **VehicleConfigurationDataMaterial** (l.10)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataMaterial.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 14 | ✍ Static. Registers (shared registration) the .material entries: VehicleMaterial paths, ignoreWarning, node, source and target slot names, useBaseColor, useDesignColorIndex (1 to 16) and useRimColor. |
| `VehicleConfigurationDataMaterial.onLoadFinished(vehicle: any, configItem: any, configId: any, ...: any)` | 34 | ✍ For each .material entry: with a materialSlotName, applies the material from the base, design or rim color configuration or a new one from XML, with a warning if the slot is missing; otherwise swaps the source slot material for the target one on the vehicle or a given node, with warnings for missing or unpaired names. |
