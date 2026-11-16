# vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua

*[Version française](../../../../fr/scripts/vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.md)*

Source: `dataS/scripts/vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua` — FS25 1.25.1.0

✍ Configuration data module that adds extra mass to vehicle components per configuration, optionally shifting the center of mass and tuning dependent component joint spring and damping factors. Where it is registered into VehicleConfigurationItem.GLOBAL_DATA is not in this file (UNVERIFIED).


## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleConfigurationDataAdditionalMass.registerXMLPaths(schema: any, rootPath: any, configPath: any)` | 15 | ✍ Static. Registers (as a shared registration) the .component entries: node, additionalMassNode, offset, additionalMass, useTotalMassReference and dependentComponentJoint index and factors. |
| `VehicleConfigurationDataAdditionalMass.onLoad(vehicle: any, configItem: any, configId: any)` | 33 | ✍ For each component entry of the configuration, adds additionalMass (XML value times 0.001, so kg to t is assumed, UNVERIFIED) to the component default mass, moves its center of mass toward the given node or offset by the mass ratio, and sets dependent joint spring and damping factors if supported. |
